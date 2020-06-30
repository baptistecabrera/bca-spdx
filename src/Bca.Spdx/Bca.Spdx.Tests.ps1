if (Test-Path (Join-Path $PSScriptRoot LocalizedData))
{
    $global:TestLocalizedData = Import-LocalizedData -BaseDirectory (Join-Path $PSScriptRoot LocalizedData) -ErrorAction SilentlyContinue
    if (!$?) { $global:TestLocalizedData = Import-LocalizedData -UICulture en-US -BaseDirectory (Join-Path $PSScriptRoot LocalizedData) }
}

Describe $global:TestLocalizedData.Module.Describe -Tags "Online", "Offline" {
    It $global:TestLocalizedData.Module.ImportModule {
        try
        {
            Import-Module (Join-Path $PSScriptRoot Bca.Spdx.psd1) -Force
            $Result = $true
        }
        catch { $Result = $false }
        $Result | Should Be $true
    }
    
    It $global:TestLocalizedData.Module.CommandCheck {
        $Commands = Get-Command -Module Bca.Spdx
        $Commands.Count | Should BeGreaterThan 0
    }
}

Describe $global:TestLocalizedData.GetSpdxLicenseFile.Describe -Tags "Online", "Offline" {
    It $global:TestLocalizedData.GetSpdxLicenseFile.GetFile {
        try
        {
            $Result = Get-SpdxLicenseFile
        }
        catch { $Result = $false }
        $Result | Should Be $true
    }
}

Describe $global:TestLocalizedData.GetSpdxLicenseExceptionFile.Describe -Tags "Online", "Offline" {
    It $global:TestLocalizedData.GetSpdxLicenseExceptionFile.GetFile {
        try
        {
            $Result = Get-SpdxLicenseExceptionFile
        }
        catch { $Result = $false }
        $Result | Should Be $true
    }
}

Describe $global:TestLocalizedData.GetSpdxLicenseOffline.Describe -Tags "Online", "Offline" {
    It $global:TestLocalizedData.GetSpdxLicenseOffline.ByName {
        try
        {
            $Result = (Get-SpdxLicense -Name "BSD*").Count
        }
        catch { $Result = 0 }
        $Result | Should BeGreaterThan 1
    }
    
    It $global:TestLocalizedData.GetSpdxLicenseOffline.ById {
        try
        {
            $Result = (Get-SpdxLicense -Id "BSD*").Count
        }
        catch { $Result = 0 }
        $Result | Should BeGreaterThan 1
    }

    It $global:TestLocalizedData.GetSpdxLicenseOffline.ByReferenceNumber {
        try
        {
            $Result = Get-SpdxLicense -ReferenceNumber 315
        }
        catch { $Result = $false }
        $Result | Should Be $true
    }

    It $global:TestLocalizedData.GetSpdxLicenseOffline.ByReferenceNumberExclude {
        try
        {
            $Result = Get-SpdxLicense -Id "AGPL-1.0" -ExcludeDeprecated
        }
        catch { $Result = $true }
        $Result | Should Be $null
    }

    It $global:TestLocalizedData.GetSpdxLicenseOffline.Osi {
        try
        {
            $Result = Get-SpdxLicense -Id "AGPL-1.0" -OsiApproved
        }
        catch { $Result = $true }
        $Result | Should Be $null
    }

    It $global:TestLocalizedData.GetSpdxLicenseOffline.Fsf {
        try
        {
            $Result = Get-SpdxLicense -Id "AGPL-1.0" -FsfLibre
        }
        catch { $Result = $false }
        $Result | Should Be $true
    }

    It $global:TestLocalizedData.GetSpdxLicenseOffline.OsiFsfExclude {
        try
        {
            $Result = (Get-SpdxLicense -OsiApproved -FsfLibre -ExcludeDeprecated).Count
        }
        catch { $Result = 0 }
        $Result | Should BeGreaterThan 1
    }
}

