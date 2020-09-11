function Update-SpdxLicenseException
{
    <#
        .SYNOPSIS
            Updates SPDX License exceptions list.
        .DESCRIPTION
            Updates SPDX License exceptions list.
        .PARAMETER Uri
            A URI containing the URI of the content to update list from.
        .PARAMETER Timeout
            An integer containing the timeout in seconds for the web request.
        .PARAMETER Path
            A string containing the path of the file to update list from.
        .PARAMETER Force
            A switch pecifying whether or not to force the update (overrides WhatIf if specified).
        .INPUTS
        .OUTPUTS
        .EXAMPLE
            Update-SpdxLicenseException -Path ".\exceptions.json"

            Description
            -----------
            This example will update the list from the file ".\exceptions.json".
        .EXAMPLE
            Get-SpdxLicense -Uri "https://raw.githubusercontent.com/spdx/license-list-data/master/json/exceptions.json" -Force

            Description
            -----------
            This example will update the list from the URI "https://raw.githubusercontent.com/spdx/license-list-data/master/json/exceptions.json".
        .NOTES
        .LINK
            Get-SpdxLicenseException
        .LINK
            https://spdx.org/licenses/
        .LINK
            https://spdx.org/licenses/exceptions-index.html
    #>
    [CmdLetBinding(DefaultParameterSetName = "FromUri", SupportsShouldProcess = $true, ConfirmImpact = 'High')]
    param(
        [Parameter(ParameterSetName = "FromUri", Mandatory = $false)]
        [ValidateNotNullOrEmpty()]
        [Alias("u")]
        [uri] $Uri = "$((Get-SpdxSourceUrl).AbsoluteUri)exceptions.json",
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
        $ExceptionsFilePath = (Get-SpdxLicenseExceptionFile).FullName
        if (Test-Path $ExceptionsFilePath)
        {
            Write-Verbose ($global:LocalizedData.UpdateSpdxLicenseException.Verbose.LicenseFile -f $LicensesFilePath)
            $Json = Get-Content -Path $ExceptionsFilePath | ConvertFrom-Json
            Write-Verbose ($global:LocalizedData.UpdateSpdxLicenseException.Verbose.CurrentVersion -f $Json.licenseListVersion)
        }

        switch -Regex ($PSCmdlet.ParameterSetName)
        {
            "FromUri" { $Content = (Invoke-WebRequest -Uri $Uri -TimeoutSec $TImeout).Content }
            "FromPath"
            {
                Write-Verbose ($global:LocalizedData.UpdateSpdxLicenseException.Verbose.GetContent -f $Path)
                $Content = Get-Content -Path $Path -ErrorAction Stop
            }
        }

        $Json = $Content | ConvertFrom-Json -ErrorAction Stop
        Write-Verbose ($global:LocalizedData.UpdateSpdxLicenseException.Verbose.NewVersion -f $Json.licenseListVersion)

        if ($Force -or $PSCmdlet.ShouldProcess($ExceptionsFilePath))
        {
            $Content | Set-Content -Path $ExceptionsFilePath
            Write-Verbose ($global:LocalizedData.UpdateSpdxLicenseException.Verbose.Updated -f $ExceptionsFilePath)
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