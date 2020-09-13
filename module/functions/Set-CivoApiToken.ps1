function Set-CivoApiToken {
    <#
    .SYNOPSIS
    Set the API key needed to use civoShell.
    .DESCRIPTION
    civoShell is working towards the API for the Civo cloud platform, and authenticates with an API token key. This can be found at https://civo.com/api.

    Using this cmdlet will create and set the environment variable CivoToken which is the basis for all API calls. If this key is compromised, you would have to regenerate the key at https://civo.com/api.
    .PARAMETER ApiKey
    The API key from Civo.
    .PARAMETER Force
    If you have a key set, you can use the switch -force to set a new key.
    .INPUTS
    ApiKey is mandatory.
    .OUTPUTS
    Information that they key is set, or a warning if a key is already present.
    .EXAMPLE
    Set-CivoApiToken -ApiKey tN5fRvmdxkpQtSr7dBlWC1OuU1seF3KlGa1YzzvEvp8bkpQfl2
    .LINK
    https://roberthstrand.github.io/civoShell/Set-CivoApiToken.md
    #>
    [CmdletBinding()]
    param (
        [Parameter(Position = 0, Mandatory = $true)]
        [string]
        $ApiKey,
        [Parameter(Position = 1)]
        [switch]
        $Force
    )

    if ((Test-Path -Path "Env:\CivoToken") -and ($Force -eq $false)) {
        Write-Host "API Key already set to $Env:CivoToken"
        Write-Host "If you want to override the key, you can use the -Force switch!"
    } else {
        New-Item -Name CivoToken -Path "Env:" -Value $ApiKey -Force
    } 
}