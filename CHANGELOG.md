# Module Release History

## 0.1.0 [2020-09-13]

### Added more functionality, and improved old ones

#### General improvements

* Added help comments for cmdlets

#### Pester tests

Got the structure up and running, and wrote tests for the following:

* Get all clusters
* Get a particular cluster
* Create clusters

#### Get-CivoKubernetesCluster

* Added applications to the -Detailed output object.

#### New-CivoKubernetesCluster

* Added list of applications to the output object.
* Bug fix: Selection NodeSize now works.

## 0.0.8 [2020-09-11]

### Initial release

A very much work in progress, and not yet added to the PowerShell Gallery. Missing help comments, pesters tests and much more.

**Kubernetes functionality**

```
New-CivoKubernetesCluster
Get-CivoKubernetesCluster
Set-CivoKubernetesCluster
Remove-CivoKubernetesCluster
```

**Networking**

```
Get-CivoNetwork
```