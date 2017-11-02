#IP-adres en default gateway wijzigen
New-NetIPAddress -InterfaceAlias "Ethernet" -IPAddress "192.168.1.2" -PrefixLength 24 -DefaultGateway "192.168.1.1"
#DNS Server wijzigen
Set-DnsClientServerAddress -InterfaceAlias “Ethernet” -ServerAddresses 192.168.0.1, 192.168.0.2

$cred = New-Object System.Management.Automation.PSCredential("red.local\Administrator",(ConvertTo-SecureString "Aa12345" -AsPlainText -Force))
Add-Computer -DomainName red.local -Credential $cred -Restart
Rename-Computer -NewName DHCPServer -Restart
