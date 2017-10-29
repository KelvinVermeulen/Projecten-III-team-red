#Computer naam wijzigen
Rename-computer -newname ns1

#IP adres wijzigen
$ipaddress = "192.168.1.1"
$dnsaddress = "192.168.1.1"
New-NetIPAddress -InterfaceAlias Ethernet -IPAddress $ipaddress -AddressFamily IPv4 -PrefixLength 24
Set-DnsClientServerAddress -InterfaceAlias Ethernet -ServerAddresses $dnsaddress
Restart-computer

#DC en DNS installeren en domeinnaam instellen
Install-WindowsFeature AD-Domain-Services -IncludeManagementTools
Install-ADDSForest -DomainName red.local
