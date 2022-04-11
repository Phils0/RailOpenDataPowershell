param(
[string] $awsProfile,           # AWS Profile with National Rail Open Data User Darwin File Access Key
[string] $outputDir = "darwin"  # Optionally a dir path to output the downloaded file to
)

# The AWS region
$region = "eu-west-1"
# This is from the s3 url in the feed information
$bucket = "darwin.xmltimetable"
# This is the 'directory' in S3, but called bucket in the feed information
$keyPrefix = "PPTimetable/"    

Copy-S3Object -BucketName $bucket -LocalFolder $outputDir -KeyPrefix $keyPrefix -ProfileName $awsProfile -Region $region