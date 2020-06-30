function Test-SpdxLicenseExpression
{
    <#
        .SYNOPSIS
            Tests an SPDX License expression.
        .DESCRIPTION
            Tests an SPDX License expression.
        .PARAMETER Expression
            A string array containing the license expression to test.
        .PARAMETER OsiApproved
            A switch specifying to test that the expression only contains Open Source Initiative approved licenses.
        .PARAMETER FsfLibre
            A switch specifying to test that the expression only contains Free Software Foundation Free/Libre licenses.
        .PARAMETER FsfOrOsi
            A switch specifying to test that the expression only contains Free Software Foundation Free/Libre OR Open Source Initiative approved licenses.
        .PARAMETER FsfAndOsi
            A switch specifying to test that the expression only contains Free Software Foundation Free/Libre AND Open Source Initiative approved licenses (equivalent to specify FsfLibre and OsiApproved).
        .PARAMETER ExcludeDeprecated
            A switch specifying to test that the expression only contains not deprecated licenses and exceptions.
        .INPUTS
            System.String
            This CmdLet accepts a String containing the expression to test.
        .OUTPUTS
            System.Boolean
            This cmdlet returns a Boolean confirming if the expression is valid or not.
        .NOTES
        .LINK
            Get-SpdxLicense
        .LINK
            Get-SpdxLicenseException
        .LINK
            https://spdx.org/licenses/
        .LINK
            https://spdx.org/spdx-specification-21-web-version#h.jxpfx0ykyb60
        .LINK
            https://opensource.org/licenses/
        .LINK
            https://www.fsf.org/licensing/
    #>
    [CmdLetBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [Alias("e")]
        [string] $Expression,
        [Parameter(Mandatory = $false)]
        [Alias("Osi")]
        [switch] $OsiApproved,
        [Parameter(Mandatory = $false)]
        [Alias("FsfFree", "Fsf")]
        [switch] $FsfLibre,
        [Parameter(Mandatory = $false)]
        [switch] $FsfOrOsi,
        [Parameter(Mandatory = $false)]
        [switch] $FsfAndOsi,
        [Parameter(Mandatory = $false)]
        [Alias("xd")]
        [switch] $ExcludeDeprecated
    )

    try 
    {
        $Return = $true
        if ($Expression.Contains("  "))
        {
            $Return = $false
            Write-Error -Message $global:LocalizedData.TestSpdxLicenseExpression.Error.DoubleWhiteSpace.Message -Category SyntaxError -CategoryActivity $MyInvocation.MyCommand -TargetName $Expression -TargetType $global:LocalizedData.TestSpdxLicenseExpression.Error.DoubleWhiteSpace.Target -Exception SyntaxErrorException
        }
        else
        {
            $OpenParenthesis = ($Expression.ToCharArray() | Where-Object { $_ -eq '(' }).Count
            $CloseParenthesis = ($Expression.ToCharArray() | Where-Object { $_ -eq ')' }).Count
            if ($OpenParenthesis -ne $CloseParenthesis)
            {
                $Return = $false
                Write-Error -Message ($global:LocalizedData.TestSpdxLicenseExpression.Error.Parenthesis.Message -f $OpenParenthesis, $CloseParenthesis) -Category SyntaxError -CategoryActivity $MyInvocation.MyCommand -TargetName $Expression -TargetType $global:LocalizedData.TestSpdxLicenseExpression.Error.Parenthesis.Target -Exception SyntaxErrorException
            }
            else
            {
                $Licenses = Get-SpdxLicense
                $Exceptions = Get-SpdxLicenseException
                Write-Verbose ($global:LocalizedData.TestSpdxLicenseExpression.Verbose.Parsing -f $Expression)
                $Terms = $Expression.Replace("(", "").Replace(")", "") -split " "

                $RecognizedLicenses = @()
                $RecognizedExceptions = @()
                for ($i = 0; $Terms[$i]; $i++)
                {
                    Write-Verbose ($global:LocalizedData.TestSpdxLicenseExpression.Verbose.Member -f $i, $Terms[$i])
                    if ($Terms[$i] -in "AND", "OR")
                    {
                        Write-Verbose ($global:LocalizedData.TestSpdxLicenseExpression.Verbose.Operator -f $Terms[$i].ToUpper())
                        $Preceding = $Terms[$i - 1].Replace("+", "")
                        $Following = $Terms[$i + 1].Replace("+", "")
                        if (($Preceding -notin $Licenses.licenseId) -or ($Following -notin $Licenses.licenseId))
                        {
                            $Return = $false
                            Write-Error -Message $global:LocalizedData.TestSpdxLicenseExpression.Error.NotALicense.MessageOperator -Category SyntaxError -CategoryActivity $MyInvocation.MyCommand -TargetName "$($Preceding) - $($Following)" -TargetType $global:LocalizedData.TestSpdxLicenseExpression.Error.NotALicense.Target -Exception SyntaxErrorException
                        }
                    }
                    elseif ($Terms[$i] -eq "WITH")
                    {
                        Write-Verbose ($global:LocalizedData.TestSpdxLicenseExpression.Verbose.Operator -f $Terms[$i].ToUpper())
                        if ($Terms[$i + 1] -notin $Exceptions.licenseExceptionId)
                        {
                            $Return = $false
                            Write-Error -Message $global:LocalizedData.TestSpdxLicenseExpression.Error.NotAnException.Message -Category SyntaxError -CategoryActivity $MyInvocation.MyCommand -TargetName "$($Terms[$i + 1])" -TargetType $global:LocalizedData.TestSpdxLicenseExpression.Error.NotAnException.Target -Exception SyntaxErrorException
                        }
                    }
                    elseif ($Terms[$i] -like "*+")
                    {
                        $License = $Terms[$i].Replace("+", "")
                        if ($License -in $Licenses.licenseId)
                        {
                            Write-Verbose ($global:LocalizedData.TestSpdxLicenseExpression.Verbose.License -f $License, ($Licenses | Where-Object { $_.licenseId -eq $License }).name)
                            $RecognizedLicenses += $License
                        }
                        else
                        {
                            $Return = $false
                            Write-Error -Message $global:LocalizedData.TestSpdxLicenseExpression.Error.NotALicense.MessageSuffix -Category SyntaxError -CategoryActivity $MyInvocation.MyCommand -TargetName $License -TargetType $global:LocalizedData.TestSpdxLicenseExpression.Error.NotALicense.Target -Exception SyntaxErrorException
                        }
                    }
                    elseif ($Terms[$i] -in $Licenses.licenseId)
                    {
                        Write-Verbose ($global:LocalizedData.TestSpdxLicenseExpression.Verbose.License -f $Terms[$i], ($Licenses | Where-Object { $_.licenseId -eq $Terms[$i] }).name)
                        $RecognizedLicenses += $Terms[$i]
                    }
                    elseif ($Terms[$i] -in $Exceptions.licenseExceptionId)
                    {
                        Write-Verbose ($global:LocalizedData.TestSpdxLicenseExpression.Verbose.Exception -f $Terms[$i], ($Exceptions | Where-Object { $_.licenseExceptionId -eq $Terms[$i] }).name)
                        $RecognizedExceptions += $Terms[$i]
                    }
                    else
                    {
                        $Return = $false
                        Write-Error -Message ($global:LocalizedData.TestSpdxLicenseExpression.Error.UnidentifiedTerm.Message -f $Terms[$i]) -Category SyntaxError -CategoryActivity $MyInvocation.MyCommand -TargetName $Terms[$i] -TargetType $global:LocalizedData.TestSpdxLicenseExpression.Error.UnidentifiedTerm.Target -Exception SyntaxErrorException
                    }
                }

                if ($RecognizedLicenses)
                {
                    if (($FsfLibre -and $OsiApproved) -or $FsfAndOsi) { $TargetLicences = Get-SpdxLicense -OsiApproved -FsfLibre -ExcludeDeprecated:$ExcludeDeprecated }
                    elseif ($FsfOrOsi) { $TargetLicences = (Get-SpdxLicense -OsiApproved -ExcludeDeprecated:$ExcludeDeprecated) + (Get-SpdxLicense -FsfLibre -ExcludeDeprecated:$ExcludeDeprecated) }
                    else { $TargetLicences = Get-SpdxLicense -OsiApproved:$OsiApproved -FsfLibre:$FsfLibre -ExcludeDeprecated:$ExcludeDeprecated }

                    $RecognizedLicenses | ForEach-Object {
                        if ($_ -notin $TargetLicences.licenseId)
                        {
                            $Return = $false
                            Write-Error -Message ($global:LocalizedData.TestSpdxLicenseExpression.Error.LicenseCriteria.Message -f $_) -Category InvalidData -CategoryActivity $MyInvocation.MyCommand -TargetName $_ -TargetType $global:LocalizedData.TestSpdxLicenseExpression.Error.LicenseCriteria.Target -Exception InvalidDataException
                        }
                    }
                }
                if ($RecognizedExceptions)
                {
                    $TargetExceptions = Get-SpdxLicenseException -ExcludeDeprecated:$ExcludeDeprecated

                    $RecognizedExceptions | ForEach-Object {
                        if ($_ -notin $TargetExceptions.licenseExceptionId)
                        {
                            $Return = $false
                            Write-Error -Message ($global:LocalizedData.TestSpdxLicenseExpression.Error.ExceptionCriteria.Message -f $_) -Category InvalidData -CategoryActivity $MyInvocation.MyCommand -TargetName $_ -TargetType $global:LocalizedData.TestSpdxLicenseExpression.Error.ExceptionCriteria.Target -Exception InvalidDataException
                        }
                    }          
                }
            }
        }
    }
    catch
    {
        $Return = $false
        Write-Error $_
    }
    finally
    {
        $Return
    }
}