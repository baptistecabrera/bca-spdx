function Get-SpdxLicenseExceptionFile
{
    <#
        .SYNOPSIS
            Gets SPDX license exception file.
        .DESCRIPTION
            Gets SPDX license exception file.
        .INPUTS
        .OUTPUTS
            System.IO.FileInfo
            This cmdlet returns the FileInfo of the licence exeception file.
        .EXAMPLE
            Get-SpdxLicenseExceptionFile

            Description
            -----------
            This example will return the FileInfo representing the license exception file.
        .NOTES
        .LINK
            https://spdx.org/licenses/
        .LINK
            https://spdx.org/licenses/exceptions-index.html
    #>
    [CmdLetBinding()]
    param()

    try 
    {
        $LicensesExceptionFilePath = Join-Path (Split-Path $PSScriptRoot -Parent) "exceptions/exceptions.json"
        if (Test-Path $LicensesExceptionFilePath) { Get-Item -Path $LicensesExceptionFilePath }
        else { Write-Error -Message ($global:LocalizedData.GetSpdxLicenseExceptionFile.Error.Message -f $LicensesExceptionFilePath) -Category ObjectNotFound -CategoryActivity $MyInvocation.MyCommand -TargetName $LicensesExceptionFilePath -TargetType $global:LocalizedData.GetSpdxLicenseExceptionFile.Error.Target -Exception ObjectNotFoundException }
    }
    catch
    {
        Write-Error $_
    }
}