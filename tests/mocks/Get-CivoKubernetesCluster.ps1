function Invoke-CivoApi () {}
Mock Invoke-CivoApi -ModuleName civoShell {
    [PSCustomObject]@{
        id                = "fd38ea4f-5717-4db4-a7c7-09b29053d747"
        name              = "Pester"
        version           = 2
        status            = "NEW"
        ready             = "True"
        num_target_nodes  = 1
        target_nodes_size = "g2.small"
    }
} -ParameterFilter { $Uri -eq 'kubernetes/clusters/True' -and $Method -eq 'GET' }

Mock Invoke-CivoApi -ModuleName civoShell {
    $items = New-Object -TypeName pscustomobject -Property @{
        id                   = "fd38ea4f-5717-4db4-a7c7-09b29053d747"
        name                 = "Pester"
        version              = 2
        status               = "NEW"
        ready                = "True"
        num_target_nodes     = 1
        target_nodes_size    = "g2.small"
        built_at             = ""
        kubeconfig           = ""
        kubernetes_version   = "1.18.6+k3s1"
        api_endpoint         = ""
        dns_entry            = "fd38ea4f-5717-4db4-a7c7-09b29053d747.k8s.civo.com"
        tags                 = {}
        created_at           = "9/12/2020 4:55:55 PM"
        upgrade_available_to = ""
        master_ip            = ""
    }
    [PSCustomObject]@{
        page     = 1
        per_page = 20
        pages    = 1
        items    = $items
    }
} -ParameterFilter { $Uri -eq 'kubernetes/clusters/' -and $Method -eq 'GET' }