param(
[string] $user,     # Network Rail Open Data User - the user you log into the https://datafeeds.networkrail.co.uk/ website
[string] $pwd,      # User password
[string] $output    # Optionally a file path to output the downloaded CIF file to
)
 
# JSON format: https://datafeeds.networkrail.co.uk/ntrod/CifFileAuthenticate?type=CIF_ALL_FULL_DAILY&day=toc-full
# CIF format: https://datafeeds.networkrail.co.uk/ntrod/CifFileAuthenticate?type=CIF_ALL_FULL_DAILY&day=toc-full.CIF.gz

$jsonFormatUrl = "https://datafeeds.networkrail.co.uk/ntrod/CifFileAuthenticate?type=CIF_ALL_FULL_DAILY&day=toc-full";
$cifFormatUrl = "https://datafeeds.networkrail.co.uk/ntrod/CifFileAuthenticate?type=CIF_ALL_FULL_DAILY&day=toc-full.CIF.gz";
$url = $cifFormatUrl;

$pair = "$($user):$($pwd)";
$encodedCredentials = [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes($Pair));
$headers = @{ Authorization = "Basic $encodedCredentials" };

if(!($output)){
    $now = Get-Date -format "yyyyMMdd-HHmmss"
    $output = "$now.CIF.gz";
}

Invoke-WebRequest -Uri $url -Method Get -Headers $headers -OutFile $output;