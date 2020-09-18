# Get-SpdxLicenseException
Type: Function

Module: [Bca.Spdx](../ReadMe.md)

Gets SPDX License exceptions.
## Description
Gets SPDX License exceptions.
## Syntax
### FromId (default)
```powershell
Get-SpdxLicenseException [-Id <string[]>] [-ExcludeDeprecated] [-ExceptionText] [<CommonParameters>]
```
### FromName
```powershell
Get-SpdxLicenseException [-Name <string[]>] [-ExcludeDeprecated] [-ExceptionText] [<CommonParameters>]
```
### FromReferenceNumber
```powershell
Get-SpdxLicenseException -ReferenceNumber <int[]> [-ExcludeDeprecated] [-ExceptionText] [<CommonParameters>]
```
## Examples
### Example 1
```powershell
Get-SpdxLicenseException -Id "Libtool-exception"
```
This example will return information of the license exception "Libtool-exception" (Libtool Exception).
### Example 2
```powershell
Get-SpdxLicenseException -Id "*GPL*"
```
This example will return information of the license exceptions(s) where the ID matches "*GPL*".
### Example 3
```powershell
Get-SpdxLicenseException -Name "Linux Syscall Note"
```
This example will return information of the license exception named "Linux Syscall Note".
### Example 4
```powershell
Get-SpdxLicenseException -Name "Autoconf exception*"
```
This example will return information of the license exception(s) where the name matched "Autoconf exception*".
### Example 5
```powershell
Get-SpdxLicenseException -ExcludeDeprecated -ExceptionText
```
This example will return information of the license exception(s) that are not deprecated, and retrieve their text(s).
## Parameters
### `-Id`
A string array containing the ID(s) of the license exceptions(s) to get.

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
A string array containing the name(s) of the license exceptions(s) to get.

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
An integer array containing the reference number(s) of the license exceptions(s) to get.

| | |
|:-|:-|
|Type:|Int32[]|
|Aliases|r, ref|
|Parameter sets:|FromReferenceNumber|
|Position:|Named|
|Required:|True|
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

### `-ExceptionText`
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
This CmdLet does not require an Internet connection, except when using switch ExceptionText.
It is strongly advised to use Update-SpdxLicenseExceptions (without parameters) to update the offline file from https://spdx.org/licenses/.
## Related Links
- [Get-SpdxLicenseExceptionText](Get-SpdxLicenseExceptionText.md)
- [https://spdx.org/licenses/](https://spdx.org/licenses/)
- [https://spdx.org/licenses/exceptions-index.html](https://spdx.org/licenses/exceptions-index.html)
