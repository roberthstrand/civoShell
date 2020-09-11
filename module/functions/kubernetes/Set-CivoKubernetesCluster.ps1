function Set-CivoKubernetesCluster {
    [CmdletBinding()]
    param (
        [Parameter(Position = 0, Mandatory,ValueFromPipeline = $true)]
        [string]
        $Id,
        [Parameter(Position = 1)]
        [string]
        $Name,
        [Parameter(Position = 2)]
        [string]
        $NodeCount,
        [Parameter(Position = 3)]
        [string]
        $NodeToDestroy,
        [Parameter(Position = 4)]
        [string]
        $KubernetesVersion,
        [Parameter(Position = 5)]
        [string]
        $Applications
    )

    $Form = @{
        name                = $Name
        num_target_nodes    = $NodeCount
        node_destroy        = $NodeToDestroy
        kubernetes_version  = $KubernetesVersion
        applications        = $Applications
    }
    $CallSplat  = @{
        Uri     = "kubernetes/clusters/$Id"
        Method  = 'PUT'
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