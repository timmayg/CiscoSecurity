#
# Updates group to a given windows policy
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
# Use 05a_get_groups_list.ps1 to obtain the GUID for the Group
# Use 06a_get_policies_list.ps1 to obtain the GUID for the Policy
#
$group_guid = 'f8ec3078-0294-4d8d-a583-1390c444c607'
$policy_guid = @{'windows_policy_guid' = '81fe4ec4-cbb4-43a7-9565-030d74b475fd'}
$body = ConvertTo-Json -InputObject $policy_guid

$url = 'https://api.amp.cisco.com/v1/groups/' + $group_guid 
Invoke-RestMethod -Method Patch -URI $url -Headers $headers -Body $body

