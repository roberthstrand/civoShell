function New-CivoKubernetesCluster {
    [CmdletBinding()]
    param (
        [Parameter(Position = 0, Mandatory)]
        [string]
        $Name,
        [Parameter(Position = 1)]
        [string]
        $NodeCount = 3,
        [Parameter(Position = 2)]
        [string]
        $NodeSize,
        [Parameter(Position = 3)]
        [string]
        $KubernetesVersion,
        [Parameter(Position = 4)]
        [string]
        $Tags,
        [Parameter(Position = 5)]
        [string]
        $Applications
    )
    $Form                   = @{
        name                = $Name
        num_target_nodes    = $NodeCount
        target_node_size    = $NodeSize
        kubernetes_version  = $KubernetesVersion
        tags                = $Tags
        applications        = $Applications
    }
    $CallSplat  = @{
        Uri     = "kubernetes/clusters/"
        Method  = 'POST'
        Form    = $Form
    }
    $call = Invoke-CivoApi @CallSplat

    [PSCustomObject]@{
        Id                  = $call.id
        Name                = $call.name
        Status              = $call.status
        Ready               = $call.ready
        Nodes               = $call.num_target_nodes
        KubernetesVersion   = $call.kubernetes_version
        Tags                = $call.tags
    }
}