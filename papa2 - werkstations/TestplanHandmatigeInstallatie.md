# Testplan

In deze iteratie gaan we een MSCS lokaal installeren en configureren om in een eerste poging om alles in orde te brengen. Zodanig dat we daarna alles kunnen automatiseren.

## Requirements

- Doel: Na het lezen van dit testplan moeten de testers instaat zijn om in 5 minuten te kunnen uitleggen hoe je de Papa2-server lokaal moet installeren
- Geschatte tijd: 02/09 tot 09/10

## Testplan

|Objectief|Korte beschrijving|Uitgevoerd|
|---------|------------------|-------|
|Documentatie|De uitleg met hoe we te werk zijn gegaan om MSCS lokaal te installeren.||
|Test rapport|Er is een rapport geschreven over het testplan||
|Resources|De nodige ondersteunende filmpjes en uitleg zoeken op YouTube en Google, om toch al eens (half) te zien hoe het moet.||

## Documentation

Als eerste start je een standaardinstallatie op voor een Windows Server 2012R2. Na de installatie moet je als eerste een AD/DC  installeren (DNS is op zich niet nodig). De root domain name is volledig vrij om te kiezen.

Hierna open je de Tool ADSI Edit.
![foto](ImagesTestplan/HandmatigInstalleren/adsiedit01.png)
Rechterklik op ADSI Edit en klik op connect to. Verander niets en klik op oké.
![foto](ImagesTestplan/HandmatigInstalleren/adsiedit02.png)
Open nu Default Naming Context volledig en rechterklik op CN=System en daarna op New -> Object
![foto](ImagesTestplan/HandmatigInstalleren/adsiedit03.png)
Duid in het venster Create Object nu container aan en klik op next.
![foto](ImagesTestplan/HandmatigInstalleren/adsiedit04.png)
Hierna vul je System Management in bij Value.
![foto](ImagesTestplan/HandmatigInstalleren/adsiedit05.png)
Nadat dit is aangemaakt moet je terug naar de tools gaan en op Active Directory Users and Computers klikken. Zorg eerst dat je op View klikt en enable advanced features. Toon nu de volledig system-boom, rechterklik op system management en daarna op delegate control.
![foto](ImagesTestplan/HandmatigInstalleren/adsiedit06.png)
Klik vervolgens op add, Object types en plaats een vink bij computers. Voer hierna de naam van de primaire site server computer account in en druk op ok.
![foto](ImagesTestplan/HandmatigInstalleren/adsiedit07.png)
![foto](ImagesTestplan/HandmatigInstalleren/adsiedit08.png)
![foto](ImagesTestplan/HandmatigInstalleren/adsiedit09.png)
![foto](ImagesTestplan/HandmatigInstalleren/adsiedit10.png)
![foto](ImagesTestplan/HandmatigInstalleren/adsiedit11.png)

Vervolgens moet je de Active Directory Schema extenden.
Dit doe je door de .exe extadh te vinden. Normaal zit deze onder \smssetup\bin\x64 in de installatie DVD of ISO die je hebt gebruikt. Dus, steek deze opnieuw in of re-mount het. Houdt de shift-toets ingedrukt en rechterklik op extadsh.exe en selecteer Copy As Path.
![foto](ImagesTestplan/HandmatigInstalleren/adsiedit12.png)
Open CMD en paste nu het pad erin en druk op enter.
![foto](ImagesTestplan/HandmatigInstalleren/adsiedit13.png)

Daarna moet je alle Roles & Features installeren. Informatie over alle rollen en features zie je hieronder. Als een installatie vraagt achter de installatie media, mount de ISO of steek de DVD erin en geef dan het pad ernaar.
![foto](ImagesTestplan/HandmatigInstalleren/web01.png)
![foto](ImagesTestplan/HandmatigInstalleren/web02.png)
![foto](ImagesTestplan/HandmatigInstalleren/web03.png)

Hierna moeten we de Windows ADK installeren. De recentste is Windows ADK for Windows 10, version 1703.
Download deze en voer de installatie uit zoals hieronder beschreven (customer experience doet er niet echt toe).
![foto](ImagesTestplan/HandmatigInstalleren/adk01.png)
![foto](ImagesTestplan/HandmatigInstalleren/adk02.png)
![foto](ImagesTestplan/HandmatigInstalleren/adk03.png)
![foto](ImagesTestplan/HandmatigInstalleren/adk04.png)

