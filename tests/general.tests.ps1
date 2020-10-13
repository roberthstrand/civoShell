BeforeAll {
    Import-Module ((Split-Path $PSScriptRoot -Parent) + "/civoShell/civoShell.psd1")
}

Describe 'Misc tests' {
    BeforeAll {
        . ($PSScriptRoot + "/mocks/general.ps1")
    }

    It 'sets the API key as environment variable' {
        Set-CivoApiToken -ApiKey 'key' -Force
        $env:CivoToken | Should -Be 'key'
    }

    It 'shows available regions' {
        $regions = Get-CivoRegion

        $regions.name | Should -Be 'London 1'
        $regions.code | Should -Be 'lon1'
        $regions.default | Should -Be 'true'
    }
}