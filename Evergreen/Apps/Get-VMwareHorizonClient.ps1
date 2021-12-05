﻿Function Get-VMwareHorizonClient {
    <#
        .NOTES
            Author: Aaron Parker
            Twitter: @stealthpuppy
    #>
    [OutputType([System.Management.Automation.PSObject])]
    [CmdletBinding(SupportsShouldProcess = $False)]
    param (
        [Parameter(Mandatory = $False, Position = 0)]
        [ValidateNotNull()]
        [System.Management.Automation.PSObject]
        $res = (Get-FunctionResource -AppName ("$($MyInvocation.MyCommand)".Split("-"))[1]),

        [Parameter(Mandatory = $False, Position = 1)]
        [ValidateNotNull()]
        [System.String] $Filter
    )

    # Query the Horizon Client update feed
    $params = @{
        Uri         = $res.Get.Update.Uri
        ContentType = $res.Get.Update.ContentType
    }
    $Updates = Invoke-RestMethodWrapper @params

    # Select the latest version
    #$LatestVersion = $Updates.($res.Get.Update.Property)
    Write-Verbose -Message "$($MyInvocation.MyCommand): Selecting latest version from the update data."
    $LatestVersion = $Updates.metaList.metadata | `
        Sort-Object -Property @{ Expression = { [System.Version]$_.version }; Descending = $true } | `
        Select-Object -First 1
    $UpdateList = $Updates.metaList.metadata | Where-Object { $_.version -match $LatestVersion.version }

    # $_.version number property needs to also be match to latest version in $_.url property
    If ($UpdateList.Count -gt 1) {
        Write-Verbose -Message "$($MyInvocation.MyCommand): Found $($UpdateList.Count) available updates for version: $($LatestVersion.version)."
        Write-Verbose -Message "$($MyInvocation.MyCommand): Match latest update."
        $VersionList = New-Object -TypeName "System.Collections.ArrayList"
        ForEach ($Update in $UpdateList) {
            $Version = [RegEx]::Match($Update.url, $res.Get.Update.MatchVersion).Captures.Groups[1].Value
            $VersionList.Add($Version) | Out-Null
        }

        # Find the latest version and re-filter the update data to find the latest release
        $Version = $VersionList | `
            Sort-Object -Property @{ Expression = { [System.Version]$_ }; Descending = $true } | `
            Select-Object -First 1
        Write-Verbose -Message "$($MyInvocation.MyCommand): Found version: $Version."
        Write-Verbose -Message "$($MyInvocation.MyCommand): Filter update list for version: $Version."
        $LatestVersion = $Updates.metaList.metadata | `
            Sort-Object -Property @{ Expression = { [System.Version]$_.version }; Descending = $true } | `
            Where-Object { $_.url -match $Version } | Select-Object -First 1
    }
    Else {
        Write-Verbose -Message "$($MyInvocation.MyCommand): Found one available update for version: $($LatestVersion.version)."
    }

    # Download the version specific update XML in Gzip format
    If ($Null -ne $LatestVersion) {
        $GZipFile = Save-File -Uri "$($res.Get.Download.Uri)$($LatestVersion.Url.TrimStart("../"))"
    }
    Else {
        Write-Error -Message "$($MyInvocation.MyCommand): Failed to determine metadata property for the Horizon Client latest version."
    }
    
    # Expand the downloaded Gzip file to get the XMl file
    $ExpandFile = Expand-GzipArchive -Path $GZipFile.FullName

    # Get the version specific details from the XML file
    try {
        Write-Verbose -Message "$($MyInvocation.MyCommand): Read XML content from: $ExpandFile."
        [System.XML.XMLDocument] $xmlDocument = Get-Content -Path $ExpandFile
        $Version = (Select-Xml -Xml $xmlDocument -XPath $res.Get.Download.VersionXPath | Select-Object –ExpandProperty "node").($res.Get.Download.VersionProperty)
        $FileName = (Select-Xml -Xml $xmlDocument -XPath $res.Get.Download.FileXPath | Select-Object –ExpandProperty "node").($res.Get.Download.FileProperty)
    }
    catch {
        Write-Error -Message "$($MyInvocation.MyCommand): Failed to convert metadata XML."
    }
    finally {
        Write-Verbose -Message "$($MyInvocation.MyCommand): Delete: $($GZipFile.FullName)."
        Remove-Item -Path $GZipFile.FullName -ErrorAction "SilentlyContinue"
        Write-Verbose -Message "$($MyInvocation.MyCommand): Delete: $ExpandFile."
        Remove-Item -Path $ExpandFile -ErrorAction "SilentlyContinue"
    }

    # Build the object and write to the pipeline
    If (($Null -ne $Version) -and ($Null -ne $FileName)) {
        $PSObject = [PSCustomObject] @{
            Version = "$($Version.version).$($Version.buildNumber)"
            URI     = "$($res.Get.Download.Uri)$($Version.productId)/$($Version.version)/$($Version.buildNumber)/$($FileName)"
        }
        Write-Output -InputObject $PSObject
    }
    Else {
        Write-Error -Message "$($MyInvocation.MyCommand): Failed to return usable properties from the XML file."
    }
}
