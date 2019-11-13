# Currency Converter

This PowerShell script converts the provided amounts to the target currency.

## Usage

1. Open Powershell
2. Enable running scripts with command: `powershell.exe -ExecutionPolicy bypass`
2. Copy script file location
3. Run script in PowerShell: `powershell "[script file location]" [parameters]`

## Parameters

Put target currency as the first parameter.

Put amounts to be converted as the next parameters. Use dot character as decimal separator.

Example
```
EUR 40.50USD 60SEK 1000JPY
```

Example output
```
Converting the following amounts to EUR...
40.50USD
60SEK
1000JPY
-----------------------------------------------
Amount in total is 50,59 EUR.
```

## Supported currencies
The script is based on [Foreign exchange rates API](http://exchangeratesapi.io/). See currently [supported currencies](http://exchangeratesapi.io/).