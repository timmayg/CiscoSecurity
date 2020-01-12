#
#   Retrieve all devices or a single device for the current organization
#
$key = 'abcdefghijklmnopqrstuvwxyz'
$secret = '012345678909876543210'
$base64Auth = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(("{0}:{1}" -f $key,$secret))) 
$headers = New-Object 'System.Collections.Generic.Dictionary[[String],[String]]'
$headers.Add('Authorization', 'Basic ' + $base64Auth)
$headers.Add('accept', 'application/json')
$headers.Add('Content-type', 'application/json')
$headers.Add('Accept-Encoding', 'gzip, deflate')
#
# Replace 123456789 with your org ID. 
#  Your org ID can be obtained using 01a_Get-Organizations.ps1
#
$url = 'https://management.api.umbrella.com/v1/organizations/123456789/networkdevices'
$response = Invoke-RestMethod -Method Get -URI $url -Headers $headers
$json = $response | ConvertTo-Json
Write-Host $json


