@{

    # Script module or binary module file associated with this manifest.
    RootModule    = 'Bca.Spdx'

    # Version number of this module.
    ModuleVersion = '0.0.7'

    # Supported PSEditions
    # CompatiblePSEditions = @()

    # ID used to uniquely identify this module
    GUID          = '5675dd2a-66cd-42bf-bf76-15d0c38115c6'

    # Author of this module
    Author        = 'Baptiste Cabrera'

    # Company or vendor of this module
    CompanyName   = 'Bca'

    # Copyright statement for this module
    Copyright     = '(c) 2020 Bca. All rights reserved.'

    # Description of the functionality provided by this module
    Description   = 'PowerShell module to interract with SPDX licences information.'

    # Minimum version of the Windows PowerShell engine required by this module
    # PowerShellVersion = ''

    # Name of the Windows PowerShell host required by this module
    # PowerShellHostName = ''

    # Minimum version of the Windows PowerShell host required by this module
    # PowerShellHostVersion = ''

    # Minimum version of Microsoft .NET Framework required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
    # DotNetFrameworkVersion = ''

    # Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
    # CLRVersion = ''

    # Processor architecture (None, X86, Amd64) required by this module
    # ProcessorArchitecture = ''

    # Modules that must be imported into the global environment prior to importing this module
    # RequiredModules = @()

    # Assemblies that must be loaded prior to importing this module
    # RequiredAssemblies = @()

    # Script files (.ps1) that are run in the caller's environment prior to importing this module.
    # ScriptsToProcess = @()

    # Type files (.ps1xml) to be loaded when importing this module
    # TypesToProcess = @()

    # Format files (.ps1xml) to be loaded when importing this module
    # FormatsToProcess = @()

    # Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
    # NestedModules = @()

    # Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
    # FunctionsToExport = @()

    # Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
    # CmdletsToExport = @()

    # Variables to export from this module
    # VariablesToExport = '*'

    # Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
    # AliasesToExport = @()

    # DSC resources to export from this module
    # DscResourcesToExport = @()

    # List of all modules packaged with this module
    # ModuleList = @()

    # List of all files packaged with this module
    # FileList = @()

    # Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
    PrivateData   = @{

        PSData = @{

            # Tags applied to this module. These help with module discovery in online galleries.
            Tags         = @('PowerShell', 'SPDX', 'SoftwarePackageDataExchange', 'Licence', 'Exception', 'FSF', 'OSI', 'FreeSoftwareFoundation', 'OpenSourceInitiative')

            # A URL to the license for this module.
            # LicenseUri = ''

            # A URL to the main website for this project.
            ProjectUri   = 'https://github.com/bapcabrera/bca-spdx'

            # A URL to an icon representing this module.
            IconUri      = ''

            # ReleaseNotes of this module
            ReleaseNotes = '0.0.6:
- Update-SpdxLicense*: Added variabilization of the source URL.

0.0.5: 
- Test-SpdxLicenseExpression: New function to test license expression to be used in packaging. 
- Enhanced language support. 
 
0.0.3: 
- Update-SpdxLicense: Added Timeout parameter to control the web request timeout. 
- Added update of licenses and exceptions when importing the module. 
- Added French support. 
 
0.0.2: 
- Added License Exceptions support. 
 
0.0.1: 
- First release.'

            # Prerelease of this module
            Prerelease   = ''
        } # End of PSData hashtable

    } # End of PrivateData hashtable

    # HelpInfo URI of this module
    # HelpInfoURI = ''

    # Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
    # DefaultCommandPrefix = ''

}

