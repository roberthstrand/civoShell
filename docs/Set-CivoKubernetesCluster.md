---
external help file: civoShell-help.xml
Module Name: civoShell
online version: https://roberthstrand.github.io/civoShell/Set-CivoKubernetesCluster.md
schema: 2.0.0
---

# Set-CivoKubernetesCluster

## SYNOPSIS
Update a Kubernetes cluster.

## SYNTAX

```
Set-CivoKubernetesCluster [-Id] <String> [[-Name] <String>] [[-NodeCount] <String>] [[-NodeToDestroy] <String>]
 [[-KubernetesVersion] <String>] [[-Applications] <String>] [<CommonParameters>]
```

## DESCRIPTION
Update a cluster name, scale up the node count, set a new Kubernetes version or add a new application to the cluster.

## EXAMPLES

### EXAMPLE 1
```
Set-CivoKubernetesCluster -Id xxxxxxxx-xxxx-xxxx-xxxxxxxxxxxx -Name NewName
```

## PARAMETERS

### -Id
The ID of the cluster you want to update.
This parameter is mandatory and must be set to continue.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Name
The name you want your cluster set to.

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

### -NodeCount
The number of nodes you want your cluster to be.
If set to a lower number, you can use -NodeToDestroy to define the specific node you want removed.

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

### -NodeToDestroy
If scaling down, you can define the specific node you want to be destroyed in the process.

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

### -KubernetesVersion
Set the desired Kubernetes version for your cluster.

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
Define what applications you want to run in your cluster.

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

### Output object with the cluster information after it has been updated.
## NOTES

## RELATED LINKS

[https://roberthstrand.github.io/civoShell/Set-CivoKubernetesCluster.md](https://roberthstrand.github.io/civoShell/Set-CivoKubernetesCluster.md)

