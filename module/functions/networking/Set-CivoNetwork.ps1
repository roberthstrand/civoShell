function Set-CivoNetwork {
    <#
    .SYNOPSIS
    Update a network.
    .DESCRIPTION
    Update a private network's label.
    .PARAMETER Id
    The ID of the private network that you want to update.
    .PARAMETER Label
    The label of the private network that you want to update.
    .INPUTS
    The ID of the network you want to update, as well as the new label.
    .OUTPUTS
    Object with information about the updated private networks.
    .EXAMPLE
    Set-CivoNetwork 1e644b7c-80e5-412b-a26b-a1e0e6215ced -Label test-client01
    .LINK
    https://roberthstrand.github.io/civoShell/Set-CivoNetwork.md
    #>
    [CmdletBinding()]
    param (
        [Parameter(Position = 0, Mandatory = $true, ValueFromPipeline = $true)]
        [string[]]
        $Id,
        [Parameter(Position = 1, Mandatory = $true)]
        [string[]]
        $Label
    )

    $oldLabel = Get-CivoNetwork -Id $Id | Select-Object -ExpandProperty 'Label'

    $Form     = @{
        label = $Label
    }
    $CallSplat = @{
        Uri    = "networks/$Id"
        Method = 'PUT'
        Form   = $Form
    }
    $call = Invoke-CivoApi @CallSplat

    if ($call.result -eq 'success') {
        Write-Host ("Changed the label from " + $oldLabel + " to the new label, " + $Label)
    }
}