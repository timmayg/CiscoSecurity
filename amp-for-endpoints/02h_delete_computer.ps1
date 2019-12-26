#
# Deletes a specific computer with given connector_guid
#
$headers = New-Object 'System.Collections.Generic.Dictionary[[String],[String]]'
$clientid = 'enter-your-client-id'
$apikey = 'enter-your-api-key'
$base64Auth = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(("{0}:{1}" -f $clientid,$apikey))) 
$headers.Add('Authorization', 'Basic ' + $base64Auth)
$headers.Add('accept', 'application/json')
$headers.Add('Content-type', 'application/json')
$headers.Add('Accept-Encoding', 'gzip, deflate')
#
#
$connector_guid = '2106f567-c37e-41fe-9423-e1dd064f0b79'
$url = 'https://api.amp.cisco.com/v1/computers/' + $connector_guid 

Invoke-RestMethod -Method Delete -URI $url -Headers $headers


