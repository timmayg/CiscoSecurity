#
#  AMP for Endpoints API requires a Client ID and an API Key.
#  AMP for Endpoints API Authorization supports a Base64 hash of these two keys.
#  Here we will hash them together using Powershell. 
#
#  At this time you can check this website to assure PS is converting the strings correctly.
#    https://www.base64encode.org/
#

$clientid='enter-your-client-id'
$apikey='enter-your-api-key'
$base64Auth = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(("{0}:{1}" -f $clientid,$apikey))) 

Write-Host $base64Auth

