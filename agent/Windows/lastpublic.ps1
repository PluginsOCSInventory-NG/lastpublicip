# Plugin "Get IP" OCSInventory
# Author: Valentin COSSE & Valentin DEVILLE


$myjson = Invoke-RestMethod -Uri https://ipinfo.io/json

$xml = "<LASTPUBLICIP>`n"
$xml += "<IP>" + $myjson.ip + "</IP>`n"
$xml += "<CITY>" + $myjson.city + "</CITY>`n"
$xml += "<ORG>" + $myjson.org + "</ORG>`n"
$xml += "</LASTPUBLICIP>`n"


[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
[Console]::WriteLine($xml)
