function Invoke-CivoApi () {
    param (
        [string]$Form,
        [string]$method,
        [string]$uri
    )
}
Mock Invoke-CivoApi -ModuleName civoShell {
    [PSCustomObject]@{
        id = '50f2fffa-f81e-4e96-830f-e78f7e565e6f'
        name = 'example-ltd-a775-development-75362452-562f-4b70-a65a-aeb4d4cd6864'
        region = 'lon1'
        default = 'true'
        cidr = '0.0.0.0/0'
        label = 'development'
    }
    [PSCustomObject]@{
        id = '50f2fffa-f81e-4e96-830f-e78f7e565e6f'
        name = 'example-ltd-a775-test-75362452-562f-4b70-a65a-aeb4d4cd6864'
        region = 'lon1'
        default = 'false'
        cidr = '0.0.0.0/0'
        label = 'test'
    }
    [PSCustomObject]@{
        id = '50f2fffa-f81e-4e96-830f-e78f7e565e6f'
        name = 'example-ltd-a775-pester-75362452-562f-4b70-a65a-aeb4d4cd6864'
        region = 'lon1'
        default = 'false'
        cidr = '0.0.0.0/0'
        label = 'pester'
    }
}