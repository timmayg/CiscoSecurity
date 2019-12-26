#
# Moves computer to a group with given connector_guid and group_guid
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
# Use 02a_get_computers_list.ps1 to obtain the GUID for the Computer to be moved
# Use 05a_get_groups_list.ps1 to obtain the GUID for the Group
#
$connector_guid = '2106f567-c37e-41fe-9423-e1dd064f0b79'
$group_guid = @{'group_guid' = 'f8ec3078-0294-4d8d-a583-1390c444c607'}
$body = ConvertTo-Json -InputObject $group_guid

$url = 'https://api.amp.cisco.com/v1/computers/' + $connector_guid 
Invoke-RestMethod -Method Patch -URI $url -Headers $headers



