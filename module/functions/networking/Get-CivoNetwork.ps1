function Get-CivoNetwork {
    <#
    .SYNOPSIS
    Lists private networks.
    .DESCRIPTION
    TODO
    .INPUTS
    None
    .OUTPUTS
    Object with information about the private networks.
    .EXAMPLE
    Get-CivoNetwork
    .LINK
    https://github.com/roberthstrand/civoShell
    #>
        
    $CallSplat = @{
        Uri     = "networks"
        Method  = 'GET'
    }
    
    $call = Invoke-CivoApi @CallSplat

    $call | ForEach-Object {
        [PSCustomObject]@{
            Id      = $_.id
            Name    = $_.name
            Region  = $_.region
            default = $_.default
            cidr    = $_.cidr
            label   = $_.label
        }
    }
}