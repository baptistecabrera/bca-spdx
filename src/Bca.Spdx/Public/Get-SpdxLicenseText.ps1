function Get-SpdxLicenseText
{
    <#
        .SYNOPSIS
            Gets an SPDX License text.
        .DESCRIPTION
            Gets an SPDX License text from https://spdx.org.
        .PARAMETER Id
            A string containing the ID of the license.
        .PARAMETER Name
            A string containing the name of the license.
        .PARAMETER ReferenceNumber
            An integer containing the reference number of the license.
        .INPUTS
        .OUTPUTS
            System.String
            This cmdlet returns a string containing the text of the license.
        .EXAMPLE
            Get-SpdxLicenseText -Id "AFL-3.0"

            Description
            -----------
            This example will return the text of the license "AFL-3.0" (Academic Free License v3.0).
        .EXAMPLE
            Get-SpdxLicenseText -Name "BSD Zero Clause License"

            Description
            -----------
            This example will return the text of the license named "BSD Zero Clause License".
        .NOTES
            This CmdLet requires an Internet connection.
        .LINK
            Get-SpdxLicense
        .LINK
            https://spdx.org/licenses/
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
        $License = Get-SpdxLicense @PSBoundParameters
        Write-Verbose ($global:LocalizedData.GetSpdxLicenseText.Verbose.GetLicense -f $License.name, $License.licenseId)
        (((Invoke-WebRequest -Uri $License.detailsUrl).Content) | ConvertFrom-Json).licenseText
    }
    catch
    {
        Write-Error $_
    }
}