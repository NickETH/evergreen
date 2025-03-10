# Change log

## 2207.609

* Adds functions to create an Evergreen library - a library is a directory that contains application installers and allows you to keep multiple versions. Functions are `New-EvergreenLibrary`, `Invoke-EvergreenLibraryUpdate`, and `Get-EvergreenLibrary` [#357](https://github.com/aaronparker/evergreen/discussions/357)
* Updates `MicrosoftFSLogixApps` to revert the source URL to `https://aka.ms/fslogix/download`. Hey, Microsoft, any chance you could stop changing the source URL please!? [#359](https://github.com/aaronparker/evergreen/issues/359)
* Updates output from `Get-EvergreenApp` where a an unsupported value for `-Name` is specified. `Get-EvergreenApp` will attempt to output supported similar applications
* Fixes an issue in `AdoptiumTemurin8`, `AdoptiumTemurin11`, `AdoptiumTemurin16`, `AdoptiumTemurin17`, `AdoptiumTemurin18` to address instances where releases returned from the update feed don't include details for MSI installers [#360](https://github.com/aaronparker/evergreen/issues/360)

## 2207.596

* Adds function `Export-EvergreenApp` - exports application details gathered by `Get-EvergreenApp` to an external JSON file. This function reads any existing JSON for that application, adds the new version content, sorts for unique versions, then outputs the new content back to the target JSON file.

## 2207.592

* Updates the approach to detecting new versions in `MicrosoftWvdRemoteDesktop`. Uses update details available in JSON format and addresses issue [#352](https://github.com/aaronparker/evergreen/discussions/352)
* Fixes and issue in `VMwareTools` where the download URL returned doesn't match the latest version available [#336](https://github.com/aaronparker/evergreen/discussions/336)
* Removes hard-coded `ErrorAction = Continue` in private function `Invoke-WebRequestWrapper` to enable setting `ErrorAction` preference when calling this function from an application function

## 2206.583

* Fixes an issue with `MozillaThunderbird` when attempting to return downloads for the full language list [#350](https://github.com/aaronparker/evergreen/discussions/350)

## 2206.581

* Adds `AppVentiX` [#205](https://github.com/aaronparker/evergreen/discussions/205)
* Updates `MozillaThunderbird` to align with `MozillaFirefox` - this function will return `en-US` as the default language. Additional languages can be passed to `MozillaThunderbird` via `Get-EvergreenApp -AppParams`
* Updates private function `Get-GitHubRepoRelease` to support authentication to the GitHub API with a personal access token. The function will look for the `GITHUB_TOKEN` or `GH_TOKEN` environment variables and use the value of that variable in the authentication request, if the variable exists [#195](https://github.com/aaronparker/evergreen/discussions/195)

## 2206.574

* Adds `AutoDarkMode` [#335](https://github.com/aaronparker/evergreen/discussions/335), `CodelerityApacheNetBeans` [#339](https://github.com/aaronparker/evergreen/discussions/339), `JeremyMainGPUProfiler` [#337](https://github.com/aaronparker/evergreen/discussions/337),`EgnyteDesktopApp` [#340](https://github.com/aaronparker/evergreen/discussions/340)
* Fixes `SumatraPDFReader` due to changes in download URLs [#338](https://github.com/aaronparker/evergreen/discussions/338)

## 2205.567

* Adds `DockerDesktop` [#332](https://github.com/aaronparker/evergreen/discussions/332)
* Updates `1Password` to return 1Password 8.x update; `1Password7` will now continue to return updates for 1Password 7.x [#330](https://github.com/aaronparker/evergreen/discussions/330)
* Addresses an issue in `RCoreTeamRforWindows` to better handle when the source site is down
* Updates the source used for `MicrosoftFSLogixApps` - this is a workaround because Microsoft has changed the aka.ms link to the FSLogix Apps agent download, again. I really wish they would stop doing that.

## 2205.561

* Adds `VMwareOSOptimizationTool`
* Adds `VMwareHorizonClientAlt` (an alternative method for retrieving details for the VMware Horizon Client.)
* Fix an issue with `VMwareTools` due to changes in source data
* Fix an issue with `MattermostDesktop` due to changes in releases on the [GitHub repository](https://github.com/mattermost/desktop)

BREAKING CHANGES

* The following applications have been removed from Evergreen as they provide only links to downloads rather than direct links to installers - `CitrixAppLayeringFeed`, `CitrixApplicationDeliveryManagementFeed`, `CitrixEndpointManagementFeed`, `CitrixGatewayFeed`, `CitrixHypervisorFeed`, `CitrixLicensingFeed`, `CitrixReceiverFeed`, `CitrixSdwanFeed`, `CitrixVirtualAppsDesktopsFeed`, `CitrixWorkspaceAppFeed`

## 2205.555

* Adds `AdoptiumTemurin18`, `Tower`
* Adds `VMwareWorkstationPlayer`, `VMwareWorkstationPro` [#275](https://github.com/aaronparker/evergreen/discussions/275)
* Updates `Resolve-DnsNameWrapper` (and `GhislerTotalCommander`) to work under PowerShell Core using [DnsClient-PS](https://github.com/rmbolger/DnsClient-PS). Manual installation of DnsClient-PS on macOS or Linux is required

## 2205.549

* Fixes an issue in `TechSmithSnagit` and `GitForWindows` under Linux where filename case was preventing `Get-EvergreenApp` from sourcing application functions
* Removes `Date` property from `PuTTY` as the value is updated on each query, rather than when the version was released
* Updates `Resolve-DnsNameWrapper` with `Import-Module -Name "DnsClient"` to ensure the `Resolve-DnsName` command is available

## 2205.546

* Updates `RStudio` with new update sources for all curren branches and now returns Free and Pro editions [#318](https://github.com/aaronparker/evergreen/discussions/318)
* Fixes an issue with installers returned by `MicrosoftEdgeDriver` and `MicrosoftEdgeWebView2Runtime`
* Updates `McNeelRhino` to work under PowerShell 6/7 - resolves an issue when using `Invoke-RestMethod` which does not follow a HTTP 302 response

BREAKING CHANGES

* `RStudio` returns new properties that will require filtering the output. Properties include: `Branch`, `Channel`, `ProductName`, and `InstallerName`

## 2205.541

* Fixes `MicrosoftSsms` to address returning the latest version and binaries [#305](https://github.com/aaronparker/evergreen/discussions/305)
* Fixes an issue in `MicrosoftEdge`, `MicrosoftEdgeDriver`, `MicrosoftEdgeWebView2Runtime` where versions were sorted differently between PowerShell Core and Windows PowerShell to ensure the correct versions are returned [#311](https://github.com/aaronparker/evergreen/discussions/311)
* Fixes an issue in `VeraCrypt` where the version string returned was not correct

## 2205.537

* Adds `AdobeAcrobatProStdDC` to return the current version number and the trial installer for Adobe Acrobat DC Standard and Pro
* Fixes a regression introduced in version `2204.534` where `AdobeAcrobatReaderDC` was renamed to `AdobeAcrobatReader`

## 2204.534

* Adds `Test-EvergreenApp` that enables testing of installers returned by `Save-EvergreenApp` to determine whether the URI is valid
* Adds `AdobeAcrobatDC` that uses an alternative method to `AdobeAcrobat` to determine the current version of Adobe Acrobat Standard/Pro DC and Adobe Acrobat Reader DC. `AdobeAcrobat` has been left as-is to avoid a breaking change and to continue to provide updates for earlier versions of Acrobat / Reader updates
* Adds `Obsidian` [#310](https://github.com/aaronparker/evergreen/discussions/310), `ScreenToGif`
* Updates `MicrosoftEdge`, `MicrosoftEdgeDriver`, `MicrosoftEdgeWebView2Runtime` to ensure that the correct versions are returned for the `Enterprise` view for Edge installers [#311](https://github.com/aaronparker/evergreen/discussions/311)
* Updates various functions to use `Write-Error` instead of `throw` to ensure that functions continue where a specific query for an installer fails [#306](https://github.com/aaronparker/evergreen/issues/306)

BREAKING CHANGES:

* Updates the approach used in `AdobeAcrobatReaderDC` to determine the version and available downloads for Adobe Acrobat Reader DC. Adobe has changed the available enterprise installers at [https://get.adobe.com/uk/reader/enterprise/](https://get.adobe.com/uk/reader/enterprise/) [#312](https://github.com/aaronparker/evergreen/discussions/312)

## 2202.525

* Adds `DevToys`, `DebaucheeBarrier`
* Update `Save-EvergreenApp` to return error code on download failure instead of Throw. This allows the function to continue when multiple objects are passed into the function

## 2202.521

* Adds `HashicorpPacker`, `HashicorpBoundary`, `HashicorpVault`, `HashicorpWaypoint`, `HashicorpConsul`, `HashicorpTerraform`, `HashicorpNomad` [#241](https://github.com/aaronparker/evergreen/discussions/241)

## 2201.519

* Adds `TogglDesktop` [#281](https://github.com/aaronparker/evergreen/discussions/281), `OperaBrowser` [#299](https://github.com/aaronparker/evergreen/discussions/299), `OperaGXBrowser` [#299](https://github.com/aaronparker/evergreen/discussions/299)
* Adds Hindi language to `AdobeAcrobatReaderDC` to add the [MUI installer](https://helpx.adobe.com/reader/faq.html) to the list of returned installers [#297](https://github.com/aaronparker/evergreen/discussions/297)
* Updates the approach used in `Microsoft365Apps` to find branch version details [#294](https://github.com/aaronparker/evergreen/discussions/294). The previous approach would occasionally list incorrect versions

## 2112.512

* Adds `MicrosoftWvdMultimediaRedirection` [https://docs.microsoft.com/en-us/azure/virtual-desktop/multimedia-redirection](https://docs.microsoft.com/en-us/azure/virtual-desktop/multimedia-redirection)
* Updates the source URL for `MicrosoftWvdRtcService` [#288](https://github.com/aaronparker/evergreen/issues/288)
* Updates installer types for `NotepadPlusPlus` [#287](https://github.com/aaronparker/evergreen/issues/287)
* Fixes an issue with `MicrosoftPowerShell` due to changes in the update source [#282](https://github.com/aaronparker/evergreen/issues/282)
* Addresses code issues identified with [PSScriptAnalyzer](https://github.com/aaronparker/evergreen/actions/workflows/powershell-analysis.yml)

## 2112.504

* Adds `ImageMagickStudioImageMagick` [#242](https://github.com/aaronparker/evergreen/issues/242), `Miniconda` [#246](https://github.com/aaronparker/evergreen/issues/246), `TorProjectTorBrowser` [#246](https://github.com/aaronparker/evergreen/issues/246), `diagrams.net` [#276](https://github.com/aaronparker/evergreen/issues/276)
* Adds `AdoptiumTemurin8`, `AdoptiumTemurin11`, `AdoptiumTemurin16`, `AdoptiumTemurin17` and addresses [#273](https://github.com/aaronparker/evergreen/issues/273) [#199](https://github.com/aaronparker/evergreen/issues/199),
* Updates `MicrosoftOneDrive` with new update sources and adds more update channels. Now includes: `Production`, `Enterprise`, `Insider`, `InternalSlow`, `InternalFast` [#269](https://github.com/aaronparker/evergreen/issues/269)
* Updates `MicrosoftTeams` with new approach for dynamically determining download URLs and adds `.exe` installers
* Updates `Microsoft.NET` due to changes in source location for .NET 6. Dynamically finds installer source URLs and provides `windowsdesktop`, `runtime`, `sdk` installers. Includes .NET `6.0`, `5.0` and `3.1` [#278](https://github.com/aaronparker/evergreen/issues/278)
* Updates `FoxitPDFEditor` to fix an issue with changes to language properties from the update source [#274](https://github.com/aaronparker/evergreen/issues/274)
* Updates `GitHubRelease` with additional file types to return by default Thanks to [@JonathanPitre](https://github.com/JonathanPitre)

## 2111.488

* Adds `-CustomPath` parameter to `Save-EvergreenApp` - allows for specifying a specific target directory for downloads instead of building the directory structure automatically from the input object [#260](https://github.com/aaronparker/evergreen/issues/260)
* Adds `OctopusDeployServer` [#238](https://github.com/aaronparker/evergreen/issues/238), `OctopusTentacle` [#239](https://github.com/aaronparker/evergreen/issues/239), `7ZipZS` [#232](https://github.com/aaronparker/evergreen/issues/232), `PDF24Creator` [#258](https://github.com/aaronparker/evergreen/issues/258), `MicrosoftEdgeDriver` [#262](https://github.com/aaronparker/evergreen/issues/262), `MirantisLens` [#248](https://github.com/aaronparker/evergreen/issues/248), `GeekSoftwarePDF24Creator` [#256](https://github.com/aaronparker/evergreen/issues/256)
* Adds `dbeaver`, `MattermostDesktop`, `PuTTY` [#255](https://github.com/aaronparker/evergreen/issues/255). Thanks to [@BornToBeRoot](https://github.com/BornToBeRoot)
* Adds `VisualCppRedistAIO` [#250](https://github.com/aaronparker/evergreen/issues/250), `OpenWebStart` [#263](https://github.com/aaronparker/evergreen/issues/263). Thanks to [@JonathanPitre](https://github.com/JonathanPitre)
* Updates `MozillaFirefox` to output MSIX file type and ARM64 architecture
* Updates `AmazonCorretto` to include version 17 [#249](https://github.com/aaronparker/evergreen/issues/249)
* Updates `GoogleChrome` to include channels `Dev` and `Beta` [#243](https://github.com/aaronparker/evergreen/issues/243)
* Updates source URI for `MicrosoftFSLogixApps` due to changes in source [#259](https://github.com/aaronparker/evergreen/issues/259)
* Fixes URI values for `SumatraPDFViewer` due to changes in source [#211](https://github.com/aaronparker/evergreen/issues/211)
* Fixes URI values for `FoxitReader` due to changes in source [#261](https://github.com/aaronparker/evergreen/issues/261)

BREAKING CHANGES:

* Removes all default languages from `MozillaFirefox` and includes `en-US` only. Any supported languages can be passed to `MozillaFirefox` by passing a hashtable to `-AppParams`. For example: `Get-EvergreenApp -Name "MozillaFirefox" -AppParams @{Language="en-GB", "es-ES"}`
* Removes `FIREFOX_ESR_NEXT` from `MozillaFirefox` as the Firefox update feed is not including the version number

## 2110.467

* Fixes an issue with `AdobeAcrobat` where the string returned from the Adobe update API added a new line after the version number [#233](https://github.com/aaronparker/evergreen/issues/233)
* Adds `GhislerTotalCommander` [#229](https://github.com/aaronparker/evergreen/issues/229), `PaintDotNetOfflineInstaller` [#235](https://github.com/aaronparker/evergreen/issues/235), `TelerikFiddlerClassic`, `voidtoolsEverything` [#230](https://github.com/aaronparker/evergreen/issues/230)
* Adds `USBPcap`. Thanks to [Dan Gough](https://github.com/DanGough)
* Updates method used to determine version and download for `JSAP`
* Adds private function `Resolve-DnsNameWrapper` to resolve DNS TXT records. Used by `GhislerTotalCommander`. Currently supports Windows only

BREAKING CHANGES:

* Disables `LibreOffice` - the update method keeps changing requiring a significant amount of work to fix each time. [#218](https://github.com/aaronparker/evergreen/issues/218)
* Updates `Microsoft365Apps` to fix some instances where the incorrect version number returned, and updates channel names in `Channel` property using the names listed in the `Channel` property in the configuration.xml. A `Name` property has been added with the full channel names to ensure readability. This reflects the same channel names used when creating a configuration in the [Microsoft 365 Apps admin center]((https://config.office.com/))
  * Channel properties are listed in the following articles: [Configuration options for the Office Deployment Tool](https://docs.microsoft.com/en-us/deployoffice/office-deployment-tool-configuration-options#channel-attribute-part-of-add-element), [Update channel for Office LTSC 2021](https://docs.microsoft.com/en-us/deployoffice/ltsc2021/update#update-channel-for-office-ltsc-2021), [Update channel for Office 2019](https://docs.microsoft.com/en-us/deployoffice/office2019/update#update-channel-for-office-2019)
  * Full channel names are listed here: [Update history for Microsoft 365 Apps](https://docs.microsoft.com/en-us/officeupdates/update-history-microsoft365-apps-by-date)

## 2108.458

* Adds `MicrosoftEdgeWebView2Runtime`, `MicrosoftBotFrameworkEmulator`, `Naps2`, `SmartBearSoapUI`, `NevcairielLAVFilters`
* Adds the parameter `-AppParams` to `Get-EvergreenApp` that takes a hashtable of parameters to be passed to the internal application functions. Right now, this will only work with `GitHubRelease` - enabling Evergreen to return the releases for any GitHub repository with Windows releases that you pass via `-AppParams`
* Updates the approach used for `TelegramDesktop`, because Telegram posts a release to GitHub that doesn't match the latest Windows release

BREAKING CHANGES:

* Updates the channel names, and adds additional channels, in `Microsoft365Apps` - this release adds all available Microsoft 365 Apps channels - `FirstReleaseCurrent`, `Insiders`, `Monthly`, `Current`, `MonthlyEnterprise`, `Deferred`, `Broad`, `Targeted`, `FirstReleaseDeferred`, `Perpetual2019`, `PerpetualVL2019`
* Disables `CiscoWebEx` - function is unable to return the current WebEx version using the existing method and no working method has been found

## 2108.450

* Adds `deviceTRUST`
* Fixes an issue in `Save-EvergreenApp` when the path specified in the `-Path` parameter does not exist
* Updates `LibreOffice` to gracefully handle download a scenario where the The Document Foundation pulls the download links for a published version [#218](https://github.com/aaronparker/evergreen/issues/218)

BREAKING CHANGES:

* Updates `Postman` with `x86` and `x64` architecture
* Updates `LibreOffice` with `Release` property with a value of `Still` or `Fresh`

## 2107.441

* Adds `FoxitPDFEditor`
* Adds `FreedomScientificFusion`, `FreedomScientificJAWS`, `FreedomScientificZoomText`, `MestrelabMnova`, `jrsoftwareInnoSetup`. Thanks to [@adotcoop](https://github.com/adotcoop)
* Updates the process used to determine updates in `TableauDesktop`. Thanks to [@adotcoop](https://github.com/adotcoop)
* Updates `DatePattern` in `PSFPython` to return the correct localised date
* Updates `AdobeReaderDC` with internal function `Invoke-RestMethodWrapper` replacing direct use of `Invoke-RestMethod`
* Updates `MicrosoftWvdBootloader`, `MicrosoftWvdInfraAgent`, `MicrosoftWvdRemoteDesktop`, `MicrosoftWvdRtcService`, `OracleVirtualBox`, and `LibreOffice` to use internal function `Invoke-WebRequestWrapper` replacing direct use of `Invoke-WebRequest`
* Updates internal function `Invoke-WebRequestWrapper` with parameter `-ReturnObject` to enable application functions to return Headers, Content, RawContent etc.
* Updates internal function `Invoke-WebRequestWrapper` with parameter `-Method` that allows, `Default`, `Head`, `Post`, etc., required by various application functions

## 2107.431

* Adds `SignalDesktop`
* Updates `MicrosoftAzureCoreFunctionTools` to return MSI installers [#213](https://github.com/aaronparker/evergreen/issues/213)
* Updates `CitrixWorkspaceApp` to return a `Stream` property that includes a value of `Current` or `LTSR`
* Updates `LibreOffice` [#171](https://github.com/aaronparker/evergreen/issues/171), `CitrixWorkspaceApp`, `OracleJava8`, `MicrosoftSsms` to use `Invoke-RestMethodWrapper` to avoid needing to convert update feed into XML simplifying the code

BREAKING CHANGES:

* Renames `AtlassianBitbucket` to `AtlassianSourcetree` [#177](https://github.com/aaronparker/evergreen/issues/177)

## 2107.425

* Adds `jq`, `PSAppDeployToolkit`
* Adds `Anaconda`, `McNeelRhino`, `PSFPython`, `TableauPrep`, `TableauReader`, `TechSmithCamtasia`, `TechSmithSnagit`. Thanks to [@adotcoop](https://github.com/adotcoop)
* Updates `Get-GitHubRepoRelease` to actively query the GitHub API for available requests to avoid issues when [rate limited](https://docs.github.com/en/rest/overview/resources-in-the-rest-api#rate-limiting)
* Updates `Get-GitHubRepoRelease` with a new parameter - `-ReturnVersionOnly` that enables returning only the version property of the latest release. This enables finding the version number and using alternative download sources, where the vendor does not include binary releases on the GitHub repository

## 2107.418

* Adds `BlueJ`, `Postman`, `TableauDesktop`. Thanks to [@adotcoop](https://github.com/adotcoop)
* Adds `MicrosoftAzureFunctionsCoreTools`, `MasterPackager`
* Updates `Get-EvergreenApp` to sort output on the `Version` property in descending order
* Updates internal functions `Invoke-SystemNetRequest`, `Invoke-WebRequestWrapper`, `Resolve-InvokeWebRequest`, `Resolve-SystemNetWebRequest` to not throw in the event of a source URL being unavailable, to allow for more graceful handling of vendor sources being temporarily unavailable

## 2106.407

* Adds `CendioThinLinc`, `JASP`, `JetBrainsIntelliJIDEA`, `JetBrainsPyCharm`, `MendeleyDesktop`, `MiniZincIDE`, `Minitab`, `MuseScore`, `Pandoc`, `Protege`, `RDAnalyzer`, `RStudio`, `SafeExamBrowser`, `Zotero`.  Thanks to [@adotcoop](https://github.com/adotcoop)
* Updates `MicrosoftWindowsPackageManagerClient` to return the `.appxbundle` installer
* Fixes an issue in `Save-EvergreenApp` when calling `Remove-Variable`

## 2106.402

* Adds `AmazonCorretto`, `ArtifexGhostscript`, `FreeFem`, `Gephi`, `Praat`, `SAGAGIS`, `Scratch`, `TeXstudio`, `gretl`. Thanks to [@adotcoop](https://github.com/adotcoop)
* Updates private function `Get-Architecture` with additional processor architecture detections
* Updates private function `Get-GitHubRepoRelease` to return a custom object if the GitHub API is rate limited

BREAKING CHANGES:

* Remove portable installers and `.zip` file types from `Notepad++`

## 2106.395

* Adds `AkeoRufus` [#179](https://github.com/aaronparker/evergreen/issues/179), `BlenderLauncher` [#178](https://github.com/aaronparker/evergreen/issues/178)
* Updates `MicrosoftFSLogixApps` to return both the production and preview releases [#176](https://github.com/aaronparker/evergreen/issues/176)
* Updates `Veracrypt` to return the complete version number (e.g. `1.24-Update7`) [#166](https://github.com/aaronparker/evergreen/issues/166)

BREAKING CHANGES:

* Adds the `Production` and `Preview` channels to `MicrosoftFSLogixApps` that will require filtering with `Where-Object`

## 2105.388

* Update `VMwareHorizonClient` with additional filtering to select the latest version correctly to address [#161](https://github.com/aaronparker/evergreen/issues/161)
* Add internal function `Save-File` to download a URL with `Invoke-WebRequest` and return the downloaded file path
* Update internal application functions for consistent use of `Resolve-SystemNetWebRequest` to address [#174](https://github.com/aaronparker/evergreen/issues/174) - `Get-FoxitReader`, `Get-LogMeInGoToOpener`, `Get-MicrosoftSsms`, `Get-MicrosoftVisualStudio`, `Get-RingCentral`, `Get-Slack`
* Update references to documentation site `https://stealthpuppy.com/Evergreen` to `https://stealthpuppy.com/evergreen`

## 2105.383

* Adds `CiscoWebEx` ([#141](https://github.com/aaronparker/Evergreen/issues/141)), `VeraCrypt` ([#160](https://github.com/aaronparker/Evergreen/issues/160)), `KarakunOpenWebStart` ([#163](https://github.com/aaronparker/Evergreen/issues/163))
* Updates `MicrosoftWvdRemoteDesktop` with the Preview release and fixes source URLs for the public release
* Adds `ARM64` architecture to `MicrosoftTeams` [#162](https://github.com/aaronparker/Evergreen/issues/162)
* Adds `MSI` file type to `Wireshark`
* Updates internal function `Get-SourceForgeRepoRelease` with improvements to find releases and download URIs

## 2105.371

* Adds `Audacity`, `Wireshark` ([#153](https://github.com/aaronparker/Evergreen/issues/153)), `LogMeInGoToMeeting` ([#152](https://github.com/aaronparker/Evergreen/issues/152)), `LogMeInGoToOpener`
* Updates `AdobeAcrobat` to include Reader updates for `2015`, `2017`, `2020`
* Updates `AdobeAcrobat` to include 64-bit updates for Reader and Acrobat DC

BREAKING CHANGES

* Adds the `Architecture` property to `AdobeAcrobat`

## 2105.366

* Fixes an issue with `Remove-Variable` in `Save-EvergreenApp` [Fix #149](https://github.com/aaronparker/Evergreen/issues/149)
* Updates `Save-EvergreenApp` to skip downloading a file if it already exists and adds support for `-Force`
* Updates help for `Save-EvergreenApp`
* Adds `nb-NO` language support to `MozillaFirefox` [Fix #146](https://github.com/aaronparker/Evergreen/issues/146)

## 2105.363

* Adds `ImageGlass`, `MicrosoftAzureStorageExplorer`, `Nomacs`, `Notable`, `OBSStudio`
* Updates URL used by `TeamViewer` to return the current version [#147](https://github.com/aaronparker/Evergreen/issues/147)
* Updates `Save-EvergreenApp` to output the result of `Get-ChildItem` as the output to the pipeline
* Updates module to use external help MAML-based help with [platyPS](https://github.com/PowerShell/platyPS) to make updating help content easier
* General code improvements

## 2104.355

* Changes `FoxitReader` to return MSI installers instead of EXEs. Removes Elex, Portuguese (Portugal), and Turkish language support from this application because the installers returned are out of date.
* Adds the following languages to `AdobeAcrobatReaderDC`: Swedish, Basque, Catalan, Croatian, Czech, Hungarian, Polish, Romanian, Russian, Slovakian, Slovenian, Turkish, Ukrainian
* Adds a known issues list to the documentation: [https://stealthpuppy.com/evergreen/knownissues.html](https://stealthpuppy.com/evergreen/knownissues.html)

## 2104.348

* Adds the Consumer release (to the existing Enterprise release) and Dev, Beta channels, and ARM64 architecture to `MicrosoftEdge`
* Adds 64-bit architecture to `MicrosoftOneDrive`
* Adds `BeekeeperStudio`, `VMwareHorizonClient`, `AdoptOpenJDK 8`, `AdoptOpenJDK 11`, `AdoptOpenJDK 16`
* Modifies `Get-EvergreenApp` to load internal per-application functions on demand, instead of loading all of these function into memory at module import
* Updates `Get-CitrixRssFeed` to use `Invoke-RestMethod` to simplify handling of the XML feed
* Updates various functions to Throw more consistently when encountering errors
* General code improvements

## 2104.337

* **BREAKING CHANGE**: This version removes the `Get-` function for each application and introduces `Get-EvergreenApp`. See the docs site on how to use the new functions [https://stealthpuppy.com/evergreen/](https://stealthpuppy.com/evergreen/)
* Adds `Get-EvergreenApp`, `Find-EvergreenApp` and `Save-EvergreenApp`
* Adds file type to SourceForge applications
* Re-instates `ControlUpAgent` and `ControlUpConsole`
* Fixes the `LTS` release in `Microsoft.NET`
* Fixes localised date format for `Gimp`, `GoogleChrome`, `MicrosoftEdge`, `MicrosoftFSLogixApps`, `MicrosoftSsms`, `FoxitReader`
* Migrates tests to Pester 5
* Adds additional Pester tests for private functions
* General code optimisations and fixes

## 2103.305

* Fixes an issue with `Get-AdobeAcrobat` to ensure that `Track` property has the correct value (DC, 2020, etc.) and the `Language` property (Neutral, Multi) [#130](https://github.com/aaronparker/Evergreen/issues/130)

## 2103.303

* Adds `Get-NETworkManager`, `Get-Anki`
* Updates `Get-AdobeAcrobat` to include updates for Adobe Acrobat Reader DC. This function now returns updates for both Acrobat Pro and Reader
  * Retrieve the installers for Adobe Acrobat Reader DC with `Get-AdobeAcrobatReaderDC` and any available updates with `Get-AdobeAcrobat`
* Temporarily disables `Get-ControlUpAgent` and `Get-ControlUpConsole`

## 2103.298

* Adds `Get-MicrosoftAzureDataStudio`, `Get-ControlUpConsole`
* Updates `Get-ControlUpAgent` to use the published JSON at [https://www.controlup.com/latest-agent-console/](https://www.controlup.com/latest-agent-console/) - the last vestiges of any screen scraping code have been swept away
* Updates `Get-AdobeAcrobatReaderDC` to account for the new 64-bit version of Reader to add [#121](https://github.com/aaronparker/Evergreen/issues/121). Filter with `Where-Object` to return the required version, language and architecture

BREAKING CHANGES

* Adds `Architecture` property and removes `Type` property from the output of `Get-AdobeAcrobatReaderDC`
* Removes the Adobe Acrobat Reader DC updaters from `Get-AdobeAcrobatReaderDC` as there is no consistent automated method to determine whether an update is required or optional
* Changes the output of `Get-ControlUpAgent` - the values in the `Framework` property have changed and the function only returns the most recent agent version

## 2102.291

* Renames function `Get-AdobeAcrobatProDC` to `Get-AdobeAcrobat` and includes support for returning updates for Adobe Acrobat Pro/Standard DC, 2020, 2017, and 2015. Addresses [#114](https://github.com/aaronparker/Evergreen/issues/114)
  * Alias `Get-AdobeAcrobatProDC` included for backward compatibility
* Adds `Preview` ring to `Get-MicrosoftTeams`
* Updates function comment-based help and corrects spelling across several functions

BREAKING CHANGES

* Adds `Track` property to `Get-AdobeAcrobat` with values of `DC`, `2020`, `2017`, `2015` - filter with `Where-Object`
* Adds `Ring` property to `Get-MicrosoftTeams` for `General` (i.e., current / production ring) and `Preview` rings - filter with `Where-Object`

## 2102.286

* Adds the `ARM` architecture to `Get-MicrosoftVisualStudioCode`
* Updates `Get-MicrosoftWvdRemoteDesktop` to output the `URI` property value in the format `https://query.prod.cms.rt.microsoft.com/cms/api/am/binary/RE4MntQ` instead of the original `fwlink` source URL (e.g. `https://go.microsoft.com/fwlink/?linkid=2068602`)
* Updates the following functions to use `Invoke-RestMethod` (via `Invoke-RestMethodWrapper`) instead of `Invoke-WebRequest` to simplify code and fix an issue where some functions where returning `Version` as a PSObject instead of System.String ([#109](https://github.com/aaronparker/Evergreen/issues/109))
  * `Get-AtlassianBitbucket`, `Get-Cyberduck`, `Get-FileZilla`, `Get-Fork`, `Get-RingCentral`, `Get-ScooterBeyondCompare`, `Get-SumatraPDFReader`, `Get-VideoLanVlcPlayer`
* Updates module `ReleaseNotes` location to: [https://stealthpuppy.com/evergreen/changelog.html](https://stealthpuppy.com/evergreen/changelog.html)

## 2101.281

* Renames `Get-MicrosoftOffice`, to `Get-Microsoft365Apps` to align with product name. The alias `Get-MicrosoftOffice` is included for backward compatibility
* Adds the `Monthly Enterprise` channel to `Get-Microsoft365Apps` output. See [#107](https://github.com/aaronparker/Evergreen/issues/107)
* Adds private function `Invoke-RestMethodWrapper` to enable normalisation across public functions and PowerShell/Windows PowerShell that use `Invoke-RestMethod`
  * Updates private function `Get-GitHubRepoRelease` to use `Invoke-RestMethodWrapper`
  * Updates several public functions to use `Invoke-RestMethodWrapper` instead of the previous method of `Invoke-WebRequest | ConvertTo-Json` - `Get-1Password`, `Get-CitrixVMTools`, `Get-FoxitReader`, `Get-GoogleChrome`, `Get-Microsoft365Apps`, `Get-MicrosoftEdge`, `Get-MicrosoftTeams`, `Get-MicrosoftVisualStudioCode`, `Get-MozillaFirefox`, `Get-MozillaThunderbird`
* Updates public functions that used `Invoke-RestMethod` to use `Invoke-RestMethodWrapper` instead - `Get-Gimp`, `Get-MicrosoftPowerShell`, `Get-MicrosoftVisualStudio`
* Renames private function `Invoke-WebContent` to `Invoke-WebRequestWrapper` and makes general improvements to the handling of `Invoke-WebRequest`
* Renames private function `ConvertFrom-SourceForgeReleasesJson` to `Get-SourceForgeRepoRelease`
  * Updates and optimises this function to make use of `Invoke-RestMethodWrapper` so that it can query a SourceForge repository and return the required output in a single function
* Simplifies code in public functions that return SourceForge releases - `Get-7zip`, `Get-KeePass`, `Get-PDFForgePDFCreator`, `Get-ProjectLibre`, `Get-WinMerge`, `Get-WinSCP`
* Renames private functions for more descriptive function names (these resolve HTTP 301/302 return codes):
  * `Resolve-Uri` to `Resolve-SystemNetWebRequest`
  * `Resolve-RedirectedUri` to `Resolve-InvokeWebRequest`

BREAKING CHANGES

* Removes parameter from several functions (below) to simplify existing functions and support a move to a single `Get-EvergreenApp` function
* Removes the `-Channel` and `-Platform` parameters from `Get-MicrosoftVisualStudioCode`. Filter output using `Where-Object` on the `Channel` and `Platform` parameters on the function output
* Removes the `-Language` parameter from `Get-MozillaFirefox` and `Get-MozillaThunderbird`. Filter output using `Where-Object { $_.Language -eq "en-US" }` or similar. These functions will return the following languages (for additional languages, please open an issue on the project): `en-US`, `en-GB`, `en-CA`, `es-ES`, `sv-SE`, `pt-BR`, `pt-PT`, `de`, `fr`, `it`, `ja`, `nl`, `zh-CN`, `zh-TW`, `ar`, `hi-IN`, `ru`

## 2101.275

* Adds `Get-AtlassianBitbucket`, `Get-TelegramDesktop`, `Get-Gimp`, `Get-BitwardenDesktop`, `Get-MicrosoftBicep`
* Updates `Get-MicrosoftPowerShell` to return both the `Stable` and `LTS` releases of PowerShell

BREAKING CHANGES

* Update output of `Get-MicrosoftOneDrive` - changes property `Sha256Hash` to `Sha256` to be consistent with other functions
* Adds a `Release` property to the output of `Get-MicrosoftPowerShell` - use `Where-Object` to filter on `Stable` or `LTS`

## 2101.263

* Adds `Get-AdobeBrackets`, `Get-Fork`, `Get-MicrosoftVisualStudio`, `Get-VercelHyper`
* Updates manifest for `MicrosoftWvdRemoteDesktop` to ensure evergreen source URLs used for resolving downloads
* Updates manifest for `MicrosoftVisualStudioCode`

## 2101.256

* Adds `Get-Terminals`, `Get-PeaZipPeaZip`, `Get-Slack`, `Get-MicrosoftWindowsPackageManagerClient`, `Get-KeePassXCTeamKeePassXC`, `Get-SumatraPDFReader`
* Renames `Get-Atom`, to `Get-GitHubAtom` to better align with vendor name. The alias `Get-Atom` is included for backward compatibility
* Fixes an issue with `Get-AdobeAcrobatReaderDC` - Adobe doesn't use HTTPS with their download locations yet. See [#99](https://github.com/aaronparker/Evergreen/issues/99)
* Updates `Get-AdobeAcrobatReaderDC` to simplify code and better align manifest with standard structure

## 2101.249

* Adds `Get-MicrosoftWvdRemoteDesktop`, `Get-MozillaThunderbird`, `Get-ProjectLibre`, `Get-RingCentral`, `Get-RCoreTeamRforWindows`, `Get-StefansToolsgregpWin`
* Renames `Get-MicrosoftPowerShellCore` to `Get-MicrosoftPowerShell` - PowerShell Core was renamed to PowerShell with the release of PowerShell 7.0. The alias `Get-MicrosoftPowerShellCore` is included for backward compatibility
* Fixes an issue with `Get-GitHubRelease` that ignored anything passed to the `-Uri` parameter
* Adds the MSIX format to the output of `Get-MicrosoftOneDrive` - filter output with the `Type` property (I'm not really sure how useful MSIX format for the OneDrive client is right now though...)
* Adds the VboxGuestAdditions ISO to the output of `Get-OracleVirtualBox` - filter output with the `Type` property
* Refactors `Get-Zoom` to simplify function code and improve output
* Updates version output for `Get-MicrosoftWvdRtcService` and `Get-MicrosoftWvdInfraAgent`
* Updates manifest for a number of functions to better align with an updated standard structure (see `Manifests/Template.json`)

BREAKING CHANGES:

* Output of `Get-MicrosoftOneDrive` has changed - `Platform` has been removed and `Type` has been added
* Output of `Get-OracleVirtualBox` has changed - `Type` property has been added
* Output of `Get-Zoom` has changed - filter output with the `Platform` and `Type` properties

## 2012.242

* Adds `Get-AdobeAcrobatProDC`, `Get-TelerikFiddlerEverywhere`, `Get-1Password`
* Adds Windows Installer downloads output to `Get-FoxitReader`
* Updates `Get-MicrosoftSsms` to query an evergreen update URL to gather new versions from the product releases feed
  * NOTE: the version of SSMS in the releases feed is not the actual current release version - we can only work with what the feed returns; See [#82](https://github.com/aaronparker/Evergreen/issues/82)
* Updates `Get-MicrosoftSsms` to output all supported languages for downloads - filter output on the `Language` property
* Updates `Get-MozillaFirefox` to return both Exe and Msi versions of the Firefox installer
* Adds SHA256 hash property to output from `Get-MicrosoftVisualStudioCode`
* Fixes an issue with the `URI` output in `Get-Cyberduck` that was returning an additional `/` character
* Refactors private function to query the GitHub releases API (`Get-GitHubRepoRelease`, replacing `ConvertFrom-GitHubReleasesJson`) to use `Invoke-RestMethod` for simpler public functions used to return GitHub releases
* Updates the following functions to use `Get-GitHubRepoRelease` - `Get-Atom`, `Get-AdoptOpenJdk`, `Get-BISF`, `Get-dnGrep`, `Get-GitForWindows`, `Get-GitHubRelease`, `Get-Greenshot`, `Get-Handbrake`, `Get-MicrosoftPowerShellCore`, `Get-MicrosoftPowerToys`, `Get-mRemoteNG`, `Get-NotepadPlusPlus`, `Get-OpenJDK`, `Get-OpenShellMenu`, `Get-ShareX`, `Get-Win32OpenSSH`, `Get-WixToolSet`
* Updates manifest for a number of functions to better align with an updated standard structure (see `Manifests/Template.json`)
* Updates private function `ConvertTo-DateTime` to better handle date/time format conversion. Still some improvements to be made here

BREAKING CHANGES:

* Updates `Get-OpenJDK` to return only Msi releases and removes Debug, zip etc. On-going improvements - see [#76](https://github.com/aaronparker/Evergreen/issues/76)
* Removes Beta and Snapshots releases from `Get-Cyberduck`
* Removes Debug releases from `Get-Greenshot`
* Removes SafeMode releases from `Get-Handbrake`
* Removes Beta channel and ARM64 releases from `Get-MicrosoftEdge`
* Removes Zip format releases from `Get-MicrosoftPowerShellCore`
* Removes Symbols releases from `Get-Win32OpenSSH`

## 2012.225

* Adds `Get-Microsoft.NET` (.NET 5.0 and .NET Core), `Get-Win32OpenSSH`, `Get-MicrosoftPowerToys`
* Updates `Get-OpenJDK` to return all releases. Further filtering will be added in the future per [#76](https://github.com/aaronparker/Evergreen/issues/76)
* Updates `Get-MozillaFirefox` to resolve download URIs for both EXE and MSI Firefox installers and updates output with additional properties (`Architecture`, `Channel` and `Type`). See [#83](https://github.com/aaronparker/Evergreen/issues/83).
  * Note: this introduces a breaking change - the `-Platform` switch has been removed, you will need to filter the output on the `Architecture` property
* Updates `Get-AdobeAcrobatReader` to return additional languages [#84](https://github.com/aaronparker/Evergreen/issues/84). Note that Reader DC does not provide the latest version for all languages - it may be a better approach to use the [MUI version of the Reader installer](https://helpx.adobe.com/au/reader/faq.html#Enterprisedeployment) if your language is supported

## 2010.219

* Update `Get-FileZilla` to fix invalid download URI returned from the FileZilla update feed. Fix [#75](https://github.com/aaronparker/Evergreen/issues/75)
* Update `Get-Cyberduck` to remove code that replaces `//` with `/`. Returns unfiltered URL from Cyberduck update feed. Fix [#75](https://github.com/aaronparker/Evergreen/issues/75)

## 2009.218

* Fix `Get-FoxitReader` with changes to download page in `FoxitReader.json`. Address [#72](https://github.com/aaronparker/Evergreen/issues/72)
* Fix `Get-Zoom` with changes to resolved URIs. Address [#73](https://github.com/aaronparker/Evergreen/issues/73)
* Update `MicrosoftWvdRtcService.json` to new version of the Microsoft Remote Desktop WebRTC Redirector Service
* Update `Resolve-Uri` with additional verbose output

## 2006.212

* Renames `Get-CitrixXenServerTools` to `Get-CitrixVMTools` and adds `Get-CitrixXenServerTools` alias
* Updates `Get-CitrixVMTools` with new release URL for v7 updates and add v9 updates
* Updates install command lines for `Get-CitrixVMTools`
* Adds `Get-AdoptOpenJDK` - closes [#69](https://github.com/aaronparker/Evergreen/issues/69)

## 2006.207

* Fix path in downloads from apps hosted on Source Forge returned in `ConvertFrom-SourceForgeReleasesJson.ps1`. Fixes [#67](https://github.com/aaronparker/Evergreen/issues/67)
* Update `Get-MozillaFirefox` to return Extended Support Release as well as Current Release. Address [#61](https://github.com/aaronparker/Evergreen/issues/61)
* Update manifests to address [#57](https://github.com/aaronparker/Evergreen/issues/57) [#54](https://github.com/aaronparker/Evergreen/issues/54) [#53](https://github.com/aaronparker/Evergreen/issues/53) [#52](https://github.com/aaronparker/Evergreen/issues/52)

## 2006.203

* Removes Size property from `Get-FoxitReader` because this isn't being gathered consistently for each download
* Updates version / releases feed for `Get-MicrosoftSsms` to ensure the current version is returned
* Updates the way private function `ConvertFrom-SourceForgeReleasesJson` returns available downloads from SourceForge
* Updates `Get-7zip`, `Get-KeePass`, `Get-PDFForgePDFCreator` and `Get-WinMerge` to support new approach to retrieving SourceForge downloads

## 2005.190

* Adds `Get-MicrosoftWvdBootLoader` - Get the filename and download URL for the Microsoft Windows Virtual Desktop Remote Desktop Boot Loader
* Updates `Get-FoxitReader` to sort release versions correctly and return latest (v10.x)

## 2005.187

* Adds `Get-MicrosoftWvdRtcService` - returns the version, filename and download for the Microsoft Remote Desktop WebRTC Redirector service for Windows Virtual Desktop

## 2005.183

* Updates `Get-VMwareTools` to return the very latest version with updated download URL
* Adds `Get-WixToolset`

## 2005.176

* Fixes an issue where `Get-MicrosoftEdge` was only returning ARM64 downloads
* Updates `Get-MicrosoftEdge` to only return downloads for the Enterprise ring (removed Consumer ring)
* Fixes an issue with `Get-MicrosoftTeams` where it was returning an incorrect download URL

## 2005.172

* Updates `Get-MicrosoftEdge` to correctly return the latest version and policy files for the Enterprise ring
* Updates output for private function `Resolve-Uri` with addition properties
* Updates `Get-FoxitReader`, `Get-MicrosoftFSLogixApps`, and `Get-MicrosoftSsms` to use `Resolve-Uri` instead of `Resolve-RedirectedUri` for improved performance
* Updates `Get-LibreOffice` to retrieve latest version from the update API instead of page scraping
* Updates private function `ConvertTo-DateTime` with improvements in returning localised date (so the rest of us don't need to be stuck with US date formats)
* Aligns `Get-NotepadPlusPlus` with private function `ConvertFrom-GitHubReleasesJson` to return GitHub release data
* Fixes output in `Get-VMwareTools` to ensure correct version and download URL are returned
* Adds date to output in several functions
* General code and inline help improvements
* Adds module icon for display in the PowerShell Gallery

## 2004.161

* Updates `Get-MicrosoftEdge` with the following:
  * Returns Edge for Windows only
  * Removes `-Channels` and `-Platforms` parameters. Filter output with `Where-Object` instead
  * Returns these channels and downloads only `Stable`, `Beta`, `EdgeUpdate`, and `Policy` (administrative templates)
  * Filters and returns only the latest version of each of the above channels and downloads
  * Output includes `Channel` (Stable, Beta etc.) and `Release` (Enterprise, Consumer) to enable filtering

## 2004.157

* Adds `Get-MicrosoftWvdInfraAgent`
* Adds `Get-dnGrep`
* Recode of `Get-PaintDotNet` (or how did I not know about `ConvertFrom-StringData` before?)
* To simplify output, removes Linux, macOS output from `Get-CitrixWorkspaceApp`, `Get-GoogleChrome`, `Get-OracleVirtuaBox`, `Get-LibreOffice`, `Get-MicrosoftVisualStudioCode`, `Get-MozillaFirefox`, `Get-OracleVirtualBox`, `Get-TeamViewer`
* Updates RegEx method to extract version across various functions to simplify code
* Splits Pester tests for Public functions to allow for faster local testing

## 2004.147

* Adds `Get-Handbrake`, `Get-KeePass`, `Get-OpenShellMenu`, `Get-VastLimitsUberAgent`, `Get-WinSCP`
* Removes macOS and Linux output from `Get-AdobeAcrobatReader`, `Get-LibreOffice`
* Filters macOS and Linux output from private function `ConvertFrom-GitHubReleasesJson.ps1`
* Fixes spaces in private function `ConvertFrom-SourceForgeReleasesJson`

## 2004.141

* Adds private function `ConvertFrom-SourceForgeReleasesJson` to convert JSON release info from SourceForge projects and simplify adding additional functions that pull release info from SourceForge projects. Release information is limited by what's provided from SourceForge
* Updates `Get-WinMerge` to use `ConvertFrom-SourceForgeReleasesJson`
* Adds `Get-7Zip`, `Get-PDFForgePDFCreator`
* Renames `-TrustCertificate` parameter in private function `Invoke-WebContent` to `-SkipCertificateCheck` to align with `-SkipCertificateCheck` available in '`Invoke-WebRequest` in PowerShell Core
* Enables `-SkipCertificateCheck` for both PowerShell Core and Windows PowerShell in `Invoke-WebContent`. Previously supported Windows PowerShell only
* Improves code in `Invoke-WebContent`
* Adds `-Uri` parameter validation in `Get-GitHubRelease` to ensure valid GitHub URLs are passed to the function
* Sets function global `ErrorPreference` to `Stop` to ensure better exception output from functions in the event of failures

## 2004.139

* Adds `ConvertFrom-GitHubReleasesJson` to standardise queries to GitHub repositories
* Updates `Get-Atom`, `Get-BISF`, `Get-GitForWindows`, `Get-Greenshot`, `Get-MicrosoftPowerShellCore`, `Get-OpenJDK`, `Get-ShareX`, `Get-mRemoteNG` to use `ConvertFrom-GitHubReleasesJson`
* Updates RegEx for version matching strings for `BISF`, `GitForWindows`, `ShareX`
* Adds `Get-Architecture` and `Get-Platform` private functions
* Adds `Get-GitHubRelease` to enable returning version and downloads from any GitHub repository. Use to get versions of applications on GitHub that aren't yet included in `Evergreen`

## 2004.134

* Fixes an issue where `Get-Zoom` was still returning a URI to downloads with query strings attached.

## 2004.133

* Updates URL to current version for `TeamViewer`. New URL requires different approach to query
* Adds `Invoke-SystemNetRequest` that uses `System.Net.WebRequest` to make a HTTP request and return response
* Updates `Get-TeamViewer` to use `Invoke-SystemNetRequest` to retrieve version from updated URL. Updates code to return version and download URL as a result
* Updates `Get-Zoom` to use `Resolve-Uri` to follow download URLs and find version number. `Get-Zoom` now returns more versions numbers for Zoom downloads than previously. Updates RegEx approach that returns version numbers from download URLs

## 2004.126

* Adds back `Get-FileZilla` using the application update API. Currently returns only the 64-bit version of FileZilla for Windows.

## 2004.125

* Adds `Get-MicrosoftOneDrive`. We recommend validating versions returned by this function with [OneDrive release notes](https://support.office.com/en-us/article/onedrive-release-notes-845dcf18-f921-435e-bf28-4e24b95e5fc0)
* Removes `Get-FileZilla` until a more robust process to return versions and download can be created
* Removes progress bar for `Invoke-WebRequest` for faster query of APIs
* Updates `Get-NotepadPlusPlus` to use the GitHub releases API to find new versions as the application update API can be out of date

## 2002.120

* Updates `Get-GitForWindows` to return correct version number
* Updates `Get-Zoom` to return version number correctly
* Adds `Resolve-Uri` with a new method of returning redirects from 301/302 via @iainbrighton

## 2001.117

* Updates `Get-FileZilla` to return 32-bit and 64-bit download URIs

## 2001.110

* Adds `Get-MicrosoftTeams`
* Update error handling in `Get-VideoLanVlcPlayer`

## 2001.104

* Adds `Get-MicrosoftEdge` for the new Chromium based Microsoft Edge
* Additional verbose output in `Invoke-WebContent`

## 1911.101

* Adds `Get-ScooterBeyondCompare`
* Updates XML parsing approach in `Get-CitrixRssFeed`, `Get-CitrixWorkspaceApp`, `Get-NotepadPlusPlus`, `Get-VideoLanVlcPlayer`

## 1911.97

* Adds private function `Resolve-RedirectedUri` to handle resolving 301/302 redirects on PowerShell Core and Windows PowerShell
* Updates `Get-VideoLanVlcPlayer`, `Get-MicrosoftSsms`, `Get-FoxitReader`, `Get-MicrosoftFSLogixApps`, `Get-Zoom` with full support for PowerShell Core
* Updates logic to filter out prerelease assets in `Get-Atom`, `Get-BISF`, `Get-GitForWindows`, `Get-Greenshot`, `Get-MicrosoftPowerShellCore`, `Get-OpenJDK`, `Get-ShareX`, `Get-mRemoteNG`
* Prevents `Get-MicrosoftSsms`, `Get-CitrixRssFeed`, `Get-Cyberduck`, `Get-OracleJava8` from throwing on error
* Updates to application manifests with some work on silent install commands

## 1911.95

* Adds `Get-MicrosoftFSLogixApps`

## 1911.93

* Fixes version match in `Get-ControlUpAgent`

## 1911.91

* Adds `Get-Cyberduck`

## 1911.87

* Adds `Get-JamTreeSizeFree` and `Get-JamTreeSizeProfessional`
* Fixes URL to [Release notes / CHANGELOG](https://github.com/aaronparker/Evergreen/blob/main/CHANGELOG.md) in module manifest

## 1911.84

* Changes approach used in `Get-ControlUpAgent` to retrieve agent details and enables PowerShell Core support
* Implemented per-application manifests (URLs, RegEx, strings etc.) for simpler function management
* Adds `Export-EvergreenFunctionStrings` to export per-application manifests
* Renames function `Get-Java8` to `Get-OracleJava8`
* Adds Pester tests for Public functions to ensure URI properties are valid

## 1911.75

* Updates `Get-LibreOffice` update query approach to provide a more consistent output
* Updates `Get-LibreOffice` to work on PowerShell Core
* Changes `Get-LibreOffice` output and parameters to align with other functions
* Updates `Get-NotepadPlusPlus` to gracefully handle update server issues (CloudFlare DDOS challenges)
* Fixes version output in `Get-OpenJDK`
* Updates `Get-mRemoteNG` with handling issues when getting Updates
* Updates to Public function Pester tests
* Updates `Evergreen.json` with consistent property naming and corresponding functions

## 1910.62

* Updates `Get-MicrosoftSsms` to ensure that the URI property returns the correct SSMS download for the latest version

## 1910.53

* Adds `Get-WinMerge`

## 1910.50

* Updates `Get-VideoLanVlcPlayer` output to include ZIP and MSI links for VLC Player for Windows

## 1910.49

* Updates `Get-MicrosoftSsms` to URL (e.g. `https://go.microsoft.com/fwlink/?LinkId=761491`) to return actual URI

## 1910.48

* Updates `Get-VideoLanVlcPlayer` to return download mirrors for URI values

## 1910.47

* Adds `Get-Atom` and `Get-TeamViewer`

## 1910.39

* Update `Get-Zoom` to the same HTTP post as `https://zoom.us/support/download` to return the download URI. Returns download for Windows and VDI environments
* Build script changes

## 1910.28

* Adds `Get-mRemoteNG`
* Update version format to `YearMonth.Build` (hopefully we won't change this again)
* Automate versioning in the module to the new format
* Automate update of `appveyor.yml` as `YearMonth` changes
* Output variables in AppVeyor to `\tests\appveyor.md`

## 1910.18.26

* Adds `Get-OpenJDK`
* Changes version notation to: YearMonth.Day.Build

## 19.10.25

* Adds `Get-MicrosoftOffice`

## 19.10.24

* Fixes URIs for updates in `Get-AdobeAcrobatReaderDC`
* Adds additional Pester tests for Public functions to ensure generated URI values are valid

## 19.10.21

* Adds `Get-FoxitReader`

## 19.10.20

* Fixes output in `Get-GitForWindows`, `Get-MicrosoftSmss`

## 19.10.19

* Adds `Get-GitForWindows`, `Get-ShareX`

## 19.10.11

* Adds `Get-Java8`

## 19.10.9

* Adds `Get-BISF`
* Adds `ConvertTo-DateTime` private function to handle DateTime conversion on PowerShell Core / Windows PowerShell

## 19.10.2

* First version pushed to the PowerShell Gallery
* Initial functions are:

`Export-EvergreenResourceStrings`, `Get-AdobeAcrobatReaderDC`, `Get-CitrixAppLayeringFeed`, `Get-CitrixApplicationDeliveryManagementFeed`, `Get-CitrixEndpointManagementFeed`, `Get-CitrixGatewayFeed`, `Get-CitrixHypervisorFeed`, `Get-CitrixLicensingFeed`, `Get-CitrixReceiverFeed`, `Get-CitrixSdwanFeed`, `Get-CitrixVirtualAppsDesktopsFeed`, `Get-CitrixWorkspaceApp`, `Get-CitrixWorkspaceAppFeed`, `Get-CitrixXenServerTools`, `Get-ControlUpAgent`, `Get-FileZilla`, `Get-GoogleChrome`, `Get-Greenshot`, `Get-LibreOffice`, `Get-MicrosoftPowerShellCore`, `Get-MicrosoftSsms`, `Get-MicrosoftVisualStudioCode`, `Get-MozillaFirefox`, `Get-NotepadPlusPlus`, `Get-OracleVirtualBox`, `Get-PaintDotNet`, `Get-VideoLanVlcPlayer`, `Get-VMwareTools`, `Get-Zoom`
