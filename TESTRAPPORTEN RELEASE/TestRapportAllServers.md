# Verzameling van alle Testrapporten

### Alfa2

### Bravo2

### Charlie2

# Testplan Charlie2
## Testrapport_Prerequ
**Alles werkt, behalve de eerste, want die is blijkbaar niet meer nodig.**
![Prerequ](Afbeeldingen_Testrapport/Prerequ_1.PNG)
## Testrapport_Extractie
**De extractie is succesvol.**
![Extractie](Afbeeldingen_Testrapport/Extractie.PNG)
## Testrapport_Mail_Sturen
**We ontvangen mails van zowel green.local alsook van red.local.**
![Ontvangen](Afbeeldingen_Testrapport/Mail_ontvangen.PNG)
**We kunnen mails naar zowel green.local alsook red.local sturen.**
![Sturen](Afbeeldingen_Testrapport/Mail_sturen.PNG)
## Testrapport_Configuratie
**We kunnen inloggen met administrator op OWA.**
![Admin](Afbeeldingen_Testrapport/Admin.PNG)
**We kunnen inloggen met een gebruiker op OWA.**
![Gebruiker](Afbeeldingen_Testrapport/Gebruiker.PNG)
**We kunnen inloggen met administrator op ECP.**
![Admin](Afbeeldingen_Testrapport/ECP.PNG)

### Kilo2

# Final Testrapport Kilo2

## IP-configuratie
	
- Controleer IP configuratie van de DHCP server(Kilo2)


	` `
	IP-adres: 172.18.2.2
	Subnetmask: 255.255.255.224
	Default-Gateway: 172.18.2.1
	DNS: 172.18.2.67 en 172.18.2.68

## IP-configuratie bij nieuwe client

- Een nieuwe client moet een ip-adres binnen deez range toegekend worden


	IP-adres: 172.18.2.50 - 172.18.2.100
	Subnetmask: 255.255.255.224

- Ip config voor verbinding met DHCP server(Kilo2)

