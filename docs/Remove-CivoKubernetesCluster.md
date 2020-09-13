---
external help file: civoShell-help.xml
Module Name: civoShell
online version: https://roberthstrand.github.io/civoShell/Remove-CivoKubernetesCluster.md
schema: 2.0.0
---

# Remove-CivoKubernetesCluster

## SYNOPSIS
Remove a Kubernetes cluster.

## SYNTAX

```
Remove-CivoKubernetesCluster [-Id] <String[]> [<CommonParameters>]
```

## DESCRIPTION
Remove a Kubernetes cluster, based on ID.
The ID parameter is mandatory, and can take more than one cluster ID at the time.

## EXAMPLES

### EXAMPLE 1
```
Remove-CivoKubernetesCluster -Id xxxxxxxx-xxxx-xxxx-xxxxxxxxxxxx
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

### -Id
The ID of the cluster you want to remove.
This parameter is mandatory and must be set to continue.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### Output object with the cluster that is removed, if it is successfull.
## NOTES

## RELATED LINKS

[https://roberthstrand.github.io/civoShell/Remove-CivoKubernetesCluster.md](https://roberthstrand.github.io/civoShell/Remove-CivoKubernetesCluster.md)

