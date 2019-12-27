#
#  Fetch a specific computer's trajectory with given connector_guid 
#    and filter for events with user name activity
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
#   The userid is a user on the computer.
#   The connector GUID can be obtained in the AMP Console or from the API. 
#  
$userid = 'johndoe'
$connector_guid = '7244b3ea-68bd-4fff-81d8-2f08aef45220'
$url = 'https://api.amp.cisco.com/v1/computers/' + $connector_guid + '/user_trajectory?q=' + $userid + '&limit=5'
Invoke-RestMethod -Method Get -URI $url -Headers $headers



