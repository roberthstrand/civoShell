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
        [string]
        $Body,
        [Parameter(Position = 3)]
        [System.Collections.ArrayList]
        $Form,
        [Parameter()]
        [string]
        $Token = $Env:CivoToken
    )

    $restSplat = @{
        Uri    = "https://api.civo.com/v2/$Uri"
        Method = $Method
        Body   = $Body
        Form   = $Form
        header = @{ 
            'Authorization' = "Bearer $Token"
        }
    }
    try {
        Invoke-RestMethod @restSplat -ErrorAction Stop
    }
    catch {
        Write-Error "API Token needs to be set, either by using the Token parameter or by the CivoToken environment variable."
    }
}