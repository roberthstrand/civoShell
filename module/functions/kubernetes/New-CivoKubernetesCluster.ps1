function New-CivoKubernetesCluster {
    [CmdletBinding()]
    param (
        [Parameter(Position = 0, Mandatory)]
        [string]
        $Name,
        [Parameter(Position = 1)]
        [string]
        $NodeCount,
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

    $CallSplat  = @{
        Uri     = "kubernetes/clusters/"
        Method  = 'Post'
        Form    = @{
            name                = $Name
            num_target_nodes    = $NodeCount
            target_node_size    = $NodeSize
        }
    }
    $call = Invoke-CivoApi @CallSplat

    [PSCustomObject]@{
        Name                = $call.name
        Id                  = $call.id
        Status              = $call.status
        Ready               = $call.ready
        Nodes               = $call.num_target_nodes
        KubernetesVersion   = $call.kubernetes_version
        Tags                = $call.tags
    }
}