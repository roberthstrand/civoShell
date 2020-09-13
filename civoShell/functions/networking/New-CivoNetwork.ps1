function New-CivoNetwork {
    <#
    .SYNOPSIS
    Create a new private network.
    .DESCRIPTION
    Creates a new private network, using label as name.
    .PARAMETER Label
    Label to be used with the new private network.
    .INPUTS
    The label parameter, which is mandatory.
    .OUTPUTS
    Object with information about the private network.
    .EXAMPLE
    New-CivoNetwork -Label 'Network02'
    .LINK
    https://roberthstrand.github.io/civoShell/New-CivoNetwork.md
    #>
    [CmdletBinding()]
    param (
        [Parameter(Position = 0, Mandatory = $true)]
        [string]
        $Label
    )
    $Form     = @{
        label = $Label
    }

    $CallSplat  = @{
        Uri     = "networks"
        Method  = 'POST'
        Form    = $Form
    }
    $call = Invoke-CivoApi @CallSplat

    
    [PSCustomObject]@{
        Result  = $call.result
        Id      = $call.id
        label   = $call.label
    }
}