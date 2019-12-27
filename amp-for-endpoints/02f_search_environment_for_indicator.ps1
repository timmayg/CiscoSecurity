#
#   This endpoint provides you with the ability to search 
#      all computers across your organization for any events 
#      or activities associated with a file or network operation, 
#      and returns computers matching that criteria. You can then 
#      query the /computers/{connector-guid}/trajectory endpoint 
#      for specific details.
#
#
$headers = New-Object 'System.Collections.Generic.Dictionary[[String],[String]]'
$clientid='enter-your-client-id'
$apikey='enter-your-api-key'
$base64Auth = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(("{0}:{1}" -f $clientid,$apikey))) 
$headers.Add('Authorization', 'Basic ' + $base64Auth)
$headers.Add('accept', 'application/json')
$headers.Add('Content-type', 'application/json')
$headers.Add('Accept-Encoding', 'gzip, deflate')
#
#
# Several events or activities can be queried. 
#
# Fetch list of computers that have observed files with given file name
# $query = 'sovereutilizeignty.com'
# 
# Fetch list of computers that have observed files with given SHA-256 value
# $query = '814a37d89a79aa3975308e723bc1a3a67360323b7e3584de00896fe7c59bbb8e'
#
# Fetch a list of computers that have connected to given IP address
# $query = '75.102.25.76'
#
# Fetches list of computers that have connected to given URL
# $query = 'SearchProtocolHost.exe'
#
$url = 'https://api.amp.cisco.com/v1/computers/activity?q=' + $query
Invoke-RestMethod -Method Get -URI $url -Headers $headers



