$cred = New-Object System.Management.Automation.PSCredential("red.local\Administrator",(ConvertTo-SecureString "Aa12345" -AsPlainText -Force))
Add-Computer -DomainName red.local -Credential $cred -Restart
Rename-Computer -NewName DHCPServer -Restart
