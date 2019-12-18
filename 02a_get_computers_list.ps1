#
#  Here we will get a list of all the Computers in AMP for Endpoints and their specifics.
#
$headers = New-Object 'System.Collections.Generic.Dictionary[[String],[String]]'
$headers.Add('Authorization', 'Basic ZjU3NGI4Y2M5ZDkyMzBhOTY3NzQ6MDg1MDM1MzYtOGE4Zi00ZTI2LWIxN2UtM2YwMmQyOTNkMzFk')
$headers.Add('accept', 'application/json')
$headers.Add('Content-type', 'application/json')
$headers.Add('Accept-Encoding', 'gzip, deflate')
#
$url = 'https://api.amp.cisco.com/v1/computers/'
$response = Invoke-RestMethod -Method Get -URI $url -Headers $headers
#
#   The $response output may be hard to deal with so we can easilly change it to JSON 
#     where it will be easier to manage. 
#
$respobj = $response.data | Select-Object -Property * | ConvertTo-Json  

Write-Host $respobj


