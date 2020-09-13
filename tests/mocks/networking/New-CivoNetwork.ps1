function Invoke-CivoApi () {
    param (
        [string]$Form,
        [string]$method,
        [string]$uri
    )
}
Mock Invoke-CivoApi -ModuleName civoShell {
    [PSCustomObject]@{
        result  = 'success'
        id      = '69a23478-a89e-41d2-97b1-6f4c341cee70'
        label   = $form.label
    }
}