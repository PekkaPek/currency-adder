$resultAs = $args[0]
$amount = @(0) * $args.Length
$currency = @(0) * $args.Length

for ($i=1; $i -le $args.Length; $i++) {
    $amount[$i-1] = $args[$i] -replace "[^0-9]" , ''
    $currency[$i-1] = $args[$i] -replace '[^a-zA-Z-]',''
}

[string]$apiCall = "https://api.exchangeratesapi.io/latest" + "?base=" + $resultAs
    
$exhangeRates = Invoke-RestMethod -Uri $apiCall

$totalAmount = 0
for ($i=0; $i -lt ($amount.Length - 1); $i++) {
    if( $resultAs -eq $currency[$i]) {
        $totalAmount += $amount[$i]
    } else {
        $totalAmount += (([int]$amount[$i]) * (1/[decimal](($exhangeRates.rates | Select -ExpandProperty $currency[$i]) -replace ',','.')))
    }
}
write-host "Amount in total is" ([math]::Round($totalAmount, 2)) "$resultAs."