---
external help file: civoShell-help.xml
Module Name: civoShell
online version: https://github.com/roberthstrand/civoShell
schema: 2.0.0
---

# Remove-CivoNetwork

## SYNOPSIS
Delete a network.

## SYNTAX

```
Remove-CivoNetwork [[-Id] <String[]>] [[-Label] <String[]>] [<CommonParameters>]
```

## DESCRIPTION
Deletes a private network based on the ID of the network.
ID must be provided.
Can be multiple networks.

## EXAMPLES

### EXAMPLE 1
```
Remove-CivoNetwork -Id xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
```

### EXAMPLE 2
```
$Networks =(
"667a84f6-caeb-4d8b-9ba4-c122564171c5",
"d8f0f800-f2d9-4555-97b8-a3eb1b9a753c",
"9000bbed-309f-42d3-a21b-04d3dd544c93"
)
```

Remove-CivoNetwork -Id $Networks

## PARAMETERS

### -Id
The ID of the network or networks that you want to delete.
To delete several networks, you need to provide a comma separated list.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Label
{{ Fill Label Description }}

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### The parameter Id must be provided.
## OUTPUTS

### The result of the attempted deletion.
## NOTES

## RELATED LINKS

[https://github.com/roberthstrand/civoShell](https://github.com/roberthstrand/civoShell)

