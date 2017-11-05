#Computer naam wijzigen --> Niet nodig waneer je de Windows Server automatisch laat installeren met autoUnattend.xml
Rename-computer -newname ns1

#IP-adres en default gateway wijzigen
New-NetIPAddress -InterfaceAlias "Ethernet" -IPAddress "192.168.1.1" -PrefixLength 24 -DefaultGateway "192.168.1.2"
#DNS Server wijzigen
Set-DnsClientServerAddress -InterfaceAlias "Ethernet" -ServerAddresses 192.168.1.1

#Firewall uitschakelen
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False

#DC en DNS installeren en domeinnaam instellen
Install-WindowsFeature AD-Domain-Services -IncludeManagementTools
Install-ADDSForest -DomainName "red.local" -SafeModeAdministratorPassword:(ConvertTo-SecureString -String "Aa12345" -AsPlainText -Force) -DatabasePath "C:\Windows\NTDS" -DomainMode "Win2012R2" -DomainNetbiosName "RED" -ForestMode "Win2012R2" -InstallDns: $true -LogPath "C:\Windows\NTDS" -NoRebootOnCompletion: $false -SysvolPath "C:\Windows\SYSVOL" -Force: $true

#Server opnieuw opstarten
Restart-computer
