function Get-SpdxLicenseFile
{
    <#
        .SYNOPSIS
            Gets SPDX license file.
        .DESCRIPTION
            Gets SPDX license file.
        .INPUTS
        .OUTPUTS
            System.IO.FileInfo
            This cmdlet returns the FileInfo of the licence file.
        .EXAMPLE
            Get-SpdxLicenseFile

            Description
            -----------
            This example will return the FileInfo representing the license file.
        .NOTES
        .LINK
            https://spdx.org/licenses/
    #>
    [CmdLetBinding()]
    param()

    try 
    {
        $LicensesFilePath = Join-Path (Split-Path $PSScriptRoot -Parent) "licenses\licenses.json"
        if (Test-Path $LicensesFilePath) { Get-Item -Path $LicensesFilePath }
        else { Write-Error -Message ($global:LocalizedData.GetSpdxLicenseFile.Error.Message -f $LicensesFilePath) -Category ObjectNotFound -CategoryActivity $MyInvocation.MyCommand -TargetName $LicensesFilePath -TargetType $global:LocalizedData.GetSpdxLicenseFile.Error.Target -Exception ObjectNotFoundException }
    }
    catch
    {
        Write-Error $_
    }
}