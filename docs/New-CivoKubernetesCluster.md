---
external help file: civoShell-help.xml
Module Name: civoShell
online version: https://github.com/roberthstrand/civoShell
schema: 2.0.0
---

# New-CivoKubernetesCluster

## SYNOPSIS
Create a new Kubernetes Cluster.

## SYNTAX

```
New-CivoKubernetesCluster [-Name] <String> [[-NodeCount] <String>] [[-NodesSize] <String>]
 [[-KubernetesVersion] <String>] [[-Tags] <String>] [[-Applications] <String>] [<CommonParameters>]
```

## DESCRIPTION
Create a new k3s Kubernetes cluster.
You can either just define the name of the cluster or define it just as you want.
See the available parameters for what you can do.

## EXAMPLES

### EXAMPLE 1
```
New-CivoKubernetesCluster MyNewCluster
```

### EXAMPLE 2
```
New-CivoKubernetesCluster -Name "Cluster01" -NodeCount 1
```

### EXAMPLE 3
```
$cluster            = @{
    Name            = "ClustersLastStand"
    NodeCount       = 2
    NodesSize        = "g2.large"
    Tags            = "prod powershell"
    Applications    = "prometheus-operator, MinIO"
}
New-CivoKubernetesCluster @cluster
```

## PARAMETERS

### -Name
Set the name of your cluster.
This parameter is mandatory and must be set to continue.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -NodeCount
Set the number of nodes you want to run.
The default is 3.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -NodesSize
Set the instance size of your nodes.
The current default is g2.small.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -KubernetesVersion
Set the version of Kubernetes you want to run.
This defaults to the latest available.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Tags
You can define one or more tags for your cluster.
The list should be space separated.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Applications
A comma separated list of applications you want install at deployment.
If you want to remove a default application, you can prefix the name with a -.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### Details of the new cluster you have created.
## NOTES

## RELATED LINKS

[https://github.com/roberthstrand/civoShell](https://github.com/roberthstrand/civoShell)

