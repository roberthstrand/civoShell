function Invoke-CivoApi {
    [CmdletBinding()]
    param (
        [Parameter(Position = 0, Mandatory = $true)]
        [string]
        $Uri,
        [Parameter(Position = 1)]
        [string]
        $Method = 'Get',
        [Parameter(Position = 2)]
        [System.Collections.IDictionary]
        $Form,
        [Parameter()]
        [string]
        $Token = $Env:CivoToken
    )

    $restSplat = @{
        Uri    = "https://api.civo.com/v2/$Uri"
        Method = $Method
        Form   = $Form
        header = @{ 
            'Authorization' = "Bearer $Token"
        }
    }
    try {
        Invoke-RestMethod @restSplat -ErrorAction Stop
    }
    catch {
        if ($_.Exception.Response.StatusCode -eq 401) {
            # TODO: Find a more suitable error message.
            Write-Error "API Token needs to be set. Please run Set-CivoApiToken."
        }
    }
}