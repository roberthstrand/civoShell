function Get-CivoKubernetesCluster {
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
    $call = Invoke-CivoApi @CallSplat | Select-Object -ExpandProperty 'items'

    [PSCustomObject]@{
        Name                = $call.name
        Id                  = $call.id
        Status              = $call.status
        Ready               = $call.ready
        NodeCount           = $call.num_target_nodes
        KubernetesVersion   = $call.kubernetes_version
        Tags                = $call.tags
    }
}