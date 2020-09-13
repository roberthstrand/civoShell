---
external help file: civoShell-help.xml
Module Name: civoShell
online version: https://roberthstrand.github.io/civoShell/Set-CivoApiToken.md
schema: 2.0.0
---

# Set-CivoApiToken

## SYNOPSIS
Set the API key needed to use civoShell.

## SYNTAX

```
Set-CivoApiToken [-ApiKey] <String> [-Force] [<CommonParameters>]
```

## DESCRIPTION
civoShell is working towards the API for the Civo cloud platform, and authenticates with an API token key.
This can be found at https://civo.com/api.

Using this cmdlet will create and set the environment variable CivoToken which is the basis for all API calls.
If this key is compromised, you would have to regenerate the key at https://civo.com/api.

## EXAMPLES

### EXAMPLE 1
```
Set-CivoApiToken -ApiKey tN5fRvmdxkpQtSr7dBlWC1OuU1seF3KlGa1YzzvEvp8bkpQfl2
```

## PARAMETERS

### -ApiKey
The API key from Civo.

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

### -Force
If you have a key set, you can use the switch -force to set a new key.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### ApiKey is mandatory.
## OUTPUTS

### Information that they key is set, or a warning if a key is already present.
## NOTES

## RELATED LINKS

[https://roberthstrand.github.io/civoShell/Set-CivoApiToken.md](https://roberthstrand.github.io/civoShell/Set-CivoApiToken.md)

