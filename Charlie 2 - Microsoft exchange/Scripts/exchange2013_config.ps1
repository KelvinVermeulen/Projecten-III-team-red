#Deze script moet uitgevoerd worden in de Exchange Management Shell
#Maar kan ook in de gewone Powershell uitgevoerd worden als volgende SnapIn geïnstalleerd wordt

#Add-PSSnapin microsoft-exhcange.management.powershell.snapin
#Add-PSSnapin microsoft-exhcange.management.powershell.setup
#Add-PSSnapin microsoft-exhcange.management.powershell.support

#Elke bestaande user krijgt een mailbox.

Get-User | Where-Object {$_.RecipientType -eq "User"} | ForEach-Object {Enable-Mailbox -Identity $_.Name}
