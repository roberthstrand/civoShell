function Get-CivoKubernetesApplication {
    <#
    .SYNOPSIS
    List available applications.
    .DESCRIPTION
    List available applications from the marketplace. These can be installed at deployment, or later on.
    .OUTPUTS
    All applications, or applications based on the name parameter.
    .EXAMPLE
    Get-CivoKubernetesApplication
    .LINK
    https://github.com/roberthstrand/civoShell
    #>
    [CmdletBinding()]
    
    $CallSplat = @{
        Uri     = "kubernetes/applications"
        Method  = 'GET'
    }
    $call = Invoke-CivoApi @CallSplat

    # Running the results through a ForEach loop, to seperate the applications.
    $call | ForEach-Object {
        [PSCustomObject]@{
            Version             = $_.name
            Label               = $_.title
            Type                = $_.version
            Default             = $_.default
            Depdencies          = $_.dependencies
            Maintainer          = $_.maintainer
            Description         = $_.description
            Url                 = $_.url
            Category            = $_.category
            Plans               = $_.plans
        }
    }
}