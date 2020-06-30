function Get-SpdxLicenseException
{
    <#
        .SYNOPSIS
            Gets SPDX License exceptions.
        .DESCRIPTION
            Gets SPDX License exceptions.
        .PARAMETER Id
            A string array containing the ID(s) of the license exceptions(s) to get.
        .PARAMETER Name
            A string array containing the name(s) of the license exceptions(s) to get.
        .PARAMETER ReferenceNumber
            An integer array containing the reference number(s) of the license exceptions(s) to get.
        .PARAMETER ExcludeDeprecated
            A switch specifying to exclude deprecated licenses.
        .PARAMETER ExceptionText
            A switch specifying to retrieve license text.
            This option requires an Internet connection.
        .INPUTS
        .OUTPUTS
            System.Management.Automation.PSCustomObject
            This cmdlet returns a PSCustomObject containing the details of the license(s).
        .EXAMPLE
            Get-SpdxLicenseException -Id "Libtool-exception"

            Description
            -----------
            This example will return information of the license exception "Libtool-exception" (Libtool Exception).
        .EXAMPLE
            Get-SpdxLicenseException -Id "*GPL*"

            Description
            -----------
            This example will return information of the license exceptions(s) where the ID matches "*GPL*".
        .EXAMPLE
            Get-SpdxLicenseException -Name "Linux Syscall Note"

            Description
            -----------
            This example will return information of the license exception named "Linux Syscall Note".
        .EXAMPLE
            Get-SpdxLicenseException -Name "Autoconf exception*"

            Description
            -----------
            This example will return information of the license exception(s) where the name matched "Autoconf exception*".
        .EXAMPLE
            Get-SpdxLicenseException -ExcludeDeprecated -ExceptionText

            Description
            -----------
            This example will return information of the license exception(s) that are not deprecated, and retrieve their text(s).
        .NOTES
            This CmdLet does not require an Internet connection, except when using switch ExceptionText.
            It is strongly advised to use Update-SpdxLicenseExceptions (without parameters) to update the offline file from https://spdx.org/licenses/.
        .LINK
            Get-SpdxLicenseExceptionText
        .LINK
            https://spdx.org/licenses/
        .LINK
            https://spdx.org/licenses/exceptions-index.html
    #>
    [CmdLetBinding(DefaultParameterSetName = "FromId")]
    param(
        [Parameter(ParameterSetName = "FromId", Mandatory = $false)]
        [ValidateNotNullOrEmpty()]
        [Alias("i")]
        [string[]] $Id = "*",
        [Parameter(ParameterSetName = "FromName", Mandatory = $false)]
        [ValidateNotNullOrEmpty()]
        [Alias("n")]
        [string[]] $Name = "*",
        [Parameter(ParameterSetName = "FromReferenceNumber", Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [Alias("r", "ref")]
        [int[]] $ReferenceNumber,
        [Parameter(ParameterSetName = "FromReferenceNumber", Mandatory = $false)]
        [Parameter(ParameterSetName = "FromName", Mandatory = $false)]
        [Parameter(ParameterSetName = "FromId", Mandatory = $false)]
        [Alias("xd")]
        [switch] $ExcludeDeprecated,
        [Parameter(ParameterSetName = "FromReferenceNumber", Mandatory = $false)]
        [Parameter(ParameterSetName = "FromName", Mandatory = $false)]
        [Parameter(ParameterSetName = "FromId", Mandatory = $false)]
        [Alias("t")]
        [switch] $ExceptionText
    )

    try 
    {
        $LicenseExceptionsFilePath = (Get-SpdxLicenseExceptionFile).FullName
        Write-Verbose ($global:LocalizedData.GetSpdxLicenseException.Verbose.GetFile -f $LicenseExceptionsFilePath)
        $Json = Get-Content -Path $LicenseExceptionsFilePath | ConvertFrom-Json
        Write-Verbose ($global:LocalizedData.GetSpdxLicenseException.Verbose.Version -f $Json.licenseListVersion)
        $Exceptions = $Json.exceptions
        $ReturnExceptions = @()
        switch -Regex ($PSCmdlet.ParameterSetName)
        {
            "FromId"
            {
                $Id | ForEach-Object {
                    $CurrentId = $_
                    $ReturnExceptions += $Exceptions | Where-Object { $_.licenseExceptionId -like $CurrentId }
                }
            }
            "FromName"
            {
                $Name | ForEach-Object {
                    $CurrentName = $_
                    $ReturnExceptions += $Exceptions | Where-Object { $_.name -like $CurrentName }
                }
            }
            "FromReferenceNumber"
            {
                $ReturnExceptions = $Exceptions | Where-Object { $_.referenceNumber -in $ReferenceNumber }
            }
        }
        Write-Verbose ($global:LocalizedData.GetSpdxLicenseException.Verbose.ExcludeDeprecated -f $ExcludeDeprecated)
        if ($ExcludeDeprecated) { $ReturnExceptions = $ReturnExceptions | Where-Object { !$_.isDeprecatedLicenseId } }
        if ($ExceptionText) { $ReturnExceptions | ForEach-Object { $_ | Add-Member -MemberType NoteProperty -Name licenseExceptionText -Value (Get-SpdxLicenseExceptionText -Id $_.licenseExceptionId) -PassThru } }
        else { $ReturnExceptions }
    }
    catch
    {
        Write-Error $_
    }
}