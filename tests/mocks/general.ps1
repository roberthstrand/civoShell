function Invoke-CivoApi () {
    param (
        [string]
        $Uri
    )
}
Mock Invoke-CivoApi -ModuleName civoShell {
    [PSCustomObject]@{
        Name = 'London 1'
        Code = 'lon1'
        default = 'true'
    }
} -ParameterFilter { $Uri -eq "regions"}