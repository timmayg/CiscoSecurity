#
# Returns a list of policies. You can filter this list by name and product.
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

$url = 'https://api.amp.cisco.com/v1/policies/' 
#Invoke-RestMethod -Method Get -URI $url -Headers $headers

$response = Invoke-RestMethod -Method Get -URI $url -Headers $headers
Write-Host $response.data

