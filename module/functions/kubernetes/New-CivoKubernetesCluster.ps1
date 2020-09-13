function New-CivoKubernetesCluster {
    <#
    .SYNOPSIS
    Create a new Kubernetes Cluster.
    .DESCRIPTION
    Create a new k3s Kubernetes cluster.
    
    You can either just define the name of the cluster or define it just as you want. See the available parameters for what you can do.
    .PARAMETER Name
    Set the name of your cluster. This parameter is mandatory and must be set to continue.
    .PARAMETER NodeCount
    Set the number of nodes you want to run. The default is 3.
    .PARAMETER NodesSize
    Set the instance size of your nodes. The current default is g2.small.
    .PARAMETER KubernetesVersion
    Set the version of Kubernetes you want to run. This defaults to the latest available.
    .PARAMETER Tags
    You can define one or more tags for your cluster. The list should be space separated.
    .PARAMETER Applications
    A comma separated list of applications you want install at deployment. If you want to remove a default application, you can prefix the name with a -.
    .OUTPUTS
    Details of the new cluster you have created.
    .EXAMPLE
    New-CivoKubernetesCluster MyNewCluster
    .EXAMPLE
    New-CivoKubernetesCluster -Name "Cluster01" -NodeCount 1
    .EXAMPLE
    $cluster            = @{
        Name            = "ClustersLastStand"
        NodeCount       = 2
        NodesSize        = "g2.large"
        Tags            = "prod powershell"
        Applications    = "prometheus-operator, MinIO"
    }
    New-CivoKubernetesCluster @cluster
    .LINK
    https://roberthstrand.github.io/civoShell/New-CivoKubernetesCluster.md
    #>
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
        $NodesSize,
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
        target_nodes_size   = $NodesSize
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
        NodesSize           = $call.target_nodes_size
        KubernetesVersion   = $call.kubernetes_version
        Tags                = $call.tags
        Applications        = $call.installed_applications.application
    }
}