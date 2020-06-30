@{
    Module                            = @{
        Describe     = "Module"
        ImportModule = "Importing module locally."
        CommandCheck = "Checking exported commands count."
    }

    GetSpdxLicenseFile                = @{
        Describe = "Get-SpdxLicenseFile"
        GetFile  = "Getting license file."
    }
    
    GetSpdxLicenseExceptionFile       = @{
        Describe = "Get-SpdxLicenseExceptionFile"
        GetFile  = "Getting license exception file."
    }

    GetSpdxLicenseOffline             = @{
        Describe                 = "Get-SpdxLicense (offline)"
        ByName                   = "Getting 'BSD*' SPDX License by name."
        ById                     = "Getting 'BSD*' SPDX License by ID."
        ByReferenceNumber        = "Getting 'BSD Zero Clause License' SPDX License by reference number (315)."
        ByReferenceNumberExclude = "Getting 'Affero General Public License v1.0' SPDX License by ID (AGPL-1.0) with option ExcludeDeprecated."
        Osi                      = "Getting 'Affero General Public License v1.0' SPDX License by ID (AGPL-1.0) with option OsiApproved."
        Fsf                      = "Getting 'Affero General Public License v1.0' SPDX License by ID (AGPL-1.0) with option FsfLibre."
        OsiFsfExclude            = "Getting OSI approved, FSF Libre and not deprecated licenses."
    }

    GetSpdxLicenseExceptionOffline    = @{
        Describe                 = "Get-SpdxLicenseException (offline)"
        ByName                   = "Getting '*GPL*' SPDX License exceptions by name."
        ById                     = "Getting '*GPL*' SPDX License exception by ID."
        ByReferenceNumber        = "Getting 'Nokia-Qt-exception-1.1' SPDX License exception by reference number (22)."
        ByReferenceNumberExclude = "Getting 'Nokia-Qt-exception-1.1' SPDX License exception by reference number (3) with option ExcludeDeprecated."
        Exclude                  = "Getting not deprecated licenses exceptions."
    }

    GetSpdxLicenseOnline              = @{
        Describe = "Get-SpdxLicense (online)"
        Text     = "Getting 'BSD Zero Clause License' SPDX License by ID (0BSD) with text."
    }

    GetSpdxLicenseExceptionOnline     = @{
        Describe = "Get-SpdxLicenseException (online)"
        Text     = "Getting 'Nokia Qt LGPL exception 1.1' SPDX License exception by ID (Nokia-Qt-exception-1.1) with text."
    }
    
    GetSpdxLicenseText                = @{
        Describe = "Get-SpdxLicenseText"
        Text     = "Getting 'BSD Zero Clause License' SPDX License text."
    }
    
    GetSpdxLicenseExceptionText       = @{
        Describe = "Get-SpdxLicenseExceptionText"
        Text     = "Getting 'Nokia Qt LGPL exception 1.1' SPDX License exception text."
    }

    UpdateSpdxLicenseOnline           = @{
        Describe = "Update-SpdxLicense (online)"
        Update   = "Simulating update of license file."
    }
    
    UpdateSpdxLicenseExceptionOnline  = @{
        Describe = "Update-SpdxLicenseException (online)"
        Update   = "Simulating update of license exception file."
    }
    
    UpdateSpdxLicenseOffline          = @{
        Describe = "Update-SpdxLicense (offline)"
        Update   = "Simulating update of license file."
    }
    
    UpdateSpdxLicenseExceptionOffline = @{
        Describe = "Update-SpdxLicenseException (offline)"
        Update   = "Simulating update of license exception file."
    }
}