Vervolgens moet er nog een SQL server geinstalleerd worden. Mount de ISO hiervan of steek de DVD in en voer een standaard installatie uit zoals hieronder beschreven staat.
![foto](ImagesTestplan/HandmatigInstalleren/mssql01.png)
Klik op OK als de installatie gedaan is en accepteer in het volgende scherm de license terms en druk op next.
![foto](ImagesTestplan/HandmatigInstalleren/mssql02.png)
Als er warnings zijn is dit geen probleem. Druk gewoon op next wanneer de installatie gedaan is.
![foto](ImagesTestplan/HandmatigInstalleren/mssql03.png)
![foto](ImagesTestplan/HandmatigInstalleren/mssql04.png)
De aangeduide features moeten ZEKER geinstalleerd worden voor CM2012 R2, alle andere features zijn optioneel.
![foto](ImagesTestplan/HandmatigInstalleren/mssql05.png)
Duidt vervolgens Default instance aan.
![foto](ImagesTestplan/HandmatigInstalleren/mssql06.png)
Vul nu de Service Accounts gegevens in. Als Best Practise wordt er aangeraden om Domain Service Accounts te gebruiken en geen local user. Gebruik dus best Administrator + het wachtwoord dat je zelf gegeven hebt. Behalve bij SQL Server Browser.
![foto](ImagesTestplan/HandmatigInstalleren/mssql07.png)
Voeg de huidige gebruiker daarna toe aan de SQL server administrators en druk op next.
![foto](ImagesTestplan/HandmatigInstalleren/mssql08.png)
![foto](ImagesTestplan/HandmatigInstalleren/mssql09.png)
![foto](ImagesTestplan/HandmatigInstalleren/mssql10.png)
![foto](ImagesTestplan/HandmatigInstalleren/mssql11.png)
Als het geheugengebruik van MSSQL niet wordt gelimiteerd dan zal de server waarschuwing gooien. Zet daarom een limiet in op de MSSQL server. Het maximum is 8GB, het minimum is zelf te kiezen.
![foto](ImagesTestplan/HandmatigInstalleren/mssql12.png)

We zullen ook nog WSUS moeten configureren op de server. Voeg de rol toe zoals hieronder aangetoond wordt.
![foto](ImagesTestplan/HandmatigInstalleren/wsus01.png)
1ste aandachtspunt! We hebben geen WID database nodig. Ontvink deze.
![foto](ImagesTestplan/HandmatigInstalleren/wsus02.png)
![foto](ImagesTestplan/HandmatigInstalleren/wsus03.png)
![foto](ImagesTestplan/HandmatigInstalleren/wsus04.png)
2de aandachtspunt! Voer de WSUS configuratiewizard na de installatie NIET uit. Dit kan conflicten veroorzaken met WSUS for Configuration Manager 2012 R2 later.
![foto](ImagesTestplan/HandmatigInstalleren/wsus05.png)

Configureer vervolgens de Firewall met deze settings. Open al eerste Server Manager vanuit de Tools en open Group Policy en volg daarna de stappen.
![foto](ImagesTestplan/HandmatigInstalleren/fw01.png)
![foto](ImagesTestplan/HandmatigInstalleren/fw02.png)
![foto](ImagesTestplan/HandmatigInstalleren/fw03.png)
![foto](ImagesTestplan/HandmatigInstalleren/fw04.png)
![foto](ImagesTestplan/HandmatigInstalleren/fw05.png)
![foto](ImagesTestplan/HandmatigInstalleren/fw06.png)
![foto](ImagesTestplan/HandmatigInstalleren/fw07.png)
![foto](ImagesTestplan/HandmatigInstalleren/fw08.png)
![foto](ImagesTestplan/HandmatigInstalleren/fw09.png)
![foto](ImagesTestplan/HandmatigInstalleren/fw10.png)
![foto](ImagesTestplan/HandmatigInstalleren/fw11.png)

