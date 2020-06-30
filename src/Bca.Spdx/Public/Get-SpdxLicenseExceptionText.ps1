function Get-SpdxLicenseExceptionText
{
    <#
        .SYNOPSIS
            Gets an SPDX License exception text.
        .DESCRIPTION
            Gets an SPDX License exception text from https://spdx.org.
        .PARAMETER Id
            A string containing the ID of the license exception.
        .PARAMETER Name
            A string containing the name of the license exception.
        .PARAMETER ReferenceNumber
            An integer containing the reference number of the license exception.
        .INPUTS
        .OUTPUTS
            System.String
            This cmdlet returns a string containing the text of the license exception.
        .EXAMPLE
            Get-SpdxLicenseExceptionText -Id "Libtool-exception"

            Description
            -----------
            This example will return the text of the license exception "Libtool-exception" (Libtool Exception).
        .EXAMPLE
            Get-SpdxLicenseExceptionText -Name "Linux Syscall Note"

            Description
            -----------
            This example will return the text of the license exception named "Linux Syscall Note".
        .NOTES
            This CmdLet requires an Internet connection.
        .LINK
            Get-SpdxLicenseException
        .LINK
            https://spdx.org/licenses/
        .LINK
            https://spdx.org/licenses/exceptions-index.html
    #>
    [CmdLetBinding(DefaultParameterSetName = "FromId")]
    param(
        [Parameter(ParameterSetName = "FromId", Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [Alias("i")]
        [string] $Id,
        [Parameter(ParameterSetName = "FromName", Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [Alias("n")]
        [string] $Name,
        [Parameter(ParameterSetName = "FromReferenceNumber", Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [Alias("r", "ref")]
        [int] $ReferenceNumber
    )

    try 
    {
        $Exception = Get-SpdxLicenseException @PSBoundParameters
        Write-Verbose ($global:LocalizedData.GetSpdxLicenseExceptionText.Verbose.GetException -f $Exception.name, $Exception.licenseExceptionId)
        (((Invoke-WebRequest -Uri $Exception.detailsUrl).Content) | ConvertFrom-Json).licenseExceptionText
    }
    catch
    {
        Write-Error $_
    }
}