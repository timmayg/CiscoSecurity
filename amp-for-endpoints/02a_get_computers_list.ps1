#
# Get a list of all Computers in AMP
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
$url = 'https://api.amp.cisco.com/v1/computers/'
Invoke-RestMethod -Method Get -URI $url -Headers $headers
