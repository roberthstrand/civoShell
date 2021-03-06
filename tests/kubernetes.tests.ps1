BeforeAll {
    Import-Module ((Split-Path $PSScriptRoot -Parent) + "/civoShell/civoShell.psd1")
}

Describe 'Get Kubernetes clusters' {
    BeforeAll {
        . ($PSScriptRoot + "/mocks/kubernetes/Get-CivoKubernetesCluster.ps1")
    }

    It 'Should show all Kubernetes clusters' {
        $cmdlet = Get-CivoKubernetesCluster
        $cmdlet.count | Should -Be 1
    }

    It 'Should get just one of the clusters' {
        $cmdlet = Get-CivoKubernetesCluster -Id "True"
        $cmdlet.Name | Should -Be 'Pester'
        $cmdlet.NodeCount | Should -Be 1
    }
}

Describe 'Create a new Kubernetes cluster' {
    BeforeAll {
        . ($PSScriptRoot + "/mocks/kubernetes/New-CivoKubernetesCluster.ps1")
    }

    It 'Should create a cluster with one node, named pester' {
        $cmdlet = New-CivoKubernetesCluster -Name "Pester" -NodeCount 1
        $cmdlet.Name | Should -Be 'Pester'
        $cmdlet.Nodes | Should -Be 1
    }

    It 'Should create a cluster with two nodes, named cluster01 and running on g2.large instances' {
        $cmdlet = New-CivoKubernetesCluster -Name "cluster01" -NodeCount 2 -NodesSize "g2.large"
        $cmdlet.Name | Should -Be 'cluster01'
        $cmdlet.Nodes | Should -Be 2
        $cmdlet.NodesSize | Should -Be 'g2.large'
    }
}

# Describe 'Delete a Kubernetes cluster' {
#     BeforeAll {
#         . ($PSScriptRoot + "/mocks/kubernetes/Remove-CivoKubernetesCluster.ps1")
#     }

#     It 'Should result in '
# }

Describe 'working with applications and kubernetes' {
    BeforeAll {
        . ($PSScriptRoot + "/mocks/kubernetes/Get-CivoKubernetesApplication.ps1")
    }

    It 'Should list all applications' {
        $apps = Get-CivoKubernetesApplication

        $apps.count | Should -Be 2
        $apps.name | Sort-Object | Should -Be @('argo','PostgreSQL')
    }
}