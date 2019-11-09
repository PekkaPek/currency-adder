Param(
    [Parameter(Position=1)]
    [string]$resultAs
)

[string]$apiCall = "https://api.exchangeratesapi.io/latest" + "?base=" + $resultAs

Invoke-RestMethod -Uri $apiCall