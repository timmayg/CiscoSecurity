#
# Returns a particular group. Use group_guid to get 
#   information about a particular group.
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
#
$group = '5cdf70dd-1b14-46a0-be90-e08da14172d8'
$url = 'https://api.amp.cisco.com/v1/groups/' + $group
Invoke-RestMethod -Method Get -URI $url -Headers $headers
