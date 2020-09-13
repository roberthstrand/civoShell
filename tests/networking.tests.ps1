BeforeAll {
    Import-Module ((Split-Path $PSScriptRoot -Parent) + "/module/civoShell.psd1")
}

Describe 'Creating a new private network' {
    BeforeAll {
        . ($PSScriptRoot + "/mocks/networking/New-CivoNetwork.ps1")
    }

    It 'Should create a network with the label "Pester" and the result of "success"' {
        $cmdlet = New-CivoNetwork -Label 'Pester'

        $cmdlet.result | Should -Be 'success'
        $cmdlet.label | Should -Be 'Pester'
    }
}

Describe 'List all networks, and get a specific one.' {
    BeforeAll {
        . ($PSScriptRoot + "/mocks/networking/Get-CivoNetwork.ps1")
    }

    It 'Should be able to list all networks' {
        $cmdlet = Get-CivoNetwork

        $cmdlet.count | Should -Be 3
    }

    It 'Should be able to filter out the network with the label pester' {
        $cmdlet = Get-CivoNetwork -Label 'Pester'

        $cmdlet.count | Should -Be 1
        $cmdlet.label | Should -Be 'Pester'
    }
}