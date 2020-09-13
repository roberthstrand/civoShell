function Get-CivoRegion {
    <#
    .SYNOPSIS
    Lists all regions.
    .DESCRIPTION
    Lists all available regions in the Civo cloud platform.
    .INPUTS
    None
    .OUTPUTS
    List of available regions.
    .EXAMPLE
    Get-CivoRegions
    .LINK
    https://roberthstrand.github.io/civoShell/Get-CivoRegion.md
    #>
    [CmdletBinding()]
    
    $CallSplat = @{
        Uri    = "regions"
        Method = 'GET'
    }

    $call = Invoke-CivoApi @CallSplat

    $call | ForEach-Object {
        [PSCustomObject]@{
            Name    = $_.name
            Code    = $_.code
            Default = $_.default
        }
    }
}