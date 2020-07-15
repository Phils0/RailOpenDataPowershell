param(
[string] $accessKey,                # National Rail Open Data User Darwin File Access Key
[string] $secretKey,                # National Rail Open Data User Darwin File Secret Key
[string] $outputDir = "locations"   # Optionally a dir path to output the downloaded file to
)

# https://wiki.openraildata.com/index.php?title=Locations_PoC
$region = "eu-west-1"
$bucket = "nrdp-v16-logs"
$keyPrefix = "mdm/"

$objects = Get-S3Object -BucketName $bucket -KeyPrefix $keyPrefix -AccessKey $accessKey -SecretKey $secretKey -Region $region

foreach($object in $objects) {
    $localFileName = $object.Key -replace $keyPrefix, ''
    if ($localFileName -ne '') {
        $localFilePath = Join-Path -Path $outputDir -ChildPath $localFileName
        Copy-S3Object -BucketName $bucket -Key $object.Key -LocalFile $localFilePath -AccessKey $accessKey -SecretKey $secretKey -Region $region
    }
}