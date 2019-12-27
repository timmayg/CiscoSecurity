#
# Converts an existing group to a child of another group or an 
#   existing child group to a root group (that is, one with no parent groups).
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
$child_group_guid = '589b9523-da99-4851-bcd0-9b6af1c6f477'
$parent_group_guid = @{'parent_group_guid' = 'f8ec3078-0294-4d8d-a583-1390c444c607'}
$body = ConvertTo-Json -InputObject $parent_group_guid

$url = 'https://api.amp.cisco.com/v1/groups/' + $child_group_guid + '/parent'
Invoke-RestMethod -Method Patch -URI $url -Headers $headers




