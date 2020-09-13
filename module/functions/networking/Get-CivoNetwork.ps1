function Get-CivoNetwork {
    <#
    .SYNOPSIS
    Lists private networks.
    .DESCRIPTION
    Lists all private networks, as well as filtered by ID and label.
    .INPUTS
    None, ID or Label.
    .OUTPUTS
    Object with information about the private networks.
    .EXAMPLE
    Get-CivoNetwork
    .EXAMPLE
    Get-CivoNetwork -Id 1e644b7c-80e5-412b-a26b-a1e0e6215ced
    .EXAMPLE
    $Networks =(
    "1e644b7c-80e5-412b-a26b-a1e0e6215ced",
    "393197c5-f409-499d-8958-601e33922c08"
    )

    Get-CivoNetwork -Id $Networks
    .EXAMPLE
    Get-CivoNetwork -Label "prod-*"
    .EXAMPLE
    $Networks =(
    "prod-client01",
    "prod-client02"
    )

    Get-CivoNetwork -Label $Networks
    .LINK
    https://github.com/roberthstrand/civoShell
    #>
    [CmdletBinding()]
    param (
        [Parameter(Position = 0)]
        [string[]]
        $Id,
        [Parameter(Position = 1)]
        [string[]]
        $Label
    )
    $CallSplat = @{
        Uri    = "networks"
        Method = 'GET'
    }

    $call = Invoke-CivoApi @CallSplat

    if ($Id) {
        $call | ForEach-Object {
            if (($_.id -in $Id) -or ($_.id -like $Id)) {
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
    }
    elseif ($Label) {
        $call | ForEach-Object {
            if (($_.label -in $Label) -or ($_.label -like $Label)) {
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
    }
    else {
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
}