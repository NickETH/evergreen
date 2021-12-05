Function Get-FunctionResource {
    <#
        .SYNOPSIS
            Reads the function strings from the JSON file and returns a hashtable.
    #>
    [OutputType([System.Management.Automation.PSObject])]
    [CmdletBinding(SupportsShouldProcess = $False)]
    param (
        [Parameter(Mandatory = $True, Position = 0)]
        [ValidateNotNull()]
        [System.String] $AppName
    )
    
    # Setup path to the manifests folder and the app manifest
    $Path = Join-Path -Path $MyInvocation.MyCommand.Module.ModuleBase -ChildPath "Manifests"
    $AppManifest = Join-Path -Path $Path -ChildPath "$AppName.json"

    # Read the content from the manifest file
    If (Test-Path -Path $AppManifest) {
        try {
            Write-Verbose -Message "$($MyInvocation.MyCommand): read application resource strings from [$AppManifest]"
            $content = Get-Content -Path $AppManifest -Raw -ErrorAction "SilentlyContinue"
        }
        catch {
            # We want to Throw here because this prevents the module from working
            Throw "$($MyInvocation.MyCommand): Failed to read from: $AppManifest with $($_.Exception.Message)."
        }
    }
    Else {
        Write-Error -Message "$($MyInvocation.MyCommand): manifest does not exist: $AppManifest."
    }

    # Convert the content from JSON into a hashtable
    If ($Null -ne $content) {
        try {
            If (Test-PSCore) {
                $hashTable = $content | ConvertFrom-Json -AsHashtable -ErrorAction "SilentlyContinue"
            }
            Else {
                $hashTable = $content | ConvertFrom-Json -ErrorAction "SilentlyContinue" | ConvertTo-Hashtable
            }
        }
        catch {
            # We want to Throw here because this prevents the module from working
            Throw "$($MyInvocation.MyCommand): Failed to to hashtable with: $($_.Exception.Message)"
        }

        # If we got a hashtable, return it to the pipeline
        If ($Null -ne $hashTable) {
            Write-Output -InputObject $hashTable
        }
    }
}
