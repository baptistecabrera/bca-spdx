# Get-SpdxLicenseText
Type: Function

Module: [Bca.Spdx](../ReadMe.md)

Gets an SPDX License text.
## Description
Gets an SPDX License text from https://spdx.org.
## Syntax
### FromId (default)
```powershell
Get-SpdxLicenseText -Id <string> [<CommonParameters>]
```
### FromName
```powershell
Get-SpdxLicenseText -Name <string> [<CommonParameters>]
```
### FromReferenceNumber
```powershell
Get-SpdxLicenseText -ReferenceNumber <int> [<CommonParameters>]
```
## Examples
### Example 1
```powershell
Get-SpdxLicenseText -Id "AFL-3.0"
```
This example will return the text of the license "AFL-3.0" (Academic Free License v3.0).
### Example 2
```powershell
Get-SpdxLicenseText -Name "BSD Zero Clause License"
```
This example will return the text of the license named "BSD Zero Clause License".
## Parameters
### `-Id`
A string containing the ID of the license.

| | |
|:-|:-|
|Type:|String|
|Aliases|i|
|Parameter sets:|FromId|
|Position:|Named|
|Required:|True|
|Accepts pipepline input:|False|

### `-Name`
A string containing the name of the license.

| | |
|:-|:-|
|Type:|String|
|Aliases|n|
|Parameter sets:|FromName|
|Position:|Named|
|Required:|True|
|Accepts pipepline input:|False|

### `-ReferenceNumber`
An integer containing the reference number of the license.

| | |
|:-|:-|
|Type:|Int32|
|Aliases|r, ref|
|Default value:|0|
|Parameter sets:|FromReferenceNumber|
|Position:|Named|
|Required:|True|
|Accepts pipepline input:|False|

## Inputs
****


## Outputs
**System.String**

This cmdlet returns a string containing the text of the license.
## Notes
This CmdLet requires an Internet connection.
## Related Links
- [Get-SpdxLicense](Get-SpdxLicense.md)
- [https://spdx.org/licenses/](https://spdx.org/licenses/)
