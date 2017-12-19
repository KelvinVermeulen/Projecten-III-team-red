# Documentatie Alfa 2
## Installatie procedure
1. Download een iso file van Windows Server 2016
2. Download de programma ["ISO to USB"](http://www.isotousb.com) op je computer, open de programma, selecteer de gedownloade iso file en de usb stik waarin Windows Server 2016 geïnstalleer moet worden en klik op burn
3. Kopiër daarna de bestand "autounattend.xml" naar de root van de usb stick.
4. Maak een nieuwe map genaamd "script" aan in de root van de usb stick en kopier de bestanden uit de map ["Automatisatie scripts"](https://github.com/HoGentTIN/p3ops-red/tree/master/Alfa%202%20-%20DC%20%26%20DNS/Automatisatie%20scripts) daarin.
5. Maak nog een map aan genaamd 'backup" aan in de root van de usb stick en kopier de bestanden uit de map ["backup"](https://github.com/HoGentTIN/p3ops-red/tree/master/Alfa%202%20-%20DC%20%26%20DNS/Automatisatie%20scripts/backup) daarin.
6. Sluit de usb stick aan op de server waarin DC/DNS geïnstalleerd moet worden. 
7. Start de computer aan, open boot menu en selecteer usb drive zodat de installatie uit de usb kan starten. De installatie zal nu automatisch starten en uitgevoerd worden.
9. Nadat de installatie klaar is, open de usb stick op de server en ga naar de aangemaakt map "script" in stap 4.
9. Doe rechtermuisklik op "1DC-DNS.ps1" en klik op "run with powershell". DC/DNS zal automatisch geïnstalleerd en geconfigureerd worden. De computer zal automatisch opnieuw opstarten nadat de installatie voltooid is.
10. Nadat de computer herstart is, voer stap 7 opnieuw uit en doe rechtermuislik op "2OU.ps1" en klik op "run with powershell". De gebruikers zullen nu aangemaakt worden.
11. Voer stap 7 opnieuw uit en doe rechtermuislik op "3Users.ps1" en klik op "run with powershell". De gebruikers zullen nu aangemaakt worden.
12. Voer stap 7 opnieuw uit en doe rechtermuislik op "4GPO.ps1" en klik op "run with powershell". De GPO's zullen nu aangemaakt worden.
12. Nadat stap uitgevoerd is, is de installatie van de server voltooid.

## Informatie over server
Server naam: ns1 <br>
Domein naam: red.local<br>
<br>
Server gebruikersnaam: Administrator<br>
Server wachtwoord: Aa12345<br>
<br>
Domein gebruikersnaam: Administrator@red.local<br>
Domein wachtwoord: Aa12345<br>

## Informatie over de aangemaakte gebruikers en groepen:


| Groep            | Gebruiker(s)                 | Gebruikersnaam | Wachtwoord  |
|------------------|------------------------------|------------------------------|------------------------------|
| Administratie    | John Smet | john.smet@red.local| P@ssword|
| Directie         | Lien Smet                 | lien.smet@red.local| P@ssword |
| IT Administratie | Henry Smet                 | henry.smet@red.local | P@ssword|
| Ontwikkeling     | Laura Smet              | laura.smet@red.local | P@ssword |
| Verkoop          | Dirk Smet                | dirk.smet@red.local | P@ssword |

## Informatie over de aangemaakte GPO:
| Naam GPO            | Beschrijving                 | Van toepassing voor                 |
|------------------|------------------------------|------------------------------|
| ControlPanelGameLink    | Toegang tot contol panel en game link blokkeren | Iedereen|
| Netwerkadapter         | Toegang tot netwerkadapter instellingen blokkeren               | Verkoop en administratie|
| FileServer | Automatisch aanmaken van schijfen per user                 | Iedereen|