![](https://i.imgur.com/dklyZfe.png)

- Ip config na het verbinden met DHCP server(Kilo2)

![](https://i.imgur.com/dklyZfe.png))


- SUCCESVOL

### Lima2

# Testrapport Final Week Lima2
1. Stappenplan voor het installatie van FileServer is goed geschreven. Zonder enige kennis kon ik het uitvoeren.

2. Er is ingelogd met alle users binnen het domein. Na het inloggen was de shares zichtbaar zoals het moest.

3. De quotoms zijn goed ingesteld.<br>
![](https://github.com/HoGentTIN/p3ops-red/blob/master/Lima%202%20-%20Interne%20File%20Server/QuotaAndPartitions.png)

4. Shadowcopy werd manueel aangemaakt.<br>
![](https://github.com/HoGentTIN/p3ops-red/blob/master/Lima%202%20-%20Interne%20File%20Server/ShadowCopy.png)


### Oscar2
# Testrapport

### Dependencies:

- HyperV geïnstalleerd

## Stap 1: Start de server op in Hyper-V
* Ik ben als Administrator succesvol ingelogd.
* Het controlpaneel van PRTG werd automatisch opgestart.

## Stap 2: Controle

* In het overzicht kun je alle servers terugvinden. Iedere server toont zijn CPU verbruik, zijn geheugen, de toestand van de harde schijf en zijn specifiek service: Sharepoint, Mail, IIS, MS-SQL

![Oscar_Screenshot](https://github.com/HoGentTIN/p3ops-red/blob/master/oscar2%20-%20monitoring%20server/img/Oscar_Screenshot.jpg)

### Papa2

# Testrapport

* Verantwoordelijke uitvoering: team Papa2
* Verantwoordelijke testen: Arto Collumbien en Sandrien Amourette

**Testen van het tesplan die hier niet worden getest, waren optioneel in de uitvoering**

## Services, roles, en features

Open de Server manager en Tools nog eens om te controleren of de nodige roles, role services en features zijn geïnstalleerd.

![](https://github.com/HoGentTIN/p3ops-red/blob/master/papa2%20-%20werkstations/ImagesTestrapport/5.jpg)

**Gecheckt en in orde**

![](https://github.com/HoGentTIN/p3ops-red/blob/master/papa2%20-%20werkstations/ImagesTestrapport/6.jpg)

**Gecheckt en in orde**

![](https://github.com/HoGentTIN/p3ops-red/blob/master/papa2%20-%20werkstations/ImagesTestrapport/7.jpg)

**Gecheckt en in orde**

![](https://github.com/HoGentTIN/p3ops-red/blob/master/papa2%20-%20werkstations/ImagesTestrapport/8.jpg)

**Gecheckt en in orde**

![](https://github.com/HoGentTIN/p3ops-red/blob/master/papa2%20-%20werkstations/ImagesTestrapport/9.jpg)

**Gecheckt en in orde**

## Group Policy

Controleer ook of de Windows ADK geïnstalleerd is door op de Windows-toets te drukken en naar Apps te gaan. Scroll tot het einde en onder Windows Kits.

![](https://github.com/HoGentTIN/p3ops-red/blob/master/papa2%20-%20werkstations/ImagesTestrapport/10.jpg)

**Gecheckt en in orde**

Controleer vervolgens of er een installatie is uitgevoerd van MS SQL server 2014 door op de Windows-toets te duwen en SQL 2014 te typen. Open deze niet!

![](https://github.com/HoGentTIN/p3ops-red/blob/master/papa2%20-%20werkstations/ImagesTestrapport/15.JPG)

**Gecheckt en in orde**

Controlleer tenslotte of System Center 2012 R2 correct is geinstalleerd door het programma te openen.

![](https://github.com/HoGentTIN/p3ops-red/blob/master/papa2%20-%20werkstations/ImagesTestrapport/14.jpg)

**Gecheckt en in orde**


### Troubleshooting

Optie 66 en 67 ingesteld. Bij het proberen booten via PXe krijgen we een TFTP acces violation error. 

### Mike2

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

### November2

# Testplan November2 final release

* Verantwoordelijke uitvoering: Maarten De Smedt

* Verantwoordelijke testen: Robin Cleyman

## Server opzetten + Aanmelden

Server werkt zonder problemen.


## Testen

### IP - Server Name - Domein

### IP

![IpConfig](https://github.com/HoGentTIN/p3ops-red/blob/master/November2%20-%20SQL/Test/Images/Ipconfig.png)


#### Computernaam en Domein

![Domain](https://github.com/HoGentTIN/p3ops-red/blob/master/November2%20-%20SQL/Test/Images/Naam_Domein.png)


### Aanmaken Directories

![Directories](https://github.com/HoGentTIN/p3ops-red/blob/master/November2%20-%20SQL/Test/Images/Directories.png)


### Java en .Net Installatie 

#### Java

![Java](https://github.com/HoGentTIN/p3ops-red/blob/master/November2%20-%20SQL/Test/Images/Java.png)

#### .Net

![DotNET](https://github.com/HoGentTIN/p3ops-red/blob/master/November2%20-%20SQL/Test/Images/DotNET.png)

### Firewall

![firewall](https://github.com/HoGentTIN/p3ops-red/blob/master/November2%20-%20SQL/Test/Images/firewall.png)


### SQl Server

![SQLServer](https://github.com/HoGentTIN/p3ops-red/blob/master/November2%20-%20SQL/Test/Images/SQLServer.png)

## Samenvatting

De server is volledig en correct geïnstalleerd.

### Delta2
---
# Testrapport Delta2 Final Release 

### Stap 1
Windows is normaal opgestart
### Stap 2
Script uitgevoerd zonder problemen.
![ServerManager](https://github.com/HoGentTIN/p3ops-red/blob/master/Delta%202%20-%20Webserver/Testing/images/screenshots/server%20manager.PNG)
![ServerManager](https://github.com/HoGentTIN/p3ops-red/blob/master/Delta%202%20-%20Webserver/Testing/images/screenshots/ipv4delta2.PNG)
### Stap 3
Get-WindowsFeature toont alle Features als 'Installed' dit is correct.
![Features](https://github.com/HoGentTIN/p3ops-red/blob/master/Delta%202%20-%20Webserver/Testing/images/screenshots/featuresDelta2.PNG) 
### Stap 4
	- Time zone is correct
	- Alle features zijn in orde.
	- IP instellingen zijn correct. Server is ook in het domein toegevoegd en de naam Delta2 is aan de server gegeven.
### Stap 5
Login met RED\Administrator is gelukt.
### Stap 6
Het bestand DotNetCore.2.0.3-windowsHosting.exe is goed uitgevoerd.
### Stap 7
 Server is geconnecteerd met Databank en heeft een databank gecreëerd.
### Stap 8
Eerst naar de tool Internet Information Services Manager gegaan. Vervolgens Default Web Site geopend.

Applicatie toegevoegd met de domainuser. Tests zijn geslaagd
Na de permissions en Directory Browsing aan te passen kan ik de applicatie zien online. Alles is dus correct geïnstalleerd en verlopen.

![ServerManager](https://github.com/HoGentTIN/p3ops-red/blob/master/Delta%202%20-%20Webserver/Testing/images/screenshots/iis.PNG)
### Stap 9
IIS is correct gereset en er kan geschreven worden naar de databank.

![ServerManager](https://github.com/HoGentTIN/p3ops-red/blob/master/Delta%202%20-%20Webserver/Testing/images/screenshots/Sitedelta2.PNG)

![ServerManager](https://github.com/HoGentTIN/p3ops-red/blob/master/Delta%202%20-%20Webserver/Testing/images/screenshots/databankdelta2.PNG)
---
### Netwerk
# Testrapport netwerk red

* Verantwoordelijke uitvoering: Robin Bauwens en Laurens Bracke

## Testen

# Fysieke opstelling komt overeen met die van de packet tracer

Opstelling Packet Tracer:

![alt text](https://github.com/HoGentTIN/p3ops-red/blob/master/Netwerk/testen/images%20testrapport/opstellingFa.PNG)

Fysieke opstelling week 13 (final release):

![alt text](https://github.com/HoGentTIN/p3ops-red/blob/master/Netwerk/testen/images%20testrapport/opstellingweek13.JPG)

Deze komen overeen, we zien op de foto ook dat alle poorten open staan en werken.

# Configuratie is correct en komt overeen

We kijken naar de config van de routers/switch in de config files (map nieuwe config) en kijken of deze overeenkomen.

Router 1:

![alt text](https://github.com/HoGentTIN/p3ops-red/blob/master/Netwerk/testen/images%20testrapport/router1config.png)

Router 2:

![alt text](https://github.com/HoGentTIN/p3ops-red/blob/master/Netwerk/testen/images%20testrapport/router2config.png)

Router 3:

![alt text](https://github.com/HoGentTIN/p3ops-red/blob/master/Netwerk/testen/images%20testrapport/router3config.png)

Router 4:

![alt text](https://github.com/HoGentTIN/p3ops-red/blob/master/Netwerk/testen/images%20testrapport/router4config.png)

Switch:

![alt text](https://github.com/HoGentTIN/p3ops-red/blob/master/Netwerk/testen/images%20testrapport/switch1config.png)

Alle configuraties komen overeen met de config files en kloppen.

# Pingen tussen alle routers

We pingen van elke router naar een andere router om te kijken of de connecties kloppen.

Ping naar router 1:

![alt text](https://github.com/HoGentTIN/p3ops-red/blob/master/Netwerk/testen/images%20testrapport/pingrouter1.PNG)

Ping naar router 2:

![alt text](https://github.com/HoGentTIN/p3ops-red/blob/master/Netwerk/testen/images%20testrapport/pingrouter2.PNG)

Ping naar router 3:

![alt text](https://github.com/HoGentTIN/p3ops-red/blob/master/Netwerk/testen/images%20testrapport/pingrouter3.PNG)

Ping naar router 4:

![alt text](https://github.com/HoGentTIN/p3ops-red/blob/master/Netwerk/testen/images%20testrapport/pingrouter4.PNG)

We kunnen pingen naar elke router en hebben 0% packet loss, dus alle verbindingen werken.

# Pingtest tussen linux en windows:

We verbinden een PC aan het linux en windows gedeelte (deze verkrijgen beiden een internetconnectie) en testen of deze kunnen pingen naar elkaar.

Ping van linux naar windows:

![alt text](https://github.com/HoGentTIN/p3ops-red/blob/master/Netwerk/testen/images%20testrapport/pinglinuxwindowws.PNG)

Ping van windows naar linux:

![alt text](https://github.com/HoGentTIN/p3ops-red/blob/master/Netwerk/testen/images%20testrapport/pingwindowslinux.PNG)

Men verkrijgt internet en alle pings lukken. De opstelling is dus correct.

# Test webserver

Webserver linux (green-local):

![alt text](https://github.com/HoGentTIN/p3ops-red/blob/master/Netwerk/testen/images%20testrapport/linuxweb.PNG)

Webserver windows (red-local):

![alt text](https://github.com/HoGentTIN/p3ops-red/blob/master/Netwerk/testen/images%20testrapport/windowsweb.PNG)

We verkrijgen beide webservers (delta en echo) dus alles klopt.








