Get-ChildItem -Name "*.ps1" -Path ($PSScriptRoot + "/functions") | ForEach-Object {
    . ($PSScriptRoot + "/functions/" + $_)
}
Get-ChildItem -Name "*.ps1" -Path ($PSScriptRoot + "/functions/kubernetes") | ForEach-Object {
    . ($PSScriptRoot + "/functions/kubernetes/" + $_)
}