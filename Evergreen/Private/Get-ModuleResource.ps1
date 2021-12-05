Function Get-ModuleResource {
    <#
        .SYNOPSIS
            Reads the module strings from the JSON file and returns a hashtable.
    #>
    [OutputType([System.Management.Automation.PSObject])]
    [CmdletBinding(SupportsShouldProcess = $False)]
    param (
        [Parameter(Mandatory = $False, Position = 0)]
        [ValidateNotNull()]
        [ValidateScript( { If (Test-Path -Path $_ -PathType 'Leaf') { $True } Else { Throw "$($MyInvocation.MyCommand) Cannot find file $_" } })]
        [System.String] $Path = (Join-Path -Path $MyInvocation.MyCommand.Module.ModuleBase -ChildPath "Evergreen.json")
    )
    
    try {
        Write-Verbose -Message "$($MyInvocation.MyCommand): read module resource strings from [$Path]"
        $params = @{
            Path        = $Path
            Raw         = $True
            ErrorAction = "Stop"
        }
        $content = Get-Content @params
    }
    catch {
        Throw "$($MyInvocation.MyCommand): failed to read from: $Path, with: $($_.Exception.Message)"
    }

    try {
        If (Test-PSCore) {
            $script:resourceStringsTable = $content | ConvertFrom-Json -AsHashtable -ErrorAction "Stop"
        }
        Else {
            $script:resourceStringsTable = $content | ConvertFrom-Json -ErrorAction "Stop" | ConvertTo-Hashtable
        }
    }
    catch {
        Throw "$($MyInvocation.MyCommand): failed to convert strings to required object with: $($_.Exception.Message)."
    }
    If ($Null -ne $script:resourceStringsTable) {
        Write-Output -InputObject $script:resourceStringsTable
    }
}
