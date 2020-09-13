---
external help file: civoShell-help.xml
Module Name: civoShell
online version: https://roberthstrand.github.io/civoShell/New-CivoNetwork.md
schema: 2.0.0
---

# New-CivoNetwork

## SYNOPSIS
Create a new private network.

## SYNTAX

```
New-CivoNetwork [-Label] <String> [<CommonParameters>]
```

## DESCRIPTION
Creates a new private network, using label as name.

## EXAMPLES

### EXAMPLE 1
```
New-CivoNetwork -Label 'Network02'
```

## PARAMETERS

### -Label
Label to be used with the new private network.

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### The label parameter, which is mandatory.
## OUTPUTS

### Object with information about the private network.
## NOTES

## RELATED LINKS

[https://roberthstrand.github.io/civoShell/New-CivoNetwork.md](https://roberthstrand.github.io/civoShell/New-CivoNetwork.md)

