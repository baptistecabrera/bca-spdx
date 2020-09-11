function Get-SpdxSourceUrl
{
    <#
        .SYNOPSIS
            Gets SPDX license and exception source URL.
        .DESCRIPTION
            Gets SPDX license and exception source URL.
        .INPUTS
        .OUTPUTS
            System.Uri
            This cmdlet returns a URI.
        .EXAMPLE
            Get-SpdxSourceUrl

            Description
            -----------
            This example will return the URI.
        .NOTES
        .LINK
            https://spdx.org/
    #>
    [CmdLetBinding()]
    param()

    try 
    {
        $script:FileSourceUrl
    }
    catch
    {
        Write-Error $_
    }
}