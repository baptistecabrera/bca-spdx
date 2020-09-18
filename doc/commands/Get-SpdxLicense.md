# Get-SpdxLicense
Type: Function

Module: [Bca.Spdx](../ReadMe.md)

Gets SPDX License(s).
## Description
Gets SPDX License(s).
## Syntax
### FromId (default)
```powershell
Get-SpdxLicense [-Id <string[]>] [-OsiApproved] [-FsfLibre] [-ExcludeDeprecated] [-LicenseText] [<CommonParameters>]
```
### FromName
```powershell
Get-SpdxLicense [-Name <string[]>] [-OsiApproved] [-FsfLibre] [-ExcludeDeprecated] [-LicenseText] [<CommonParameters>]
```
### FromReferenceNumber
```powershell
Get-SpdxLicense -ReferenceNumber <int[]> [-OsiApproved] [-FsfLibre] [-ExcludeDeprecated] [-LicenseText] [<CommonParameters>]
```
## Examples
### Example 1
```powershell
Get-SpdxLicense -Id "AFL-3.0"
```
This example will return information of the license "AFL-3.0" (Academic Free License v3.0).
### Example 2
```powershell
Get-SpdxLicense -Id "AFL-3.*"
```
This example will return information of the license(s) where the ID matches "AFL-3.*".
### Example 3
```powershell
Get-SpdxLicense -Name "BSD Zero Clause License"
```
This example will return information of the license named "BSD Zero Clause License".
### Example 4
```powershell
Get-SpdxLicense -Name "BSD*"
```
This example will return information of the license(s) where the name matched "BSD*".
### Example 5
```powershell
Get-SpdxLicense -FsfLibre
```
This example will return information of the license(s) that are FSF Libre/Free.
### Example 6
```powershell
Get-SpdxLicense -OsiApproved
```
This example will return information of the license(s) that are OSI approved.
### Example 7
```powershell
Get-SpdxLicense -FsfLibre -OsiApproved -ExcludeDeprecated -LicenseText
```
This example will return information of the license(s) that are FSF Libre/Free AND OSI approved AND not deprecated, and retrieve their text(s).
## Parameters
### `-Id`
A string array containing the ID(s) of the license(s) to get.

| | |
|:-|:-|
|Type:|String[]|
|Aliases|i|
|Default value:|*|
|Parameter sets:|FromId|
|Position:|Named|
|Required:|False|
|Accepts pipepline input:|False|

### `-Name`
A string array containing the name(s) of the license(s) to get.

| | |
|:-|:-|
|Type:|String[]|
|Aliases|n|
|Default value:|*|
|Parameter sets:|FromName|
|Position:|Named|
|Required:|False|
|Accepts pipepline input:|False|

### `-ReferenceNumber`
An integer array containing the reference number(s) of the license(s) to get.

| | |
|:-|:-|
|Type:|Int32[]|
|Aliases|r, ref|
|Parameter sets:|FromReferenceNumber|
|Position:|Named|
|Required:|True|
|Accepts pipepline input:|False|

### `-OsiApproved`
A switch specifying to only get Open Source Initiative approved licenses.

| | |
|:-|:-|
|Type:|SwitchParameter|
|Aliases|Osi|
|Default value:|False|
|Parameter sets:|FromId, FromName, FromReferenceNumber|
|Position:|Named|
|Required:|False|
|Accepts pipepline input:|False|

### `-FsfLibre`
A switch specifying to only get Free Software Foundation Free/Libre licenses.

| | |
|:-|:-|
|Type:|SwitchParameter|
|Aliases|FsfFree, Fsf|
|Default value:|False|
|Parameter sets:|FromId, FromName, FromReferenceNumber|
|Position:|Named|
|Required:|False|
|Accepts pipepline input:|False|

### `-ExcludeDeprecated`
A switch specifying to exclude deprecated licenses.

| | |
|:-|:-|
|Type:|SwitchParameter|
|Aliases|xd|
|Default value:|False|
|Parameter sets:|FromId, FromName, FromReferenceNumber|
|Position:|Named|
|Required:|False|
|Accepts pipepline input:|False|

### `-LicenseText`
A switch specifying to retrieve license text.
This option requires an Internet connection.

| | |
|:-|:-|
|Type:|SwitchParameter|
|Aliases|t|
|Default value:|False|
|Parameter sets:|FromId, FromName, FromReferenceNumber|
|Position:|Named|
|Required:|False|
|Accepts pipepline input:|False|

## Inputs
****


## Outputs
**System.Management.Automation.PSCustomObject**

This cmdlet returns a PSCustomObject containing the details of the license(s).
## Notes
This CmdLet does not require an Internet connection, except when using switch LicenseText.
It is strongly advised to use Update-SpdxLicense (without parameters) to update the offline file from https://spdx.org/licenses/.
## Related Links
- [Get-SpdxLicenseText](Get-SpdxLicenseText.md)
- [https://spdx.org/licenses/](https://spdx.org/licenses/)
- [https://opensource.org/licenses/](https://opensource.org/licenses/)
- [https://www.fsf.org/licensing/](https://www.fsf.org/licensing/)
