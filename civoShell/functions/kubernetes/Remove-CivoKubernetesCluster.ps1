function Remove-CivoKubernetesCluster {
    <#
    .SYNOPSIS
    Remove a Kubernetes cluster.
    .DESCRIPTION
    Remove a Kubernetes cluster, based on ID. The ID parameter is mandatory, and can take more than one cluster ID at the time.
    .PARAMETER Id
    The ID of the cluster you want to remove. This parameter is mandatory and must be set to continue.
    .OUTPUTS
    Output object with the cluster that is removed, if it is successfull.
    .EXAMPLE
    Remove-CivoKubernetesCluster -Id xxxxxxxx-xxxx-xxxx-xxxxxxxxxxxx
    .EXAMPLE
    $cluster            = @()
        Name            = "ClustersLastStand"
        NodeCount       = 2
        NodesSize        = "g2.large"
        Tags            = "prod powershell"
        Applications    = "prometheus-operator, MinIO"
    }
    New-CivoKubernetesCluster @cluster
    .LINK
    https://roberthstrand.github.io/civoShell/Remove-CivoKubernetesCluster.md
    #>
    [CmdletBinding()]
    param (
        [Parameter(Position = 0,ValueFromPipeline = $true, Mandatory = $true)]
        [string[]]
        $Id
    )
    $Id | ForEach-Object {
        $CallSplat = @{
            Uri     = "kubernetes/clusters/$_"
            Method  = 'DELETE'
        }
        Invoke-CivoApi @CallSplat
    }
}