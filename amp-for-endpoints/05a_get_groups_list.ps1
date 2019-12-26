#
# Provides basic information about groups in your organization. 
#    This endpoint is provided so that you can map group names to 
#    guids for filtering on the events endpoint.
#
#
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
$url = 'https://api.amp.cisco.com/v1/groups/'
Invoke-RestMethod -Method Get -URI $url -Headers $headers

