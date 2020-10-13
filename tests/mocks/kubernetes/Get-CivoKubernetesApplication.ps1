function Invoke-CivoApi () {}
Mock Invoke-CivoApi -ModuleName civoShell {
    [PSCustomObject]@{
        Name        = 'argo'
        Label       = 'Argo CI/CD'
        Type        = '(default)'
        Default     = $null
        Depdencies  = $null
        Maintainer  = 'The Argo Project'
        Description = 'Declarative continuous deployment for Kubernetes'
        Url         = 'https://github.com/argoproj/argo-cd/'
        Category    = 'ci_cd'
        Plans       = $null
    }
    [PSCustomObject]@{
        Name        = 'PostgreSQL'
        Label       = $null
        Type        = 11.5
        Default     = $null
        Depdencies  = '{Longhorn}'
        Maintainer  = 'hello@civo.com'
        Description = 'The PostgreSQL object-relational database system provides reliability and data integrity.'
        Url         = 'https://www.postgresql.org'
        Category    = 'database'
        Plans       = '{@{label=5GB; configuration=}, @{label=10GB; configuration=}, @{label=20GB; configuration=}}'
    }
}