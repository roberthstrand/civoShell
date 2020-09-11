function Get-CivoKubernetesCluster {
    <#
    .SYNOPSIS
    List Kubernetes clusters.
    .DESCRIPTION
    Lists either all Kubernetes clusters, or a specific one by providing the cluster ID.
    .PARAMETER Id
    The ID of a specific cluster.
    .INPUTS
    You can pipe a cluster ID to Get-CivoKubernetesCluster
    .OUTPUTS
    Object with information about the cluster, or clusters.
    .EXAMPLE
    Get-CivoKubernetesCluster
    .EXAMPLE
    Get-CivoKubernetesCluster -Id xxxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxx
    .LINK
    https://github.com/roberthstrand/civoShell
    #>
    [CmdletBinding()]
    param (
        [Parameter(Position = 0,ValueFromPipeline=$true)]
        [string]
        $Id
    )
    
    $CallSplat = @{
        Uri     = "kubernetes/clusters/$Id"
        Method  = 'Get'
    }
    # If no $Id is provided, we need to select the items object.
    if (!$Id) {
            $call = Invoke-CivoApi @CallSplat | Select-Object -ExpandProperty 'items'
        } else {
            $call = Invoke-CivoApi @CallSplat
        }

    $call | ForEach-Object {
        [PSCustomObject]@{
            Name                = $_.name
            Id                  = $_.id
            Status              = $_.status
            Ready               = $_.ready
            NodeCount           = $_.num_target_nodes
            KubernetesVersion   = $_.kubernetes_version
            Tags                = $_.tags
        }
    }
}