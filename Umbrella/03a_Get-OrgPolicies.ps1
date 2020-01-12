#
#   Get's a list of the Organizations in the Umbrella Portal
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
#  Replace 123456789 in the $url with your own Org ID. 
#  You can obtain your Org ID two ways.
#  1. Use the script in this repository 01a_Get-Organizations.ps1
#  2. Look at the URL in your Umbrella Dashboard
#
$url = 'https://management.api.umbrella.com/v1/organizations/123456789/policies'
$response = Invoke-RestMethod -Method Get -URI $url -Headers $headers
$json = $response | ConvertTo-Json
Write-Host $json


