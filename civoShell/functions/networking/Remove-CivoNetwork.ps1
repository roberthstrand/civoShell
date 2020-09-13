function Remove-CivoNetwork {
    <#
    .SYNOPSIS
    Delete a network.
    .DESCRIPTION
    Deletes a private network based on the ID of the network. ID must be provided. Can be multiple networks.
    .PARAMETER Id
    The ID of the network or networks that you want to delete. To delete several networks, you need to provide a comma separated list.
    .INPUTS
    The parameter Id must be provided.
    .OUTPUTS
    The result of the attempted deletion.
    .EXAMPLE
    Remove-CivoNetwork -Id xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
    .EXAMPLE
    $Networks =(
    "667a84f6-caeb-4d8b-9ba4-c122564171c5",
    "d8f0f800-f2d9-4555-97b8-a3eb1b9a753c",
    "9000bbed-309f-42d3-a21b-04d3dd544c93"
    )

    Remove-CivoNetwork -Id $Networks
    .EXAMPLE
    Remove-CivoNetwork -Label prod-client01
    .EXAMPLE
    $Networks =(
    "prod-client01",
    "test-client01"
    )

    Remove-CivoNetwork -Label $Networks
    .LINK
    https://roberthstrand.github.io/civoShell/Remove-CivoNetwork.md
    #>
    [CmdletBinding()]
    param (
        [Parameter(Position = 0, ValueFromPipeline = $true)]
        [string[]]
        $Id,
        [Parameter(Position = 0, ParameterSetName = 'Label')]
        [string[]]
        $Label
    )
    if ($Label) {
        $Label | ForEach-Object {
            $NetworkId = Get-CivoNetwork -Label $_ | Select-Object -ExpandProperty Id
            $CallSplat = @{
                Uri     = "networks/$NetworkId"
                Method  = 'DELETE'
            }

            $call = Invoke-CivoApi @CallSplat

            If ($call.result -eq 'success') {
                Write-Host ("Successfully deleted network with label " + $_)
            }
            else {
                Write-Error ("No network found with the label " + $_)
            }
        }
    }
    else {
        if (!$Id) {
            $Id = Read-Host "Enter network ID"
        }
        $Id | ForEach-Object {
            $CallSplat = @{
                Uri     = "networks/$_"
                Method  = 'DELETE'
            }

            $call = Invoke-CivoApi @CallSplat
    
            If ($call.result -eq 'success') {
                Write-Host ("Successfully deleted network with ID " + $_)
            } 
            else {
                Write-Error ("No network found with the ID " + $_)
            }
        }
    }
}