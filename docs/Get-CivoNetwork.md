---
external help file: civoShell-help.xml
Module Name: civoShell
online version: https://github.com/roberthstrand/civoShell
schema: 2.0.0
---

# Get-CivoNetwork

## SYNOPSIS
Lists private networks.

## SYNTAX

```
Get-CivoNetwork [[-Id] <String[]>] [[-Label] <String[]>] [<CommonParameters>]
```

## DESCRIPTION
Lists all private networks, as well as filtered by ID and label.

## EXAMPLES

### EXAMPLE 1
```
Get-CivoNetwork
```

### EXAMPLE 2
```
Get-CivoNetwork -Id 1e644b7c-80e5-412b-a26b-a1e0e6215ced
```

### EXAMPLE 3
```
$Networks =(
"1e644b7c-80e5-412b-a26b-a1e0e6215ced",
"393197c5-f409-499d-8958-601e33922c08"
)
```

Get-CivoNetwork -Id $Networks

### EXAMPLE 4
```
Get-CivoNetwork -Label "prod-*"
```

### EXAMPLE 5
```
$Networks =(
"prod-client01",
"prod-client02"
)
```

Get-CivoNetwork -Label $Networks

## PARAMETERS

### -Id
{{ Fill Id Description }}

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Label
{{ Fill Label Description }}

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None, ID or Label.
## OUTPUTS

### Object with information about the private networks.
## NOTES

## RELATED LINKS

[https://github.com/roberthstrand/civoShell](https://github.com/roberthstrand/civoShell)

