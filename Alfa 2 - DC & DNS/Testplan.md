# Testplan Alfa 2
## Windows Server 2016 installatie

### GUI
1. Start de server dat genaamd is als Alfa 2 in de VM
2. Log in met "Aa12345" als wachtwoord
3. Open "Server Manager" indien dat niet automatisch gebeurt is. Dit doe je door naar de startmenu te gaan en daar op "Server Manager" te klikken.
4. Nadat "Server Manger" geopend is, klik op "Local Server" dat je links van de pagina terug kan vinden.
5. Controller of de "Operating system version" op "Windows Server 2016 Standard staat". Indien dat zo is, is de server installatie succesvol uitgevoerd.

### CMD
1. Start de server dat genaamd is als Alfa 2 in de VM
2. Log in met "Aa12345" als wachtwoord
3. Open "Command Prompt" door de startmenu te openen en "CMD" in te typen. (Indien de core versie geïnstalleerd is, wordt de cmd automatisch geopend en is deze stap overbodig)
4. Nadat CMD geopend is, type "Winver" en je ziet welke Windows versie er geïnstalleerd is. Indien er Windows Server 2016 staat is de server installatie succesvol uitgevoerd.

## Netwerkkaart
1. Start de server dat genaamd is als Alfa 2 in de VM
2. Log in met "Aa12345" als wachtwoord
3. Open "Command Prompt" door de startmenu te openen en "CMD" in te typen. (Indien de core versie geïnstalleerd is, wordt de cmd automatisch geopend en is deze stap overbodig)
4. Type ipconfig en durk op enter.
5. De ip adres moet als volgt geconfigureerd zijn: (momenteel wachten op de netwerk gedeelte)
6. Indien de ip adres klopt is de netwerk juist geconfigureerd

