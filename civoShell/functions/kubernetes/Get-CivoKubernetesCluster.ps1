function Get-CivoKubernetesCluster {
    <#
    .SYNOPSIS
    List Kubernetes clusters.
    .DESCRIPTION
    Lists either all Kubernetes clusters, or a specific one by providing the cluster ID.
    .PARAMETER Id
    The ID of a specific cluster.
    .PARAMETER Detailed
    Use this switch to get all the details about your cluster.
    .INPUTS
    You can pipe a cluster ID to Get-CivoKubernetesCluster
    .OUTPUTS
    Object with information about the cluster, or clusters.
    .EXAMPLE
    Get-CivoKubernetesCluster
    .EXAMPLE
    Get-CivoKubernetesCluster -Id xxxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxx
    .EXAMPLE
    Get-CivoKubernetesCluster -Detailed
    .LINK
    https://roberthstrand.github.io/civoShell/Get-CivoKubernetesCluster.md
    #>
    [CmdletBinding()]
    param (
        [Parameter(Position = 0,ValueFromPipeline = $true)]
        [string]
        $Id,
        [Parameter()]
        [switch]
        $Detailed
    )
    
    $CallSplat = @{
        Uri     = "kubernetes/clusters/$Id"
        Method  = 'GET'
    }
    # If no $Id is provided, we need to select the items object.
    if (!$Id) {
            $call = Invoke-CivoApi @CallSplat | Select-Object -ExpandProperty 'items'
        } else {
            $call = Invoke-CivoApi @CallSplat
        }

    # Running the results through a ForEach loop, to seperate the clusters.
    $call | ForEach-Object {
        if ($Detailed -eq $true)
        {
            [PSCustomObject]@{
                Id                  = $_.id
                Name                = $_.name
                Ready               = $_.ready
                Status              = $_.status
                Version             = $_.version
                Created             = $_.created_at
                NodeCount           = $_.num_target_nodes
                NodesSize           = $_.instances.size
                KubernetesVersion   = $_.kubernetes_version
                Tags                = $_.tags
                ApiEndpoint         = $_.api_endpoint
                DNS                 = $_.dns_entry
                MasterIp            = $_.master_ip
                Applications        = $_.installed_applications.application
            }
        } else {
            [PSCustomObject]@{
                Id                  = $_.id
                Name                = $_.name
                Ready               = $_.ready
                Status              = $_.status
                NodeCount           = $_.num_target_nodes
                NodesSize           = $_.instances.size
                KubernetesVersion   = $_.kubernetes_version
                Tags                = $_.tags
            }
        }
    }
}