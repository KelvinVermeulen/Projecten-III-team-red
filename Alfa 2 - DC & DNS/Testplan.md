# Testplan Alfa 2
## Windows Server 2016 installatie

### GUI
1. Start de server dat genaamd is als Alfa 2 in de VM
2. Log in met "Aa123" als wachtwoord
3. Open "Server Manager" indien dat niet automatisch gebeurt is. Dit doe je door naar de startmenu te gaan en daar op "Server Manager" te klikken.
4. Nadat "Server Manger" geopend is, klik op "Local Server" dat je links van de pagina terug kan vinden.
5. Controller of de "Operating system version" op "Windows Server 2016 Standard staat". Indien dat zo is, is de server installatie succesvol uitgevoerd.

### CMD
1. Start de server dat genaamd is als Alfa 2 in de VM
2. Log in met "Aa123" als wachtwoord
3. Open "Command Prompt" door de startmenu te openen en "CMD" in te typen.
4. Nadat CMD geopend is, type "Winver" en je ziet welke Windows versie er geïnstalleerd is. Indien er Windows Server 2016 staat is de server installatie succesvol uitgevoerd.

## Domeincontroller en DNS



## Server naam en domein naam

## GUI
1. Start de server dat genaamd is als Alfa 2 in de VM
2. Log in met "Aa123" als wachtwoord
3. Open "Server Manager" indien dat niet automatisch gebeurt is. Dit doe je door naar de startmenu te gaan en daar op "Server Manager" te klikken.
4. Nadat "Server Manger" geopend is, klik op "Local Server" dat je link van de pagina terug kan vinden.
5. Controlleer of de "Computer Name" op "ns1" en de "Domain" op "red.local" staat. Indien dat zo is, is de server naam en domein succesvol geconfigureerd.

## CMD

1. Start de server dat genaamd is als Alfa 2 in de VM
2. Log in met "Aa123" als wachtwoord
3. Open "Command Prompt" door de startmenu te openen en "CMD" in te typen.
4. Nadat CMD geopend is, type "HOSTNAME" en je ziet wat de naam van de server is. Indien het "ns1" is, is de naam goed geconfigureerd. Type hierna "wmic computersystem get domain" om de domain naam te vinden. Indien er "red.local" staat is dat ook goed geconfigureerd.

## Gebruikersgroepen, gebruikers en werkstations

1. Start de server dat genaamd is als Alfa 2 in de VM
2. Log in met "Aa123" als wachtwoord
3. Open "Server Manager" indien dat niet automatisch gebeurt is. Dit doe je door naar de startmenu te gaan en daar op "Server Manager" te klikken.
4. Nadat "Server Manger" geopend is, klik op "Tools" dat je rechts bovenaan van de pagina terug kan vinden en klik daarna op "Ative directory users en groups".
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
| Administratie    | Lies LS. Smet Dirck DS. Smet |
| Directie         | Tim TS. Smet                 |
| IT Administratie | Jan JS. Smet                 |
| Ontwikkeling     | Sylvie SS. Smet              |
| Verkoop          | Bert BS. Smet                |
## Policies

## Fileserver

## Netwerkkaart
