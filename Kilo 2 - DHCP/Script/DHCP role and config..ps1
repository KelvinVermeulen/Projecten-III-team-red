Add-WindowsFeature -IncludeManagementTools dhcp
netsh dhcp add securitygroups
Restart-service dhcpserver
Add-DhcpServerInDC DHCPServer 172.18.2.2