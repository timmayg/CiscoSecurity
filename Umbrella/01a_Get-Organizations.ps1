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
$url = 'https://management.api.umbrella.com/v1/organizations'
$response = Invoke-RestMethod -Method Get -URI $url -Headers $headers
$json = $response | ConvertTo-Json
Write-Host $json


