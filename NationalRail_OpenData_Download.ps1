param(
[string] $user,     # National Rail Open Data User - the user you log into the  https://opendata.nationalrail.co.uk/ website
[string] $pwd,      # User password
[string] $dataType,  # Data to download: Timetable, Fares, RouteingGuide
[string] $outputDir = "timetable"   # Optionally a dir path to output the downloaded file to
)
 
$getTokenUrl = "https://opendata.nationalrail.co.uk/authenticate";
$dataUrls = @{
    Fares = "https://opendata.nationalrail.co.uk/api/staticfeeds/2.0/fares"
    RouteingGuide = "https://opendata.nationalrail.co.uk/api/staticfeeds/2.0/routeing"
    Timetable = "https://opendata.nationalrail.co.uk/api/staticfeeds/3.0/timetable"
};

# Get a token
$encoded= [System.Web.HttpUtility]::UrlEncode($pwd);
$body = "username=$($user)&password=$($encoded)";
$headers = @{ Accept = "application/json" };
$response = Invoke-RestMethod -Uri $getTokenUrl -Method Post -Headers $headers -Body $body;

# Get the data
$url = $dataUrls[$dataType];
$headers = @{ 
    'X-Auth-Token' = $response.token 
};

$download =  Invoke-WebRequest -Uri $url -Method Get -Headers $headers;

$fileHeader = $download.Headers["Content-Disposition"];
$match = $fileHeader | Select-String -Pattern '\"(.+)\"';
$filename = Join-Path -Path $outputDir -ChildPath $match.Matches[0].Groups[1].Value;
[System.IO.File]::WriteAllBytes($fileName, $download.content)
