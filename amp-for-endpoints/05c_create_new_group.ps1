#
#Creates a new group, along with a group name or description.
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
#  AMP Administrator will need to replace the 'name' and 'description'
#    fields below with the desired info. 
#
$data = @{
    'name' = 'Test Group1'
    'description' = 'This is for testing'
}
#
#  We need to convert the hashtable to JSON.
#
$body = ConvertTo-JSON -InputObject $data
$url = 'https://api.amp.cisco.com/v1/groups/' 

Invoke-RestMethod -Method Post -URI $url -Headers $headers -Body $body


