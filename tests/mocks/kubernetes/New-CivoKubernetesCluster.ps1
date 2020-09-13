function Invoke-CivoApi () {
    param (
        [string]$Form,
        [string]$method,
        [string]$uri
    )
}
Mock Invoke-CivoApi -ModuleName civoShell {
    [PSCustomObject]@{
        id                  = '69a23478-a89e-41d2-97b1-6f4c341cee70'
        name                = $Form.name
        version             = 2
        status              = 'ACTIVE'
        ready               = 'true'
        num_target_nodes    = $Form.num_target_nodes
        target_nodes_size   = $Form.target_nodes_size
        built_at            = '2019-09-23T13:04:23.000+01:00'
        kubeconfig          = 'YAML_VERSION_OF_KUBECONFIG_HERE\n'
        kubernetes_version  = '0.8.1'
        api_endpoint        = 'https://your.cluster.ip.address:6443'
        master_ip           = 'your.cluster.ip.address'
        dns_entry           = '69a23478-a89e-41d2-97b1-6f4c341cee70.k8s.civo.com'
    }
}