function Update-SpdxLicense
{
    <#
        .SYNOPSIS
            Updates SPDX License list.
        .DESCRIPTION
            Updates SPDX License list.
        .PARAMETER Uri
            A string containing the URI of the content to update list from.
        .PARAMETER Timeout
            An integer containing the timeout in seconds for the web request.
        .PARAMETER Path
            A string containing the path of the file to update list from.
        .PARAMETER Force
            A switch pecifying whether or not to force the update (overrides WhatIf if specified).
        .INPUTS
        .OUTPUTS
        .EXAMPLE
            Update-SpdxLicense -Path ".\licenses.json"

            Description
            -----------
            This example will update the list from the file ".\licenses.json".
        .EXAMPLE
            Get-SpdxLicense -Uri "https://raw.githubusercontent.com/spdx/license-list-data/master/json/licenses.json" -Force

            Description
            -----------
            This example will update the list from the URI "https://raw.githubusercontent.com/spdx/license-list-data/master/json/licenses.json".
        .NOTES
        .LINK
            Get-SpdxLicense
        .LINK
            https://spdx.org/licenses/
    #>
    [CmdLetBinding(DefaultParameterSetName = "FromUri", SupportsShouldProcess = $true, ConfirmImpact = 'High')]
    param(
        [Parameter(ParameterSetName = "FromUri", Mandatory = $false)]
        [ValidateNotNullOrEmpty()]
        [Alias("u")]
        [string] $Uri = "$($script:SourceFileBaseUrl)licenses.json",
        [Parameter(ParameterSetName = "FromUri", Mandatory = $false)]
        [Alias("t")]
        [int] $Timeout,
        [Parameter(ParameterSetName = "FromPath", Mandatory = $true)]
        [ValidateScript( { Test-Path $_ })]
        [Alias("p")]
        [string] $Path,
        [Parameter(ParameterSetName = "FromUri", Mandatory = $false)]
        [Parameter(ParameterSetName = "FromPath", Mandatory = $false)]
        [Alias("f")]
        [switch] $Force
    )

    try 
    {
        $LicensesFilePath = (Get-SpdxLicenseFile).FullName
        if (Test-Path $LicensesFilePath)
        {
            Write-Verbose ($global:LocalizedData.UpdateSpdxLicense.Verbose.LicenseFile -f $LicensesFilePath)
            $Json = Get-Content -Path $LicensesFilePath | ConvertFrom-Json
            Write-Verbose ($global:LocalizedData.UpdateSpdxLicense.Verbose.CurrentVersion -f $Json.licenseListVersion)
        }

        switch -Regex ($PSCmdlet.ParameterSetName)
        {
            "FromUri" { $Content = (Invoke-WebRequest -Uri $Uri -TimeoutSec $TImeout).Content }
            "FromPath"
            {
                Write-Verbose ($global:LocalizedData.UpdateSpdxLicense.Verbose.GetContent -f $Path)
                $Content = Get-Content -Path $Path -ErrorAction Stop
            }
        }

        $Json = $Content | ConvertFrom-Json -ErrorAction Stop
        Write-Verbose ($global:LocalizedData.UpdateSpdxLicense.Verbose.NewVersion -f $Json.licenseListVersion)

        if ($Force -or $PSCmdlet.ShouldProcess($LicensesFilePath))
        {
            $Content | Set-Content -Path $LicensesFilePath
            Write-Verbose ($global:LocalizedData.UpdateSpdxLicense.Verbose.Updated -f $LicensesFilePath)
        }
    }
    catch
    {
        Write-Error $_
    }
    finally
    {
    }
}