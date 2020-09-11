# Test-SpdxLicenseExpression
Type: Function
Module: [Bca.Spdx](../ReadMe.md)

Tests an SPDX License expression.
## Description
Tests an SPDX License expression.
## Syntax
```ps
Test-SpdxLicenseExpression [-Expression] <string> [-OsiApproved] [-FsfLibre] [-FsfOrOsi] [-FsfAndOsi] [-ExcludeDeprecated] [<CommonParameters>]
```
## Parameters
### `-Expression`
A string array containing the license expression to test.

| | |
|:-|:-|
|Type:|String|
|Aliases|e|
|Position:|0|
|Required:|True|
|Accepts pipepline input:|False|

### `-OsiApproved`
A switch specifying to test that the expression only contains Open Source Initiative approved licenses.

| | |
|:-|:-|
|Type:|SwitchParameter|
|Aliases|Osi|
|Default value:|False|
|Position:|Named|
|Required:|False|
|Accepts pipepline input:|False|

### `-FsfLibre`
A switch specifying to test that the expression only contains Free Software Foundation Free/Libre licenses.

| | |
|:-|:-|
|Type:|SwitchParameter|
|Aliases|FsfFree, Fsf|
|Default value:|False|
|Position:|Named|
|Required:|False|
|Accepts pipepline input:|False|

### `-FsfOrOsi`
A switch specifying to test that the expression only contains Free Software Foundation Free/Libre OR Open Source Initiative approved licenses.

| | |
|:-|:-|
|Type:|SwitchParameter|
|Default value:|False|
|Position:|Named|
|Required:|False|
|Accepts pipepline input:|False|

### `-FsfAndOsi`
A switch specifying to test that the expression only contains Free Software Foundation Free/Libre AND Open Source Initiative approved licenses (equivalent to specify FsfLibre and OsiApproved).

| | |
|:-|:-|
|Type:|SwitchParameter|
|Default value:|False|
|Position:|Named|
|Required:|False|
|Accepts pipepline input:|False|

### `-ExcludeDeprecated`
A switch specifying to test that the expression only contains not deprecated licenses and exceptions.

| | |
|:-|:-|
|Type:|SwitchParameter|
|Aliases|xd|
|Default value:|False|
|Position:|Named|
|Required:|False|
|Accepts pipepline input:|False|

## Inputs
**System.String**
This CmdLet accepts a String containing the expression to test.
## Outputs
**System.Boolean**
This cmdlet returns a Boolean confirming if the expression is valid or not.
## Related Links
- [Get-SpdxLicense](Get-SpdxLicense.md)
- [Get-SpdxLicenseException](Get-SpdxLicenseException.md)
- [https://spdx.org/licenses/](https://spdx.org/licenses/)
- [https://spdx.org/spdx-specification-21-web-version#h.jxpfx0ykyb60](https://spdx.org/spdx-specification-21-web-version#h.jxpfx0ykyb60)
- [https://opensource.org/licenses/](https://opensource.org/licenses/)
- [https://www.fsf.org/licensing/](https://www.fsf.org/licensing/)
