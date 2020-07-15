# Powershell Scripts to access UK Rail Open Data resources
Some scripts to download various open data file resources 

The Powershell SecurityPolicy needs to relax to allow the script to run.  The easiest way to do this is to [temporarily bypass it](https://blogs.technet.microsoft.com/ken_brumfield/2014/01/19/simple-way-to-temporarily-bypass-powershell-execution-policy/)

## Network Rail Schedule Files
* `NetworkRail_Schedule_Download.ps1` 
* Parameters: user, password (from your NRE account) and optional output file path.  File downloaded is in CIF format.
* Further details can be found on the [rail open data wiki](https://wiki.openraildata.com/index.php?title=SCHEDULE). 

## National Rail DTD Files
* `NationalRail_OpenData_Download.ps1` 
* Parameters: user password (from your opendata.nationalrail.co.uk account), data file type: Timetable, Fares, RouteingGuide and optional output file path
* Further details can be found on the [rail open data wiki](https://wiki.openraildata.com/index.php?title=DTD). 

## National Rail Darwin Timetable Files
* `Darwin_Timetable_Download.ps1`
* Parameters: AWS access and secret key (from your opendata.nationalrail.co.uk account Darwin Feed File Information) and optional output file path
* Further details can be found on the [rail open data wiki](https://wiki.openraildata.com/index.php?title=Darwin:Push_Port#Timetable_and_Reference_Data)
* Has a dependency upon AWS Tools for Powershell (S3) - instructions to install can be found [here](https://docs.aws.amazon.com/powershell/latest/userguide/pstools-getting-set-up.html) 