Function Resolve-DnsNameWrapper {
    <#
        .SYNOPSIS
            Wrap Resolve-DnsName to filter what's returned 
    #>
    [OutputType([Microsoft.DnsClient.Commands.DnsRecord])]
    [CmdletBinding(SupportsShouldProcess = $False)]
    param (
        [Parameter(Mandatory = $True, Position = 0)]
        [ValidateNotNullOrEmpty()]
        [System.String] $Name,

        [Parameter(Position = 1)]
        [ValidateNotNullOrEmpty()]
        [System.String] $Type = "A"
    )

    # Resolve-DnsName only exists on Windows
    If (($Null -eq $PSVersionTable.OS) -or ($PSVersionTable.OS -match "Microsoft Windows*")) {

        # Wrap Resolve-DnsName
        Write-Verbose -Message "$($MyInvocation.MyCommand): Resolving: $Name, with type: $Type."
        try {
            $params = @{
                Name        = $Name
                Type        = $Type
                ErrorAction = "SilentlyContinue"
            }
            $Response = Resolve-DnsName @params | Where-Object { $_.Type -eq $Type }
        }
        catch {
            Write-Error -Message "$($MyInvocation.MyCommand): $($_.Exception.Message)."
        }
        If ($Null -ne $Response) {
            Write-Output -InputObject $Response
        }
        Else {
            Write-Error -Message "$($MyInvocation.MyCommand): returned a null object from Resolve-DnsName."
        }
    }
    Else {
        Write-Error -Message "$($MyInvocation.MyCommand): this function requires the Resolve-DnsName on Microsoft Windows."
    }
}