Open daarna deze poorten nog. Hiervoor moet je Group Policy Management openen en een nieuwe policy maken door deze een naam te geven en de rest van de stappen te volgen.
![foto](ImagesTestplan/HandmatigInstalleren/oo01.png)
![foto](ImagesTestplan/HandmatigInstalleren/oo02.png)
![foto](ImagesTestplan/HandmatigInstalleren/oo03.png)
![foto](ImagesTestplan/HandmatigInstalleren/oo04.png)
![foto](ImagesTestplan/HandmatigInstalleren/oo05.png)
![foto](ImagesTestplan/HandmatigInstalleren/oo06.png)
![foto](ImagesTestplan/HandmatigInstalleren/oo07.png)
![foto](ImagesTestplan/HandmatigInstalleren/oo08.png)
![foto](ImagesTestplan/HandmatigInstalleren/oo09.png)

Installeer tenslotte System Center 2012 R2 en ook deze hotfixes door deze stappen te volgen en de lijst met hotfixes te downloaden en installeren.
![foto](ImagesTestplan/HandmatigInstalleren/in01.png)
![foto](ImagesTestplan/HandmatigInstalleren/in02.png)
![foto](ImagesTestplan/HandmatigInstalleren/in03.png)
![foto](ImagesTestplan/HandmatigInstalleren/in04.png)
![foto](ImagesTestplan/HandmatigInstalleren/in05.png)
![foto](ImagesTestplan/HandmatigInstalleren/in06.png)
![foto](ImagesTestplan/HandmatigInstalleren/in07.png)
![foto](ImagesTestplan/HandmatigInstalleren/in08.png)
![foto](ImagesTestplan/HandmatigInstalleren/in09.png)
![foto](ImagesTestplan/HandmatigInstalleren/in10.png)
![foto](ImagesTestplan/HandmatigInstalleren/in11.png)
![foto](ImagesTestplan/HandmatigInstalleren/in12.png)
![foto](ImagesTestplan/HandmatigInstalleren/in13.png)
![foto](ImagesTestplan/HandmatigInstalleren/in14.png)

- Installing Hotfix (KB2905002)
- Installing Hotfix (KB2907591)

Na de installatie van SC2012R2 moeten deze configuraties nog gebeuren.
Als eerste gaan we discovery en bounderies configureren via deze stappen:
![foto](ImagesTestplan/HandmatigInstalleren/bd01.png)
![foto](ImagesTestplan/HandmatigInstalleren/bd02.png)
![foto](ImagesTestplan/HandmatigInstalleren/bd03.png)
![foto](ImagesTestplan/HandmatigInstalleren/bd04.png)
![foto](ImagesTestplan/HandmatigInstalleren/bd05.png)
![foto](ImagesTestplan/HandmatigInstalleren/bd06.png)
![foto](ImagesTestplan/HandmatigInstalleren/bd07.png)
![foto](ImagesTestplan/HandmatigInstalleren/bd08.png)
![foto](ImagesTestplan/HandmatigInstalleren/bd09.png)

Hierna moeten de Site System Roles nog geconfigureerd worden.
![foto](ImagesTestplan/HandmatigInstalleren/ss01.png)
![foto](ImagesTestplan/HandmatigInstalleren/ss02.png)
![foto](ImagesTestplan/HandmatigInstalleren/ss03.png)
![foto](ImagesTestplan/HandmatigInstalleren/ss04.png)
![foto](ImagesTestplan/HandmatigInstalleren/ss05.png)
![foto](ImagesTestplan/HandmatigInstalleren/ss06.png)
![foto](ImagesTestplan/HandmatigInstalleren/ss07.png)
![foto](ImagesTestplan/HandmatigInstalleren/ss08.png)

Als laatste moet je gewoon nog de client settings configureren.
![foto](ImagesTestplan/HandmatigInstalleren/cs01.png)
![foto](ImagesTestplan/HandmatigInstalleren/cs02.png)
![foto](ImagesTestplan/HandmatigInstalleren/cs03.png)
![foto](ImagesTestplan/HandmatigInstalleren/cs04.png)
![foto](ImagesTestplan/HandmatigInstalleren/cs05.png)
![foto](ImagesTestplan/HandmatigInstalleren/cs06.png)
![foto](ImagesTestplan/HandmatigInstalleren/cs07.png)
![foto](ImagesTestplan/HandmatigInstalleren/cs08.png)
![foto](ImagesTestplan/HandmatigInstalleren/cs09.png)
![foto](ImagesTestplan/HandmatigInstalleren/cs10.png)

## Test report

    To do door ...

## Resources

De nodige documentatie hebben we verzameld in [dit bestand](https://github.com/HoGentTIN/p3ops-red/blob/master/papa2%20-%20werkstations/Links.md) opgeslaan.
