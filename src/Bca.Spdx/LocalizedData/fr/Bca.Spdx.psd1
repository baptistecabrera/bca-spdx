@{
    ImportModule                = @{
        Error = @{
            ImportError = @{
                Message = "Impossible d'importer la fonction « {0} » : {1}"
                Target  = "Fonction"
            }
        }
    }
    
    GetSpdxLicense              = @{
        Verbose = @{
            GetFile           = "Récupération des licences à partir du fichier « {0} »."
            Version           = "La version est « {0} »."
            OsiApproved       = "Approuvée par OSI seulement`t`t`t`t`t`t:`t`t{0}"
            FsfLibre          = "Approuvée FSF Libre seulement`t`t`t`t:`t`t{0}"
            ExcludeDeprecated = "Exclure les licences dépréciées`t`t:`t`t{0}"
        }
    }
    
    GetSpdxLicenseException     = @{
        Verbose = @{
            GetFile           = "Récupération des exceptions de license à partir du fichier « {0} »."
            Version           = "La version est « {0} »."
            ExcludeDeprecated = "Exclure les exceptions dépréciées : {0}"
        }
    }

    GetSpdxLicenseFile          = @{
        Error = @{
            Message = "Impossible de trouver le fichier de licence « {0} » car il n'existe pas."
            Target  = "Fichier de licence"
        }
    }

    GetSpdxLicenseExceptionFile = @{
        Error = @{
            Message = "Impossible de trouver le fichier d'exception de licence « {0} » car il n'existe pas."
            Target  = "Fichier d'exception de licence"
        }
    }

    GetSpdxLicenseText          = @{
        Verbose = @{
            GetLicense = "Récupération du texte de la licence « {0} » ({1})."
        }
    }

    GetSpdxLicenseExceptionText = @{
        Verbose = @{
            GetException = "Récupération du texte de l'exception la licence « {0} » ({1})."
        }
    }

    TestSpdxLicenseExpression   = @{
        Verbose = @{
            Parsing   = "Analyse de l'expression « {0} »."
            Member    = "Analyse du terme #{0}: « {1} »."
            Operator  = "Le terme « {0} » est un opérateur composite."
            License   = "Le terme « {0} » est un ID de licence valide ({1})."
            Exception = "Le terme « {0} » est un ID d'exception de licence valide ({1})."
        }

        Error   = @{
            DoubleWhiteSpace  = @{
                Message = "Une expression ne peut pas contenir de double espaces."
                Target  = "Expression"
            }
            Parenthesis       = @{
                Message = "L'expression contient {0} parenthèse(s) ouvrante(s) et {1} fermante(s)."
                Target  = "Expression"
            }
            NotALicense      = @{
                MessageOperator = "Les termes précédant et succédant un opérateur doivent être des IDs de licence valides."
                MessageSuffix   = "Les termes précédant un opérateur unaire doivent être des IDs de licence valides."
                Target          = "ID de licence"
            }
            NotAnException   = @{
                Message = "Les termes suivant l'opérateur 'WITH' doivent être des IDs d'exception de licence valides."
                Target  = "ID d'exception de licence"
            }
            UnidentifiedTerm = @{
                Message = "Le terme « {0} » n'a pas pu être identifié."
                Target  = "Terme"
            }
            LicenseCriteria   = @{
                Message = "La licence « {0} » ne correspond pas aux critères spécifiés."
                Target  = "Licence"
            }
            ExceptionCriteria = @{
                Message = "L'exception de licence « {0} » ne correspond pas aux critères spécifiés."
                Target  = "Exception de licence"
            }
        }
    }

    UpdateSpdxLicense           = @{
        Verbose = @{
            LicenseFile    = "Le fichier de licences est « {0} »."
            CurrentVersion = "La version courrante est « {0} »."
            GetContent     = "Récupération du contenu du fichier « {0} »."
            NewVersion     = "La nouvelle version sera « {0} »."
            Updated        = "Fichier de licences « {0} » mis à jour."
        }
    }

    UpdateSpdxLicenseException  = @{
        Verbose = @{
            LicenseFile    = "Le fichier d'exceptions de licences est « {0} »."
            CurrentVersion = "La version courrante est « {0} »."
            GetContent     = "Récupération du contenu du fichier « {0} »."
            NewVersion     = "La nouvelle version sera « {0} »."
            Updated        = "Fichier d'exceptions de licences « {0} » mis à jour."
        }
    }
}