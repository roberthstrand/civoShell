function Remove-CivoKubernetesCluster {
    [CmdletBinding()]
    param (
        [Parameter(Position = 0,ValueFromPipeline=$true, Mandatory = $true)]
        [string]
        $Id
    )
    
    $CallSplat = @{
        Uri     = "kubernetes/clusters/$Id"
        Method  = 'DELETE'
    }
    Invoke-CivoApi @CallSplat
}