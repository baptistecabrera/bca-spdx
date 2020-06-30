@{
    ImportModule                = @{
        Error = @{
            ImportError = @{
                Message = "Failed to import function '{0}': {1}"
                Target  = "Function"
            }
        }
    }
    
    GetSpdxLicense              = @{
        Verbose = @{
            GetFile           = "Getting licenses from file '{0}'."
            Version           = "Version is '{0}'."
            OsiApproved       = "OSI approved only`t`t`t`t:`t`t{0}"
            FsfLibre          = "FSF Libre/Free only`t`t:`t`t{0}"
            ExcludeDeprecated = "Exclude deprecated`t`t`t:`t`t{0}"
        }
    }
    
    GetSpdxLicenseException     = @{
        Verbose = @{
            GetFile           = "Getting license exceptions from file '{0}'."
            Version           = "Version is '{0}'."
            ExcludeDeprecated = "Exclude deprecated: {0}"
        }
    }

    GetSpdxLicenseFile          = @{
        Error = @{
            Message = "Cannot find license file '{0}' because it does not exist."
            Target  = "License File"
        }
    }

    GetSpdxLicenseExceptionFile = @{
        Error = @{
            Message = "Cannot find license exception file '{0}' because it does not exist."
            Target  = "License Exeception File"
        }
    }

    GetSpdxLicenseText          = @{
        Verbose = @{
            GetLicense = "Getting license text for '{0}' ({1})."
        }
    }

    GetSpdxLicenseExceptionText = @{
        Verbose = @{
            GetException = "Getting license exception text for '{0}' ({1})."
        }
    }

    TestSpdxLicenseExpression   = @{
        Verbose = @{
            Parsing   = "Parsing expression '{0}'."
            Member    = "Parsing term #{0}: '{1}'."
            Operator  = "Term '{0}' is composite operator operator."
            License   = "Term '{0}' is a valid license ID ({1})."
            Exception = "Term '{0}' is a valid license exception ID ({1})."
        }

        Error   = @{
            DoubleWhiteSpace  = @{
                Message = "An expression cannot contain double whitespaces."
                Target  = "Expression"
            }
            Parenthesis       = @{
                Message = "Expression contains {0} opening parenthesis and {1} closing one(s)."
                Target  = "Expression"
            }
            NotALicense      = @{
                MessageOperator = "Terms preceding and following a disjunctive or conjunctive operator must be valid license IDs."
                MessageSuffix   = "Terms preceding an unary operator suffix must be a valid license id."
                Target          = "LicenseId"
            }
            NotAnException   = @{
                Message = "Terms following 'WITH' operator must be a valid license exception id."
                Target  = "LicenseExceptionId"
            }
            UnidentifiedTerm = @{
                Message = "Unidentified term '{0}'."
                Target  = "Term"
            }
            LicenseCriteria  = @{
                Message = "License '{0}' does not match the specified criteria."
                Target  = "License"
            }
            ExceptionCriteria  = @{
                Message = "License exception '{0}' does not match the specified criteria."
                Target  = "Exception"
            }
        }
    }

    UpdateSpdxLicense           = @{
        Verbose = @{
            LicenseFile    = "License file is '{0}'."
            CurrentVersion = "Current version is '{0}'."
            GetContent     = "Getting content from file '{0}'."
            NewVersion     = "New version will be '{0}'."
            Updated        = "Updated license file '{0}'."
        }
    }

    UpdateSpdxLicenseException  = @{
        Verbose = @{
            LicenseFile    = "License exception file is '{0}'."
            CurrentVersion = "Current version is '{0}'."
            GetContent     = "Getting content from file '{0}'."
            NewVersion     = "New version will be '{0}'."
            Updated        = "Updated license exception file '{0}'."
        }
    }
}