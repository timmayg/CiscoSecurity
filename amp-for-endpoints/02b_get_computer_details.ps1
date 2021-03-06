#
#  Shows information about a specific computer.
#
$headers = New-Object 'System.Collections.Generic.Dictionary[[String],[String]]'
$clientid='enter-your-client-id'
$apikey='enter-your-api-key'
$base64Auth = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(("{0}:{1}" -f $clientid,$apikey))) 
$headers.Add('Authorization', 'Basic ' + $base64Auth)
$headers.Add('accept', 'application/json')
$headers.Add('Content-type', 'application/json')
$headers.Add('Accept-Encoding', 'gzip, deflate')
#
#   The connector GUID can be obtained in the AMP Console or from the API. 
#  
$connector_guid = '7244b3ea-68bd-4fff-81d8-2f08aef45220'
$url = 'https://api.amp.cisco.com/v1/computers/' + $connector_guid
Invoke-RestMethod -Method Get -URI $url -Headers $headers
