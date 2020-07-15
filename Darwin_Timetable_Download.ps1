param(
[string] $profile,              # AWS Profile with National Rail Open Data User Darwin File Access Key
[string] $outputDir = "darwin"  # Optionally a dir path to output the downloaded file to
)

# The AWS region
$region = "eu-west-1"
# This is from the s3 url in the feed information
$bucket = "darwin.xmltimetable"
# This is the 'directory' in S3, but called bucket in the feed information
$keyPrefix = "PPTimetable/"    

$objects = Get-S3Object -BucketName $bucket -KeyPrefix $keyPrefix -ProfileName $profile -Region $region

foreach($object in $objects) {
    $localFileName = $object.Key -replace $keyPrefix, ''
    if ($localFileName -ne '') {
        $localFilePath = Join-Path -Path $outputDir -ChildPath $localFileName
        Copy-S3Object -BucketName $bucket -Key $object.Key -LocalFile $localFilePath -ProfileName $profile -Region $region
    }
}