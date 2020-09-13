function Set-CivoKubernetesCluster {
    <#
    .SYNOPSIS
    Update a Kubernetes cluster.
    .DESCRIPTION
    Update a cluster name, scale up the node count, set a new Kubernetes version or add a new application to the cluster.
    .PARAMETER Id
    The ID of the cluster you want to update. This parameter is mandatory and must be set to continue.
    .PARAMETER Name
    The name you want your cluster set to.
    .PARAMETER NodeCount
    The number of nodes you want your cluster to be. If set to a lower number, you can use -NodeToDestroy to define the specific node you want removed.
    .PARAMETER NodeToDestroy
    If scaling down, you can define the specific node you want to be destroyed in the process.
    .PARAMETER KubernetesVersion
    Set the desired Kubernetes version for your cluster.
    .PARAMETER Applications
    Define what applications you want to run in your cluster.
    .OUTPUTS
    Output object with the cluster information after it has been updated.
    .EXAMPLE
    Set-CivoKubernetesCluster -Id xxxxxxxx-xxxx-xxxx-xxxxxxxxxxxx -Name NewName
    .LINK
    https://roberthstrand.github.io/civoShell/Set-CivoKubernetesCluster.md
    #>
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