Describe $global:TestLocalizedData.GetSpdxLicenseExceptionOffline.Describe -Tags "Online", "Offline" {
    It $global:TestLocalizedData.GetSpdxLicenseExceptionOffline.ByName {
        try
        {
            $Result = (Get-SpdxLicenseException -Name "*GPL*").Count
        }
        catch { $Result = 0 }
        $Result | Should BeGreaterThan 1
    }
    
    It $global:TestLocalizedData.GetSpdxLicenseExceptionOffline.ById {
        try
        {
            $Result = (Get-SpdxLicenseException -Id "*GPL*").Count
        }
        catch { $Result = 0 }
        $Result | Should BeGreaterThan 1
    }

    It $global:TestLocalizedData.GetSpdxLicenseExceptionOffline.ByReferenceNumber {
        try
        {
            $Result = Get-SpdxLicenseException -ReferenceNumber 22
        }
        catch { $Result = $false }
        $Result | Should Be $true
    }

    It $global:TestLocalizedData.GetSpdxLicenseExceptionOffline.ByReferenceNumberExclude {
        try
        {
            $Result = Get-SpdxLicenseException -ReferenceNumber 3 -ExcludeDeprecated
        }
        catch { $Result = $true }
        $Result | Should Be $null
    }

    It $global:TestLocalizedData.GetSpdxLicenseExceptionOffline.Exclude {
        try
        {
            $Result = (Get-SpdxLicenseException -ExcludeDeprecated).Count
        }
        catch { $Result = 0 }
        $Result | Should BeGreaterThan 1
    }
}

Describe $global:TestLocalizedData.GetSpdxLicenseOnline.Describe -Tags "Online" {
    It $global:TestLocalizedData.GetSpdxLicenseOnline.Text {
        try
        {
            $Result = (Get-SpdxLicense -Id "0BSD" -LicenseText).licenseText
        }
        catch { $Result = $false }
        $Result | Should Be $true
    }
}

Describe $global:TestLocalizedData.GetSpdxLicenseExceptionOnline.Describe -Tags "Online" {
    It $global:TestLocalizedData.GetSpdxLicenseExceptionOnline.Text {
        try
        {
            $Result = (Get-SpdxLicenseException -Id "Nokia-Qt-exception-1.1" -ExceptionText).licenseExceptionText
        }
        catch { $Result = $false }
        $Result | Should Be $true
    }
}

Describe $global:TestLocalizedData.GetSpdxLicenseText.Describe -Tags "Online" {
    It $global:TestLocalizedData.GetSpdxLicenseText.Text {
        try
        {
            $Result = Get-SpdxLicenseText -Id "0BSD"
        }
        catch { $Result = $false }
        $Result | Should Be $true
    }
}

Describe $global:TestLocalizedData.GetSpdxLicenseExceptionText.Describe -Tags "Online" {
    It $global:TestLocalizedData.GetSpdxLicenseExceptionText.Text {
        try
        {
            $Result = Get-SpdxLicenseExceptionText -Id "Nokia-Qt-exception-1.1"
        }
        catch { $Result = $false }
        $Result | Should Be $true
    }
}

Describe $global:TestLocalizedData.UpdateSpdxLicenseOnline.Describe -Tags "Online" {
    It $global:TestLocalizedData.UpdateSpdxLicenseOnline.Update {
        try
        {
            Update-SpdxLicense -WhatIf
            $Result = $true
        }
        catch { $Result = $false }
        $Result | Should Be $true
    }
}

Describe $global:TestLocalizedData.UpdateSpdxLicenseExceptionOnline.Describe -Tags "Online" {
    It $global:TestLocalizedData.UpdateSpdxLicenseExceptionOnline.Update {
        try
        {
            Update-SpdxLicenseException -WhatIf
            $Result = $true
        }
        catch { $Result = $false }
        $Result | Should Be $true
    }
}

Describe $global:TestLocalizedData.UpdateSpdxLicenseOffline.Describe -Tags "Online", "Offline" {
    It $global:TestLocalizedData.UpdateSpdxLicenseOffline.Update {
        try
        {
            Update-SpdxLicense -Path (Get-SpdxLicenseFile).FullName -WhatIf
            $Result = $true
        }
        catch { $Result = $false }
        $Result | Should Be $true
    }
}

Describe $global:TestLocalizedData.UpdateSpdxLicenseExceptionOffline.Describe -Tags "Online", "Offline" {
    It $global:TestLocalizedData.UpdateSpdxLicenseExceptionOffline.Update {
        try
        {
            Update-SpdxLicenseException -Path (Get-SpdxLicenseExceptionFile).FullName -WhatIf
            $Result = $true
        }
        catch { $Result = $false }
        $Result | Should Be $true
    }
}