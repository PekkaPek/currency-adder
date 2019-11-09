$resultAs = $args[0]
$amount = @(0) * $args.Length
$currency = @(0) * $args.Length

for ($i=1; $i -le $args.Length; $i++) {
    $amount[$i-1] = $args[$i] -replace "[^0-9]" , ''
    $currency[$i-1] = $args[$i] -replace '[^a-zA-Z-]',''
}

[string]$apiCall = "https://api.exchangeratesapi.io/latest" + "?base=" + $resultAs
    
Invoke-RestMethod -Uri $apiCall