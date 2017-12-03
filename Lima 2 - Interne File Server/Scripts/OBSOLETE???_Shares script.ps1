#Instal WMI module
Get-WmiObject -Class __Namespace -Namespace root `
  -Filter "name='WMI'"
  
#Testen of path al bestaat voor share
Test-Path D:\VerkoopData

#Folder aanmaken
New-Item D:\VerkoopData\VerkoopDataShare -Type Directory

#Controleren of folder een share is
Get-WmiObject Win32_Share `
  -Filter "path='D:\\VerkoopData\\VerkoopDataShare'"

#Share maken van folder (0 is voor diskDrive)
(Get-WmiObject Win32_Share -List).Create
  (
    "D:\VerkoopData\VerkoopDateShare", "VerkoopDateShare", 0
  )
  
