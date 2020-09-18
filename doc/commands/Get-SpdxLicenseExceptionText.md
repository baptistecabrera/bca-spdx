# Get-SpdxLicenseExceptionText
Type: Function

Module: [Bca.Spdx](../ReadMe.md)

Gets an SPDX License exception text.
## Description
Gets an SPDX License exception text from https://spdx.org.
## Syntax
### FromId (default)
```powershell
Get-SpdxLicenseExceptionText -Id <string> [<CommonParameters>]
```
### FromName
```powershell
Get-SpdxLicenseExceptionText -Name <string> [<CommonParameters>]
```
### FromReferenceNumber
```powershell
Get-SpdxLicenseExceptionText -ReferenceNumber <int> [<CommonParameters>]
```
## Examples
### Example 1
```powershell
Get-SpdxLicenseExceptionText -Id "Libtool-exception"
```
This example will return the text of the license exception "Libtool-exception" (Libtool Exception).
### Example 2
```powershell
Get-SpdxLicenseExceptionText -Name "Linux Syscall Note"
```
This example will return the text of the license exception named "Linux Syscall Note".
## Parameters
### `-Id`
A string containing the ID of the license exception.

| | |
|:-|:-|
|Type:|String|
|Aliases|i|
|Parameter sets:|FromId|
|Position:|Named|
|Required:|True|
|Accepts pipepline input:|False|

### `-Name`
A string containing the name of the license exception.

| | |
|:-|:-|
|Type:|String|
|Aliases|n|
|Parameter sets:|FromName|
|Position:|Named|
|Required:|True|
|Accepts pipepline input:|False|

### `-ReferenceNumber`
An integer containing the reference number of the license exception.

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

This cmdlet returns a string containing the text of the license exception.
## Notes
This CmdLet requires an Internet connection.
## Related Links
- [Get-SpdxLicenseException](Get-SpdxLicenseException.md)
- [https://spdx.org/licenses/](https://spdx.org/licenses/)
- [https://spdx.org/licenses/exceptions-index.html](https://spdx.org/licenses/exceptions-index.html)
