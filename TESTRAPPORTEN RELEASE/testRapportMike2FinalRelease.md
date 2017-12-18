# Testrapport Final Release Mike2
## Stap 1: Installatie Windows Server 2016
  1. Server is correct ingesteld. Server zit in het domein red.local.
  2. We kunnen inloggen met domeinaccount RED\Administrator.
  3. Bij het gebruiken van het commando winver is te zien dat versie 'Windows Server 2016 Standaard' geïnstalleerd is.
## Stap 2: Netwerkinstellingen
  - IP-address: 172.18.2.4
  - Netmask: 255.255.255.224
  - Default Gateway: 172.18.2.1
  - DNS: 172.18.2.67 EN 172.18.2.68
  
  Deze instellingen zijn correct ingesteld en kan verbinding maken met het domein.
  ![Ipconfig](https://github.com/HoGentTIN/p3ops-red/blob/master/Mike%202%20-%20SharePoint/Test/Images/Ipconfig.png)
  
## Stap 3: Server naam en domein naam
  1. De server naam is Mike2 (correct)
  2. Server behoort tot het domein red.local (correct)
  
  ![Naam_Domein](https://github.com/HoGentTIN/p3ops-red/blob/master/Mike%202%20-%20SharePoint/Test/Images/Naam_Domein.png)
  
## Stap 4: Scripts
  1. Om te controleren of alles geinstalleerd is voeren we het script 'Roleconfig.ps1' uit. Hier zien we dat elke role 'NoChangeNeeded' terug 
  geeft. Dit wil zeggen dat alle nodige rollen geïnstalleerd zijn.
  2. Het mounten van de iso's in goed verlopen. Als je naar 'this PC' gaat zien de verschillende iso's staan.
  3. Voer prerequisitinstaller.exe uit. Elke feature geeft weer dat er geen actie ondernomen is, dus elke feature is correct geïnstalleerd.
  
  ![Prerequisites](https://github.com/HoGentTIN/p3ops-red/blob/master/Mike%202%20-%20SharePoint/Test/Images/Prerequisites.png)
## Stap 5: Sharepoint
  1. We voeren setup.exe uit van de WindowsSharePointServer2016EN.iso uit. We krijgen enkel de optie Repair en Remove te zien.
  Dus de installatie is goed verlopen.
  2. Om de server te controleren surfen we naar http://mike2:2017/. Dit lukt op de eigen server en op andere servers.
  De server is succesvol geïnstalleerd en geconfigureerd
  
![Sharepoint](https://github.com/HoGentTIN/p3ops-red/blob/master/Mike%202%20-%20SharePoint/Test/Images/Sharepoint.png)
![Site](https://github.com/HoGentTIN/p3ops-red/blob/master/Mike%202%20-%20SharePoint/Test/Images/Site.png)
