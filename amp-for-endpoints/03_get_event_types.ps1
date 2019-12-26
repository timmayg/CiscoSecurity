#
# Events are identified and filtered by a unique ID, This endpoint
#   provides a human readable name, and short description of each event by ID.
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
$url = 'https://api.amp.cisco.com/v1/event_types' 
Invoke-RestMethod -Method Get -URI $url -Headers $headers



