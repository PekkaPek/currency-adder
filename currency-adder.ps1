$resultAs = $args[0]
$amount = @(0) * ($args.Length - 1)
$currency = @(0) * ($args.Length  - 1)

for ($i=0; $i -lt ($args.Length - 1); $i++) {
    $amount[$i] = $args[$i+1] -replace "[^0-9.]" , ''
    $currency[$i] = $args[$i+1] -replace '[^a-zA-Z-]',''
}
Write-Host "Converting the following amounts to $resultAs..."
Foreach($a in ($args | select -Skip 1)) {
    Write-Host $a
}
Write-Host "-----------------------------------------------"

[string]$apiCall = "https://api.exchangeratesapi.io/latest" + "?base=" + $resultAs
    
$exhangeRates = Invoke-RestMethod -Uri $apiCall

$totalAmount = 0
for ($i=0; $i -lt $amount.Length; $i++) {
    if( $resultAs -eq $currency[$i]) {
        $totalAmount += $amount[$i]
    } else {
        $exchangeRateFormatted = [decimal](($exhangeRates.rates | Select -ExpandProperty $currency[$i]) -replace ',','.')
        $resultCurrencyMultiplier = 1 / $exchangeRateFormatted
        $totalAmount += [decimal]$amount[$i] * $resultCurrencyMultiplier
    }
}
write-host "Amount in total is" ([math]::Round($totalAmount, 2)) "$resultAs."