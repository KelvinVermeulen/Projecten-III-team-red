# **Testplan Mike2**

## Stap 1: Installatie Windows Server 2016

### GUI
1. Start de server `Mike2`
2. Log in met de gebruiker;
	- **Account name:** _RED/Administrator_
	- **Paswoord:** Aa12345
3. Open *Server Manager* indien dat niet automatisch gebeurt is. Dit doe je door naar de startmenu te gaan en daar op *Server Manager* te klikken.
4. Nadat *Server Manager* geopend is, klik op *Local Server* dat je links in de pagina terug kan vinden.
5. Controleer of het *Operating system version* op `Windows Server 2016 Standard` staat.

### CMD
1. Start de server `Mike2`
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
1. Start de server `Mike2`
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
- IP-address: 172.18.2.4
- Netmask: 255.255.0.0
- Default Gateway: 172.18.2.1
- DNS: 172.18.2.67 OF 172.18.2.68

### CMD
1. Start de server `Mike2`
2. Log in met de gebruiker;
	- **Account name:** _RED/Administrator_
	- **Paswoord:** Aa12345
3. Open *Command Prompt*
	1. Klik op de windowstoets;
	2. type `cmd` en druk op enter;
4. Type `ipconfig` en druk op enter.
5. Het IP-adres moet als volgt geconfigureerd zijn: 
- IP-address: 172.18.2.4
- Netmask: 255.255.0.0
- Default Gateway: 172.18.2.1
- DNS: 172.18.2.67 OF 172.18.2.68

## Server naam en domein naam

### GUI
1. Start de server `Mike2`
2. Log in met de gebruiker;
	- **Account name:** _RED/Administrator_
	- **Paswoord:** Aa12345
3. Open *Server Manager* indien dat niet automatisch gebeurt is. Dit doe je door naar de startmenu te gaan en daar op *Server Manager* te klikken.
4. Nadat *Server Manager* geopend is, klik op *Local Server* dat je links van de pagina terug kan vinden.
5. Controleer of de *Computer Name* op **Mike2** en het *Domain* op **red.local** staat.

### CMD
1. Start de server `Mike2`
2. Log in met de gebruiker;
	- **Account name:** _RED/Administrator_
	- **Paswoord:** Aa12345
3. Open *Command Prompt*
	1. Klik op het vergrootglas in de taakbalk;
	2. type `cmd` en druk op *enter*;
4. Type `HOSTNAME` en druk op *enter*;
5. Indien er **Mike2** verschijnt, is de naam goed geconfigureerd.
5. Type `wmic computersystem get domain` en druk op *enter*;
6. Indien er **red.local** verschijnt, is dat ook goed geconfigureerd.

## Sharepoint
1. Start de server `Mike2`
2. Log in met de gebruiker;
	- **Account name:** _RED/Administrator_
	- **Paswoord:** Aa12345
3. Open een internetbrowser;
4. Surf naar `http://mike2:30281/`;
5. Als je hier de SharePoint GUI krijgt, wilt het zeggen dat alles succesvol geïnstalleerd is;


