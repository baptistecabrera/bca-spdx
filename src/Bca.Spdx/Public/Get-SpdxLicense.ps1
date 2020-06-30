function Get-SpdxLicense
{
    <#
        .SYNOPSIS
            Gets SPDX License(s).
        .DESCRIPTION
            Gets SPDX License(s).
        .PARAMETER Id
            A string array containing the ID(s) of the license(s) to get.
        .PARAMETER Name
            A string array containing the name(s) of the license(s) to get.
        .PARAMETER ReferenceNumber
            An integer array containing the reference number(s) of the license(s) to get.
        .PARAMETER OsiApproved
            A switch specifying to only get Open Source Initiative approved licenses.
        .PARAMETER FsfLibre
            A switch specifying to only get Free Software Foundation Free/Libre licenses.
        .PARAMETER ExcludeDeprecated
            A switch specifying to exclude deprecated licenses.
        .PARAMETER LicenseText
            A switch specifying to retrieve license text.
            This option requires an Internet connection.
        .INPUTS
        .OUTPUTS
            System.Management.Automation.PSCustomObject
            This cmdlet returns a PSCustomObject containing the details of the license(s).
        .EXAMPLE
            Get-SpdxLicense -Id "AFL-3.0"

            Description
            -----------
            This example will return information of the license "AFL-3.0" (Academic Free License v3.0).
        .EXAMPLE
            Get-SpdxLicense -Id "AFL-3.*"

            Description
            -----------
            This example will return information of the license(s) where the ID matches "AFL-3.*".
        .EXAMPLE
            Get-SpdxLicense -Name "BSD Zero Clause License"

            Description
            -----------
            This example will return information of the license named "BSD Zero Clause License".
        .EXAMPLE
            Get-SpdxLicense -Name "BSD*"

            Description
            -----------
            This example will return information of the license(s) where the name matched "BSD*".
        .EXAMPLE
            Get-SpdxLicense -FsfLibre

            Description
            -----------
            This example will return information of the license(s) that are FSF Libre/Free.
        .EXAMPLE
            Get-SpdxLicense -OsiApproved

            Description
            -----------
            This example will return information of the license(s) that are OSI approved.
        .EXAMPLE
            Get-SpdxLicense -FsfLibre -OsiApproved -ExcludeDeprecated -LicenseText

            Description
            -----------
            This example will return information of the license(s) that are FSF Libre/Free AND OSI approved AND not deprecated, and retrieve their text(s).
        .NOTES
            This CmdLet does not require an Internet connection, except when using switch LicenseText.
            It is strongly advised to use Update-SpdxLicense (without parameters) to update the offline file from https://spdx.org/licenses/.
        .LINK
            Get-SpdxLicenseText
        .LINK
            https://spdx.org/licenses/
        .LINK
            https://opensource.org/licenses/
        .LINK
            https://www.fsf.org/licensing/
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
        [Alias("Osi")]
        [switch] $OsiApproved,
        [Parameter(ParameterSetName = "FromReferenceNumber", Mandatory = $false)]
        [Parameter(ParameterSetName = "FromName", Mandatory = $false)]
        [Parameter(ParameterSetName = "FromId", Mandatory = $false)]
        [Alias("FsfFree", "Fsf")]
        [switch] $FsfLibre,
        [Parameter(ParameterSetName = "FromReferenceNumber", Mandatory = $false)]
        [Parameter(ParameterSetName = "FromName", Mandatory = $false)]
        [Parameter(ParameterSetName = "FromId", Mandatory = $false)]
        [Alias("xd")]
        [switch] $ExcludeDeprecated,
        [Parameter(ParameterSetName = "FromReferenceNumber", Mandatory = $false)]
        [Parameter(ParameterSetName = "FromName", Mandatory = $false)]
        [Parameter(ParameterSetName = "FromId", Mandatory = $false)]
        [Alias("t")]
        [switch] $LicenseText
    )

    try 
    {
        $LicensesFilePath = (Get-SpdxLicenseFile).FullName
        Write-Verbose ($global:LocalizedData.GetSpdxLicense.Verbose.GetFile -f $LicensesFilePath)
        $Json = Get-Content -Path $LicensesFilePath | ConvertFrom-Json
        Write-Verbose ($global:LocalizedData.GetSpdxLicense.Verbose.Version -f $Json.licenseListVersion)
        $License = $Json.licenses
        $ReturnLicense = @()
        switch -Regex ($PSCmdlet.ParameterSetName)
        {
            "FromId"
            {
                $Id | ForEach-Object {
                    $CurrentId = $_
                    $ReturnLicense += $License | Where-Object { $_.licenseId -like $CurrentId }
                }
            }
            "FromName"
            {
                $Name | ForEach-Object {
                    $CurrentName = $_
                    $ReturnLicense += $License | Where-Object { $_.name -like $CurrentName }
                }
            }
            "FromReferenceNumber"
            {
                $ReturnLicense = $License | Where-Object { $_.referenceNumber -in $ReferenceNumber }
            }
        }
        Write-Verbose ($global:LocalizedData.GetSpdxLicense.Verbose.OsiApproved -f $OsiApproved)
        Write-Verbose ($global:LocalizedData.GetSpdxLicense.Verbose.FsfLibre -f $FsfLibre)
        Write-Verbose ($global:LocalizedData.GetSpdxLicense.Verbose.ExcludeDeprecated -f $ExcludeDeprecated)
        if ($OsiApproved) { $ReturnLicense = $ReturnLicense | Where-Object { $_.isOsiApproved } }
        if ($FsfLibre) { $ReturnLicense = $ReturnLicense | Where-Object { $_.isFsfLibre } }
        if ($ExcludeDeprecated) { $ReturnLicense = $ReturnLicense | Where-Object { !$_.isDeprecatedLicenseId } }
        if ($LicenseText) { $ReturnLicense | ForEach-Object { $_ | Add-Member -MemberType NoteProperty -Name licenseText -Value (Get-SpdxLicenseText -Id $_.licenseId) -PassThru } }
        else { $ReturnLicense }
    }
    catch
    {
        Write-Error $_
    }
}