@{
    RootModule        = 'civoShell.psm1'
    ModuleVersion     = '0.2.0'
    GUID              = '2512b980-e14e-40e3-bc6d-fe722196a06a'

    Author            = 'Roberth Strand'
    CompanyName       = 'robstr.dev'

    Copyright         = 'civoShell is licensed under the GNU General Public License v3.0'

    Description       = 'A PowerShell module for working with the Civo Cloud platform.'

    FunctionsToExport = @(
        "Set-CivoApiToken"
        "Get-CivoRegion"
        # Kubernetes
        "New-CivoKubernetesCluster"
        "Get-CivoKubernetesCluster"
        "Set-CivoKubernetesCluster"
        "Remove-CivoKubernetesCluster"
        "Get-CivoKubernetesVersion"
        "Get-CivoKubernetesApplication"
        # Networking
        "New-CivoNetwork"
        "Get-CivoNetwork"
        "Set-CivoNetwork"
        "Remove-CivoNetwork"
        )
    #CmdletsToExport   = '*'
    #VariablesToExport = '*'
    #AliasesToExport   = '*'

    PrivateData       = @{
        PSData = @{
            Tags       = @('Civo')
            LicenseUri = 'https://github.com/roberthstrand/civoShell/blob/main/LICENSE'
            ProjectUri = 'https://github.com/roberthstrand/civoShell'
            # IconUri = ''
        }
    }
}


