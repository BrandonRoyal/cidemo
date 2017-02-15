$ip = docker inspect cidemo_webapp_1 -f '{{.NetworkSettings.Networks.nat.IPAddress}}'
write-host $ip


$hostsPath = "$env:windir\System32\drivers\etc\hosts"
$hosts = get-content $hostsPath

$hosts | Foreach {if ($_ -match '^\s*([^#].*?\d{1,3}.*?cidemo.*)') {$null} else {$_}} | Out-File $hostsPath -enc ascii
Add-Content $hostsPath "`n$ip   cidemo"