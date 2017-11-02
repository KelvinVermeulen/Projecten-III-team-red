Write-Host 'Computernaam wijzigen'
#Change Name
Get-WmiObject win32_ComputerSystem
$ComputerName = Get-WmiObject win32_ComputerSystem
$name = "November2"
$ComputerName.Rename($name)

Write-Host 'IP addres geven'
#IP configuration
New-NetIPAddress -InterfaceAlias Ethernet -IPAddress 172.18.2.5 -DefaultGateway 172.18.2.1 -PrefixLength 27
Set-DnsClientServerAddress -InterfaceAlias Ethernet -ServerAddresses 172.18.2.67, 172.18.2.67