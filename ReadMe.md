# Bca.Spdx

## Description

_Bca.Spdx_ is a PowerShell module used to interract with _Software Package Data Exchange_ (SPDX) licenses, exceptions and license expressions.

It uses [SPDX GitHub repo](https://github.com/spdx) to source info, and allows update from it.

It can be used to help you build your packages manifest before uploading it by testing your licence expressions.

## Disclaimer

- All information provided by _Bca.Spdx_ comes from the _Software Package Data Exchange_, I am not the owner of this information, nor am I affiliated with _SPDX_.
- _Bca.Spdx_ has been created to answer my needs to streamline my package automation, but I provide it to people who may need such a tool.
- It may contain bugs or lack some features, in this case, feel free to open an issue, and I'll manage it as best as I can.
- This _GitHub_ repository is not the primary one, see transparency for more information.

## How to install

### Package

_Bca.Spdx_ is available as a package from _[PowerShell Gallery](https://www.powershellgallery.com/)_, _[NuGet](https://www.nuget.org/)_ and _[Chocolatey](https://chocolatey.org/)_, please refer to each specific plateform on how to install the package.

### Manually

If you decide to install _Bca.Spdx_ manually, copy the content of `src` into one or all of the path(s) contained in the variable `PSModulePath` depending on the scope you need.

I'll advise you use a path with the version, that can be found in the module manifest `psd1` file (e.g. `C:\Program Files\WindowsPowerShell\Modules\Bca.Spdx\1.0.0`). In that case copy the content of `src/Bca.Spdx` in this path.

## Transparency

_Please not that to date I am the only developper for this module._

All code is stored on a private Git repository on Azure DevOps.

When a pull request is submitted, it runs an Azure DevOps build pipeline that tests the module with _[Pester](https://pester.dev/)_ tests and runs the _[PSScriptAnalyzer](https://github.com/PowerShell/PSScriptAnalyzer)_.

Once merged, the build pipeline is run again, but this time it will:
- Mirror the repository to _GitHub_;
- Create a Chocolatey and a NuGet packages that are pushed on private Azure DevOps Artifacts feeds.

If the build succeeds and the packages are well pushed, an Azure DevOps release pipeline is trigerred that will:
- In a **Prerelease** step, install both Chocolatey and Nuget packages from the private feed, and run tests again. If tests are successful, the packages are promoted to `@Prerelease` view inside the private feed;
- In a **Release** step, publish the packages to _[NuGet](https://www.nuget.org/)_ and _[Chocolatey](https://chocolatey.org/)_, and publish the module to _[PowerShell Gallery](https://www.powershellgallery.com/)_, then promote the packages to to `@PRelease` view inside the private feed.