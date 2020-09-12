# ------------- civoShell ------------- #
# Dot sourcing all available functions. #
$functionTypes = @(
    '/'
    '/kubernetes/'
    '/networking/'
)

foreach ($function in $functionTypes) {
    Get-ChildItem -Name "*.ps1" -Path ($PSScriptRoot + "/functions" + $function) | ForEach-Object {
        . ($PSScriptRoot + "/functions" + $function + $_)
    }
}
