# DISCLAIMER: _THIS IS A WORK IN PROGRESS, AND THEREFORE ONLY MEANT AS A DRAFT_

***


# User manual

### User manual (poging Cedric 08/10/2017):

- install hyper-V op de pc waarop je werkt (win 10 pro nodig)
- voer in powershell uit: Enable-WindowsOptionalFeature -Online -FeatureName:Microsoft-Hyper-V -All
- ~~add new generation 2 vm: Lima2_win_ser_2016 with 2048MB startup memory~~
- ~~add virtual harddisk Lima2_win_ser_2016_disk1 with 50GB~~
- ~~use code: GN8DC-F98HQ-T9893-TTGW6-RRHYF code~~
- run the script below with powershell as an admin by typing: .\lima2_deployment_script.ps1 (obviously change the names/paths accordingly)
(manueel verder 16/10/2017)
- start hyper-v en ga naar de settings van de aangemaakte vm (eerst vm afsluiten)
- add nog een harddrive in ide controller 0
- maak voor deze een virtuele harddisk aan (format: VHDX, type: Dynamic, name: Disk2, location: C:\HyperV\Lima2_WinSer2016\, size: 100Gb, )  
- stel in, taal: nederlands(belgiê) keyboardlayouy: belgisch (komma)
- administrator wachtwoord: Admin123
- log in met Administrator, pw:Admin123 
- Dvd station uitwerpen en veranderen naar Q
- Systeempartities schijf 1 : 
	- C: 32 gb System 
	- D: 33 gb verkoopData
	- E: 35 gb OntwikkelingData
-Systeempartities schijf 0 : 
	- F: 20 gb ITData  (Schijf formateren en zo naam toewijzen)
	- G: 20 gb DirData 
	- H: 20 gb AdminData
	- Y: 20 gb HomeDirs
	- Z: 20 gb ProfileDirs
- in dashboard: add roles and features. File server (bestand server) selecteren + bestandserver bronbeheer en installeren
  ## Install-windowsFeature -Name <>
 - add roles and features, file server resource manager
- virtual switch manager, switch 5 external network (ethernet adapter) instellen (op vlan 300?)
- ip adressen instellen op 172.18.2.3 met subnet automatisch, en default gateway 172.18.2.67
- workgroup aanpassen zodat je red.local joined met Administrator & Aa12345
- bestand- en opslagservices shares selecteren, start wizard nieuwe share, smb snel, share locatie D:, Sharenaam "VerkoopData", extern pad: "\\Lima2\VerkoopData" (wordt automatisch gedaan)
- caching van share toestaan, gegevenstoegang versleutelen 
- machtigingen aanpassen (bv, nieuwe share VerkoopData met IT administratie met full control en Verkoop met lees- en schrijfrechten
- in VerkoopData een map "ShareVerkoop" aanmaken
- rightclick op de folder, en in de tab "Delen" click je op delen (via geavanceerd moet je it administratie op full control zetten)
- om te testen moet je inloggen met Lien.Smet en Aa12345 , maar dit kan nog niet door de roam
- quotas
       
***


#### randnotities voor later (manual execution) 
- tools>file server resource manager
- quota management>quota
- rightclick>create quota in Disk of choice, limit,   
- create subfolder in disk
- create quote for subfolder
- bepaalde soorten files blocken in file screen management?


#### randnotities automation
- zie links file shares & quotas with powershell
- C:\> Get-FsrmQuota -Path "d:\www\example.com"
- PS C:\> Set-FsrmQuota -Path "d:\www\example.com" -Size 4.5GB
- D:\www> Get-FsrmQuota
- 

#### netwerkinformatie
- ip: 172.18.2.3
- subnetmask: 255.255.255.224
- default gateway: 172.18.2.1
