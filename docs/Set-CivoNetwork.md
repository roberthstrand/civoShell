---
external help file: civoShell-help.xml
Module Name: civoShell
online version: https://roberthstrand.github.io/civoShell/Set-CivoNetwork.md
schema: 2.0.0
---

# Set-CivoNetwork

## SYNOPSIS
Update a network.

## SYNTAX

```
Set-CivoNetwork [-Id] <String[]> [-Label] <String[]> [<CommonParameters>]
```

## DESCRIPTION
Update a private network's label.

## EXAMPLES

### EXAMPLE 1
```
Set-CivoNetwork 1e644b7c-80e5-412b-a26b-a1e0e6215ced -Label test-client01
```

## PARAMETERS

### -Id
The ID of the private network that you want to update.

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

### -Label
The label of the private network that you want to update.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### The ID of the network you want to update, as well as the new label.
## OUTPUTS

### Object with information about the updated private networks.
## NOTES

## RELATED LINKS

[https://roberthstrand.github.io/civoShell/Set-CivoNetwork.md](https://roberthstrand.github.io/civoShell/Set-CivoNetwork.md)

