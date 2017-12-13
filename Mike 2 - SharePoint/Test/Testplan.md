 # **Testplan Mike2**
 
 ## Stap 1: Installatie Windows Server 2016
 
 ### GUI
 1. Start de server `Mike2`;
 2. Log in met de gebruiker;
 	- **Account name:** _RED/Administrator_
 	- **Paswoord:** Aa12345
 3. Open *Server Manager*;
 4. Klik op *Local Server* dat je linksbovenaan op de pagina terug kan vinden;
 5. Controleer of het *Operating system version* op `Windows Server 2016 Standard` staat;
 
 ### CMD
 1. Start de server `Mike2`;
 2. Log in met de gebruiker;
 	- **Account name:** _RED/Administrator_
 	- **Paswoord:** Aa12345
 3. Open *Command Prompt*
 	1. Klik op de windowstoets;
 	2. type `cmd` en druk op *enter*;
 4. Type `winver` en druk op *enter*;
 5. Controleer of het *Operating system version* op `Windows Server 2016 Standard` staat.
 
 ## Stap 2: Netwerkinstellingen
 ### GUI
 1. Start de server `Mike2`;
 2. Log in met de gebruiker;
 	- **Account name:** _RED/Administrator_
 	- **Paswoord:** Aa12345
 3. Klik op de windowstoets;
 4. Type 'instellingen';
 5. Klik op 'Netwerk en Internet';
 6. Klik op 'Adapteropties wijzigen';
  7. Rechtsklik op de Ethernet adapter en kies eigenschappen;
  8. Klik op de optie 'Internet Protocol versie 4 (TCP/IPv4) en kies eigenschappen;
  9. Het IP-adres moet als volgt geconfigureerd zijn: 
 -- IP-address: 172.18.2.4
 -- Netmask: 255.255.0.0
 - IP-address: 172.18.0.12
 - Netmask: 255.255.255.0
  - Default Gateway: 172.18.2.1
  - DNS: 172.18.2.67 OF 172.18.2.68
  
 ### CMD
 1. Start de server `Mike2`;
 2. Log in met de gebruiker;
 	- **Account name:** _RED/Administrator_
 	- **Paswoord:** Aa12345
 3. Open *Command Prompt*
 	1. Klik op de windowstoets;
  	2. type `cmd` en druk op enter;
  4. Type `ipconfig` en druk op enter;
  5. Het IP-adres moet als volgt geconfigureerd zijn: 
 -- IP-address: 172.18.2.4
 -- Netmask: 255.255.0.0
 +- IP-address: 172.18.0.12
 +- Netmask: 255.255.255.0
  - Default Gateway: 172.18.2.1
  - DNS: 172.18.2.67 OF 172.18.2.68
  
 ## Server naam en domein naam
 
 ### GUI
 1. Start de server `Mike2`;
 2. Log in met de gebruiker;
 	- **Account name:** _RED/Administrator_
 	- **Paswoord:** Aa12345
 3. Open *Server Manager*;
 4. Klik op *Local Server* dat je linksbovenaan op de pagina terug kan vinden;
 5. Controleer of de *Computer Name* op **Mike2** en het *Domain* op **red.local** staat;
 
 ### CMD
 1. Start de server `Mike2`;
 2. Log in met de gebruiker;
 	- **Account name:** _RED/Administrator_
 	- **Paswoord:** Aa12345
 3. Open *Command Prompt*
 	1. Klik op het vergrootglas in de taakbalk;
 	2. type `cmd` en druk op *enter*;
 4. Type `HOSTNAME` en druk op *enter*;
 5. Indien er **Mike2** verschijnt, is de naam goed geconfigureerd;
 5. Type `wmic computersystem get domain` en druk op *enter*;
 6. Indien er **red.local** verschijnt, is dat ook goed geconfigureerd;
 
 ## Scripts
 ### Roleconfig
 1. Start de server `Mike2`;
 2. Log in met de gebruiker;
 	- **Account name:** _RED/Administrator_
 	- **Paswoord:** Aa12345
 3. Voer het script `1_roleconfig.ps1` uit;
 4. Als er overal _NoChangeNeeded_ staat zijn alle roles correct ge�nstalleerd;
 
 ### Mounting ISO's
 1. Start de server `Mike2`;
 2. Log in met de gebruiker;
 	- **Account name:** _RED/Administrator_
 	- **Paswoord:** Aa12345
 3. Voer het script `Add DvdDrives.ps1` uit;
 4. Open Windows Verkenner en alle drives moeten gemount zijn;
 
 ### Prerequisitinstaller
 1. Start de server `Mike2`;
 2. Log in met de gebruiker;
 	- **Account name:** _RED/Administrator_
 	- **Paswoord:** Aa12345
 3. Voer de Prerequisitinstaller op `WindowsSharePointServer2016EN.iso` uit;
 4. Bij alle prerequisits moet er `Already Installed` staan;
 5. Hieraan kan je zien dat alle prerequisits correct ge�nstalleerd zijn;
 
 ## Sharepoint
 ### Setup
 1. Start de server `Mike2`;
 2. Log in met de gebruiker;
 	- **Account name:** _RED/Administrator_
 	- **Paswoord:** Aa12345
 3. Voer de Setup.exe op `WindowsSharePointServer2016EN.iso` uit;
 4. Wanneer je enkel de opties _Repair_ en _Remove_ krijgt, wilt het zeggen dat SharePoint volledig en correct ge�nstalleerd is.
 
 ### Server
 1. Start de server `Mike2`;
 2. Log in met de gebruiker;
 	- **Account name:** _RED/Administrator_
 	- **Paswoord:** Aa12345
 3. Open een internetbrowser;
 4. Surf naar `http://mike2:30281/`;
 5. Als je hier de SharePoint GUI krijgt, wilt het zeggen dat de server succesvol ge�nstalleerd en geconfigureerd is;