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
- ~~add new generation 1 vm: Lima2_win_ser_2016 with 2048MB startup memory~~
- ~~add virtual harddisk Lima2_win_ser_2016_disk1 with 50GB~~
- ~~use code: GN8DC-F98HQ-T9893-TTGW6-RRHYF code~~
- run the script below with powershell as an admin (obviously change the names/paths accordingly)
-`New-VM -Name Lima2_WinSer2016
       -Path "C:\Users\theso\Desktop\Super Phun Thyme\2017-2018\Projecten III\p3ops-red\Lima 2 - Interne File Server"
       -NewVHDPath "C:\Users\theso\Desktop\Super Phun Thyme\2017-2018\Projecten III\p3ops-red\Lima 2 - Interne File Server"
       -NewVHDSizeBytes 50GB `
       -Generation 1
       -MemoryStartupBytes 2GB `
       ~~-SwitchName NotSureYet`~~ 
       
       ▲ dit laten staan
       
       ▼ hierop kunt ge wa uitproberen :p 
       
       `New-VM -Name Lima2_WinSer2016
       -Path "C:\Users\theso\Desktop\Super Phun Thyme\2017-2018\Projecten III\p3ops-red\Lima 2 - Interne File Server"
       -NoVHD
       -NewVHDSizeBytes 50GB `
       -Generation 1
       -MemoryStartupBytes 2GB `
       
       
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

SwitchName: switch name where the network adapter will be connected