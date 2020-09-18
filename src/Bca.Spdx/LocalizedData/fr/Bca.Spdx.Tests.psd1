@{
    Module                            = @{
        Describe     = "Module"
        ImportModule = "Importation locale du module."
        CommandCheck = "Vérification du nombre de fonctions exportées."
    }

    GetSpdxLicenseFile                = @{
        Describe = "Get-SpdxLicenseFile"
        GetFile  = "Récupération du fichier de licences."
    }
    
    GetSpdxLicenseExceptionFile       = @{
        Describe = "Get-SpdxLicenseExceptionFile"
        GetFile  = "Récupération du fichier d'exceptions de licence."
    }

    GetSpdxLicenseOffline             = @{
        Describe                 = "Get-SpdxLicense (offline)"
        ByName                   = "Récupération des licences « BSD* » par nom."
        ById                     = "Récupération des licences « BSD* » par ID."
        ByReferenceNumber        = "Récupération de la licence « BSD Zero Clause License » par numéro de réference (315)."
        ByReferenceNumberExclude = "Récupération de la licence « Affero General Public License v1.0 » par ID (AGPL-1.0) avec l'option ExcludeDeprecated."
        Osi                      = "Récupération de la licence « Affero General Public License v1.0 » par ID (AGPL-1.0) avec l'option OsiApproved."
        Fsf                      = "Récupération de la licence « Affero General Public License v1.0 » par ID (AGPL-1.0) avec l'option FsfLibre."
        OsiFsfExclude            = "Récupération des licences approuvées OSI, approuvéees FSF Libre et non dépréciées."
    }

    GetSpdxLicenseExceptionOffline    = @{
        Describe                 = "Get-SpdxLicenseException (offline)"
        ByName                   = "Récupération des exceptions de licence « *GPL* » par nom."
        ById                     = "Récupération des exceptions de licence « *GPL* » par ID."
        ByReferenceNumber        = "Récupération de l'exceptions de licence « Nokia-Qt-exception-1.1 » par numéro de réference (22)."
        ByReferenceNumberExclude = "Récupération de l'exceptions de licence « Nokia-Qt-exception-1.1 » par numéro de réference (3) avec l'option ExcludeDeprecated."
        Exclude                  = "Récupération des exceptions de licence non dépréciées."
    }

    GetSpdxLicenseOnline              = @{
        Describe = "Get-SpdxLicense (online)"
        Text     = "Récupération de la licence « BSD Zero Clause License » par ID (0BSD) avec son textE."
    }

    GetSpdxLicenseExceptionOnline     = @{
        Describe = "Get-SpdxLicenseException (online)"
        Text     = "Récupération de l'exceptions de licence « Nokia Qt LGPL exception 1.1 » par ID (Nokia-Qt-exception-1.1) avec son texte."
    }
    
    GetSpdxLicenseText                = @{
        Describe = "Get-SpdxLicenseText"
        Text     = "Récupération du texte de la licence « BSD Zero Clause License »."
    }
    
    GetSpdxLicenseExceptionText       = @{
        Describe = "Get-SpdxLicenseExceptionText"
        Text     = "Récupération du texte de l'exceptions de licence « Nokia Qt LGPL exception 1.1 »."
    }

    UpdateSpdxLicenseOnline           = @{
        Describe = "Update-SpdxLicense (online)"
        Update   = "Simulation de la mise à jour du fichier de licences."
    }
    
    UpdateSpdxLicenseExceptionOnline  = @{
        Describe = "Update-SpdxLicenseException (online)"
        Update   = "Simulation de la mise à jour du fichier d'exceptions de licence."
    }
    
    UpdateSpdxLicenseOffline          = @{
        Describe = "Update-SpdxLicense (offline)"
        Update   = "Simulation de la mise à jour du fichier de licences."
    }
    
    UpdateSpdxLicenseExceptionOffline = @{
        Describe = "Update-SpdxLicenseException (offline)"
        Update   = "Simulation de la mise à jour du fichier d'exceptions de licence."
    }

    TestSpdxLicenseExpression         = @{
        Describe      = "Test-SpdxLicenseExpression"
        Or            = "Test d'une expression avec « OR » (approuvées OSI)."
        And           = "Test d'une expression avec « AND » (approuvées FSF Libre)."
        And2          = "Test d'une expression avec 2 « ANDs » (approuvées FSF et OSI)."
        AndDeprecated = "Test d'une expression avec « AND » (avec l'option ExcludeDeprecated)."
        WithPlus      = "Test d'une expression avec « WITH' et « + »."
    }
}