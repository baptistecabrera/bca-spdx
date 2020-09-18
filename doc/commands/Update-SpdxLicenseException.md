# Update-SpdxLicenseException
Type: Function

Module: [Bca.Spdx](../ReadMe.md)

Updates SPDX License exceptions list.
## Description
Updates SPDX License exceptions list.
## Syntax
### FromUri (default)
```powershell
Update-SpdxLicenseException [-Uri <uri>] [-Timeout <int>] [-Force] [-WhatIf] [-Confirm] [<CommonParameters>]
```
### FromPath
```powershell
Update-SpdxLicenseException -Path <string> [-Force] [-WhatIf] [-Confirm] [<CommonParameters>]
```
## Examples
### Example 1
```powershell
Update-SpdxLicenseException -Path ".\exceptions.json"
```
This example will update the list from the file ".\exceptions.json".
### Example 2
```powershell
Get-SpdxLicense -Uri "https://raw.githubusercontent.com/spdx/license-list-data/master/json/exceptions.json" -Force
```
This example will update the list from the URI "https://raw.githubusercontent.com/spdx/license-list-data/master/json/exceptions.json".
## Parameters
### `-Uri`
A URI containing the URI of the content to update list from.

| | |
|:-|:-|
|Type:|Uri|
|Aliases|u|
|Default value:|"$((Get-SpdxSourceUrl).AbsoluteUri)exceptions.json"|
|Parameter sets:|FromUri|
|Position:|Named|
|Required:|False|
|Accepts pipepline input:|False|

### `-Timeout`
An integer containing the timeout in seconds for the web request.

| | |
|:-|:-|
|Type:|Int32|
|Aliases|t|
|Default value:|0|
|Parameter sets:|FromUri|
|Position:|Named|
|Required:|False|
|Accepts pipepline input:|False|

### `-Path`
A string containing the path of the file to update list from.

| | |
|:-|:-|
|Type:|String|
|Aliases|p|
|Parameter sets:|FromPath|
|Position:|Named|
|Required:|True|
|Accepts pipepline input:|False|
|Validation (ScriptBlock):|` Test-Path $_ `|

### `-Force`
A switch pecifying whether or not to force the update (overrides WhatIf if specified).

| | |
|:-|:-|
|Type:|SwitchParameter|
|Aliases|f|
|Default value:|False|
|Parameter sets:|FromPath, FromUri|
|Position:|Named|
|Required:|False|
|Accepts pipepline input:|False|

## Inputs
****


## Outputs
****


## Related Links
- [Get-SpdxLicenseException](Get-SpdxLicenseException.md)
- [https://spdx.org/licenses/](https://spdx.org/licenses/)
- [https://spdx.org/licenses/exceptions-index.html](https://spdx.org/licenses/exceptions-index.html)
