#
# Using this API, you can retrieve information about a particular policy based on policy_guid.
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
#   The policy GUID can be obtained from the API, please see 06a_get_policies_list.ps1. 
#  
$policy_guid = '8a9ae814-7441-441b-a4f8-c0f079f2aa85'
$url = 'https://api.amp.cisco.com/v1/policies/' + $policy_guid
Invoke-RestMethod -Method Get -URI $url -Headers $headers




