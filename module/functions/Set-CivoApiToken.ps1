function Set-CivoApiToken {
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