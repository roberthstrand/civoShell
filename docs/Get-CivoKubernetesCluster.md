---
external help file: civoShell-help.xml
Module Name: civoShell
online version: https://roberthstrand.github.io/civoShell/Get-CivoKubernetesCluster.md
schema: 2.0.0
---

# Get-CivoKubernetesCluster

## SYNOPSIS
List Kubernetes clusters.

## SYNTAX

```
Get-CivoKubernetesCluster [[-Id] <String>] [-Detailed] [<CommonParameters>]
```

## DESCRIPTION
Lists either all Kubernetes clusters, or a specific one by providing the cluster ID.

## EXAMPLES

### EXAMPLE 1
```
Get-CivoKubernetesCluster
```

### EXAMPLE 2
```
Get-CivoKubernetesCluster -Id xxxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxx
```

### EXAMPLE 3
```
Get-CivoKubernetesCluster -Detailed
```

## PARAMETERS

### -Id
The ID of a specific cluster.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Detailed
Use this switch to get all the details about your cluster.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### You can pipe a cluster ID to Get-CivoKubernetesCluster
## OUTPUTS

### Object with information about the cluster, or clusters.
## NOTES

## RELATED LINKS

[https://roberthstrand.github.io/civoShell/Get-CivoKubernetesCluster.md](https://roberthstrand.github.io/civoShell/Get-CivoKubernetesCluster.md)

