#IP-adres en default gateway wijzigen
New-NetIPAddress -InterfaceAlias "Ethernet" -IPAddress "192.168.1.2" -PrefixLength 24 -DefaultGateway "192.168.1.1"
#DNS Server wijzigen
Set-DnsClientServerAddress -InterfaceAlias "Ethernet" -ServerAddresses 192.168.1.1

#Computer naam wijzigen --> Niet nodig waneer je de Windows Server automatisch laat installeren met autoUnattend.xml
Rename-computer -newname ns2

#Firewall uitschakelen
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False

#DC en DNS installeren en domeinnaam instellen
Install-WindowsFeature AD-Domain-Services -IncludeManagementTools
Install-ADDSDomainController -CreateDNSDelegation:$false -DatabasePath 'C:\Windows\NTDS' -DomainName 'red.local' -InstallDns:$true -LogPath 'C:\Windows\NTDS' -NoGlobalCatalog:$false -SysvolPath 'C:\Windows\SYSVOL' -NoRebootOnCompletion:$true -Force:$true -Credential (New-Object System.Management.Automation.PSCredential("red.local\Administrator",(ConvertTo-SecureString "Aa12345" -AsPlainText -Force))) -SafeModeAdministratorPassword:(ConvertTo-SecureString -String "Aa12345" -AsPlainText -Force)
