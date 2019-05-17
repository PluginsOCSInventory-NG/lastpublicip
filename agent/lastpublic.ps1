# Plugin "Get IP" OCSInventory
# Author: Valentin COSSE & Valentin DEVILLE


$myjson = Invoke-RestMethod -Uri https://www.ipinfo.io/json

$xml = '<LASTPUBLICIP>'
$xml += '<IP>' + $myjson.ip + '</IP>'
$xml += '<CITY>' + $myjson.city + '</CITY>'
$xml += '<ORG>' + $myjson.org + '</ORG>'
$xml += '</LASTPUBLICIP>'


[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
[Console]::WriteLine($xml)