## Domeincontroller en DNS
### DC en DNS geïnstalleerd?
1. Start de server dat genaamd is als Alfa 2 in de VM
2. Log in met "Aa12345" als wachtwoord
3. Open "Server Manager" indien dat niet automatisch gebeurt is. Dit doe je door naar de startmenu te gaan en daar op "Server Manager" te klikken.
4. Indien er aan de linkerkant AD DS en DNS saat, zijn de rollen succesvol geïnstalleerd
### Controleren of DC en DNS werkt
1. Maak een nieuwe VM aan en installeer windows 10 daarop. Je kan de stappen op [dit](https://www.extremetech.com/computing/198427-how-to-install-windows-10-in-a-virtual-machine) pagina volgen voor het installatie van een Windows 10 op VM.
2. Maak de geïnstalleerde computer lid van de domein. Om dit te doen volg de volgende stappen
- Start de computer en log in
- Ga naar "Mijn computer", doe rechtermuisklik en klik op "eigenschappen"
- Klik daarna op "Instellingen wijzigen" in de gedeelte "Instellingen voor computernaam,domein en werkgroep"
- Klik daarna op de geopende pagina op wijzigen
- Vink daarna de "domein" aan en geef als domeinnaam "red.local" in. Er wordt een gebruikersnaam (Administrator) en wachtwoord (Aa12345) gevraagd, geef dat in en druk op enter. De computer zal opnieuw moeten opgestart worden, en de computer zal lid worden van red.local.
4. Als de bovenstaande procedure gelukt is, werkt domeincontroller en dns zonder porblemen.


## Server naam en domein naam

### GUI
1. Start de server dat genaamd is als Alfa 2 in de VM
2. Log in met "Aa12345" als wachtwoord
3. Open "Server Manager" indien dat niet automatisch gebeurt is. Dit doe je door naar de startmenu te gaan en daar op "Server Manager" te klikken.
4. Nadat "Server Manger" geopend is, klik op "Local Server" dat je link van de pagina terug kan vinden.
5. Controlleer of de "Computer Name" op "ns1" en de "Domain" op "red.local" staat. Indien dat zo is, is de server naam en domein succesvol geconfigureerd.

### CMD

1. Start de server dat genaamd is als Alfa 2 in de VM
2. Log in met "Aa12345" als wachtwoord
3. Open "Command Prompt" door de startmenu te openen en "CMD" in te typen. (Indien de core versie geïnstalleerd is, wordt de cmd automatisch geopend en is deze stap overbodig)
4. Nadat CMD geopend is, type "HOSTNAME" en je ziet wat de naam van de server is. Indien het "ns1" is, is de naam goed geconfigureerd. Type hierna "wmic computersystem get domain" om de domain naam te vinden. Indien er "red.local" staat is dat ook goed geconfigureerd.

## Gebruikersgroepen, gebruikers en werkstations

### Gui
1. Start de server dat genaamd is als Alfa 2 in de VM
2. Log in met "Aa12345" als wachtwoord
3. Open "Server Manager" indien dat niet automatisch gebeurt is. Dit doe je door naar de startmenu te gaan en daar op "Server Manager" te klikken.
4. Nadat "Server Manger" geopend is, klik op "Tools" dat je rechts bovenaan van de pagina terug kan vinden en klik daarna op "Ative directory users and computers".
5. Klap daarna red.local uit. je moet een map "Red" moeten zien.
6. Daarin moet je de volgende mappen terug kunnen vinden:
 - Administratie
 - Directie
 - IT Administratie
 - Ontwikkeling
 - Verkoop
 - Werkstation
7. In de bovenstaande mappen (behalve in de map Werkstation" moet je een groep met dezelfde naam en min. één gerbuiker terug kunnen vinden.
8. Indien dat het geval is, zijn de groepen en goed aangemaakt.
9. In de map "Werkstation" moet je vijf werkstations terug kunnen vinden met de volgende namen:
 - Administratie
 - Directie
 - IT Administratie
 - Ontwikkeling
 - Verkoop
 - Werkstation
 Indien dat het geval is, zijn de werkstations ook goed aangemaakt
 10. Als laatst controleren we of de gerbuikers tot de juiste groep(en) behoren. Dit doen we als volgt:
 - Klik één per één op de groepen die je terug kan vinden in de mappen in stap 6.
 - Klik daarna op de tab "Members"
 - Indien je daar de gebruikers als volgt kan terug vinden, is alles goed geconfigureerd:
 
| Groep            | Gebruiker(s)                 |
|------------------|------------------------------|
| Administratie    | Lies LS. Smet en Dirck DS. Smet |
| Directie         | Tim TS. Smet                 |
| IT Administratie | Jan JS. Smet                 |
| Ontwikkeling     | Sylvie SS. Smet              |
| Verkoop          | Bert BS. Smet                |


### CMD
1. Start de server dat genaamd is als Alfa 2 in de VM
2. Log in met "Aa12345" als wachtwoord
3. Open "Command Prompt" door de startmenu te openen en "CMD" in te typen. (Indien de core versie geïnstalleerd is, wordt de cmd automatisch geopend en is deze stap overbodig)
4. Type "dsa.msc" in en klik op enter. "Active directory users and computers" wordt geopend.
5. Volg hierna de bovenstaande Gui vanaf stap 5

## Inloggen op computer

1. Tijdens het uitwerken van de policies test je ook of de gebruikers zijn aangemaakt en of je kan inloggen op de computers.

## Policies

Indien je Windows 10 al hebt geinstalleerd tijdens het controleren van DC moet je dit nu niet doen en kan je doorgaan naar stap 3!

1. Maak een nieuwe VM aan en installeer windows 10 daarop. Je kan de stappen op [dit](https://www.extremetech.com/computing/198427-how-to-install-windows-10-in-a-virtual-machine) pagina volgen voor het installatie van een Windows 10 op VM.
2. Maak de geïnstalleerde computer lid van de domein. Om dit te doen volg de volgende stappen
- Start de computer en log in
- Ga naar "Mijn computer", doe rechtermuisklik en klik op "eigenschappen"
- Klik daarna op "Instellingen wijzigen" in de gedeelte "Instellingen voor computernaam,domein en werkgroep"
- Klik daarna op de geopende pagina op wijzigen
- Vink daarna de "domein" aan en geef als domeinnaam "red.local" in. Er wordt een gebruikersnaam (Administrator) en wachtwoord (Aa12345) gevraagd, geef dat in en druk op enter. De computer zal opnieuw moeten opgestart worden, en de computer zal lid worden van red.local.

3. Nadat de computer een lid is geworden van de domein. Log uit en log in met de volgede gebruikers (In de derde kolom wordt beschreven wat normaal gezien niet moet werken. Indien dat klopt zijn de policies goed geconfigureerd):

| Groep            | Gebruikersnaam en wachtwoord                |Beperking                 |
|------------------|------------------------------|------------------------------|
| Administratie    | Lies.Smet - P@ssword |Configuratie scherm kan niet geopend worden, Game link is niet terug te vinden in startmenu, eigenschappenvan de netwerkadapters kan niet geopend worden |
| Directie         | Tim.Smet - P@ssword                |Configuratie scherm kan niet geopend worden, Game link is niet terug te vinden in startmenu                |
| IT Administratie | Jan.Smet - P@ssword                 |Configuratie scherm kan niet geopend worden, Game link is niet terug te vinden in startmenu                 |
| Ontwikkeling     | Sylvie.Smet - P@ssword              |Configuratie scherm kan niet geopend worden, Game link is niet terug te vinden in startmenu             |
| Verkoop          | Bert.Smet - P@ssword                |Configuratie scherm kan niet geopend worden, Game link is niet terug te vinden in startmenu, eigenschappenvan de netwerkadapters kan niet geopend worden                |




## Fileserver

