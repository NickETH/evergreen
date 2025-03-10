﻿Function Get-VMwareTools {
    <#
        .SYNOPSIS
            Get the current version and download URL for the VMware Tools.

        .NOTES
            Author: Bronson Magnan
            Twitter: @cit_bronson
    #>
    [OutputType([System.Management.Automation.PSObject])]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSUseSingularNouns", "")]
    [CmdletBinding(SupportsShouldProcess = $False)]
    param (
        [Parameter(Mandatory = $False, Position = 0)]
        [ValidateNotNull()]
        [System.Management.Automation.PSObject]
        $res = (Get-FunctionResource -AppName ("$($MyInvocation.MyCommand)".Split("-"))[1])
    )

    # Read the VMware version-mapping file
    $params = @{
        Uri         = $res.Get.Update.Uri
        ContentType = $res.Get.Update.ContentType
        Raw         = $True
    }
    $Content = Invoke-WebRequestWrapper @params
    If ($Null -eq $Content) {
        Write-Warning -Message "$($MyInvocation.MyCommand): Failed to return usable content from $($res.Get.Update.Uri)."
    }
    Else {
        # Format the results returns and convert into an array that we can sort and use
        Write-Verbose -Message "$($MyInvocation.MyCommand): Filtering version table with $($Content.Count) lines."
        $Lines = $Content | Where-Object { $_ -notmatch "^#" }
        $Lines = $Lines | Where-Object { $_ -notmatch "esx/0.0" }
        Write-Verbose -Message "$($MyInvocation.MyCommand): Filtered to $($Lines.Count) lines."

        Write-Verbose -Message "$($MyInvocation.MyCommand): Selecting first 20 lines."
        $Lines = $Lines | Select-Object -First 20

        Write-Verbose -Message "$($MyInvocation.MyCommand): Convert to table."
        try {
            $Lines = $Lines | ForEach-Object { $_ -replace '\s+', ',' }
            $VersionTable = $Lines | ConvertFrom-Csv -Delimiter "," -Header $res.Get.Update.CsvHeaders | `
                Sort-Object -Property @{ Expression = { [System.Version]$_.Version }; Descending = $true }
        }
        catch {
            Write-Error -Message "$($MyInvocation.MyCommand): Failed to convert version source to a table."
        }

        $LatestVersion = $VersionTable | Select-Object -First 1
        Write-Verbose -Message "$($MyInvocation.MyCommand): Found version: $($LatestVersion.Version)-$($LatestVersion.ClientBuild)"

        # Build the output object for each platform and architecture
        ForEach ($architecture in $res.Get.Download.Architecture.GetEnumerator()) {

            # Build the output object
            $PSObject = [PSCustomObject] @{
                Version      = $LatestVersion.Version
                Architecture = $architecture.Key
                URI          = $res.Get.Download.Uri -replace "#architecture", $architecture.Key `
                    -replace "#version", $LatestVersion.Version `
                    -replace "#build", $LatestVersion.ClientBuild `
                    -replace "#processor", $res.Get.Download.Architecture[$architecture.Key]
            }
            Write-Output -InputObject $PSObject
        }
    }
}
