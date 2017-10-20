# DISCLAIMER: _THIS IS A WORK IN PROGRESS, AND THEREFORE ONLY MEANT AS A DRAFT_

***


# User manual

### user manual (poging Bram 02/10/2017):

- op virtualbox aanmaken Lima2 met window server 2016 met 2 processoren aan 2048 Mb ram, schijfruimte 32Gb, dynamisch gealloceerd;
- 2de hdd aangemaakt met 50Gb
- 2 netwerkkaarten: 1 NAT, 1 intnet;

- partitie aanmaken

- admin account met wachtwoord: Admin123

- add role and services dfs namespaces & dfps replication (onder file and storage services)
- onder mmc computer management>storage>disk management: instellen partities volgens tabel 3.1

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
- bestand- en opslagservices shares selecteren, start wizard nieuwe share, smb snel, share locatie D:, Sharenaam "VerkoopData", extern pad: "\\WIN-TPNTL1C3H68\VerkoopData"
- caching van share toestaan, gegevenstoegang versleutelen 
- machtigingen aanpassen
       
***


#### randnotities voor later (manual execution) 

add roles and features, file server resource manager
tools>file server resource manager
quota management>quota
rightclick>create quota in Disk of choice, limit,   
create subfolder in disk
create quote for subfolder
bepaalde soorten files blocken in file screen management?

#### randnotities automation
add-*vm*
add-vmharddiskdrive ?
