function Get-CivoKubernetesVersion {
    <#
    .SYNOPSIS
    List available Kubernetes versions.
    .DESCRIPTION
    List available Kubernetes versions you can run on the Civo Cloud Platform.
    .OUTPUTS
    All available versions of Kubernetes.
    .EXAMPLE
    Get-CivoKubernetesVersion
    .LINK
    https://github.com/roberthstrand/civoShell
    #>
    [CmdletBinding()]
    
    $CallSplat = @{
        Uri     = "kubernetes/versions"
        Method  = 'GET'
    }
    $call = Invoke-CivoApi @CallSplat

    # Running the results through a ForEach loop, to seperate the versions.
    $call | ForEach-Object {
        [PSCustomObject]@{
            Version             = $_.version
            Label               = $_.label
            Type                = $_.type
            Default             = $_.default
        }
    }
}