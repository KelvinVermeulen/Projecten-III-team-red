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

Als eerste start je een standaardinstallatie op voor een Windows Server 2012R2. Na de installatie moet je als eerste een AD/DC installeren. De root domain name is volledig vrij om te kiezen.

Hierna open je de Tool ADSI Edit en maak je de volgende aanpassingen.

![foto](ImagesTestplan/HandmatigInstalleren/adsiedit01.png)
![foto](ImagesTestplan/HandmatigInstalleren/adsiedit02.png)
![foto](ImagesTestplan/HandmatigInstalleren/adsiedit03.png)
![foto](ImagesTestplan/HandmatigInstalleren/adsiedit04.png)
![foto](ImagesTestplan/HandmatigInstalleren/adsiedit05.png)
![foto](ImagesTestplan/HandmatigInstalleren/adsiedit06.png)
![foto](ImagesTestplan/HandmatigInstalleren/adsiedit07.png)
![foto](ImagesTestplan/HandmatigInstalleren/adsiedit08.png)
![foto](ImagesTestplan/HandmatigInstalleren/adsiedit09.png)
![foto](ImagesTestplan/HandmatigInstalleren/adsiedit10.png)
![foto](ImagesTestplan/HandmatigInstalleren/adsiedit11.png)

Vervolgens moet je de Active Directory Schema extenden.

![foto](ImagesTestplan/HandmatigInstalleren/adsiedit12.png)
![foto](ImagesTestplan/HandmatigInstalleren/adsiedit13.png)

Daarna moet je alle Roles & Features installeren.

![foto](ImagesTestplan/HandmatigInstalleren/web01.png)
![foto](ImagesTestplan/HandmatigInstalleren/web02.png)
![foto](ImagesTestplan/HandmatigInstalleren/web03.png)

Installeer nu Windows ADK.

![foto](ImagesTestplan/HandmatigInstalleren/adk01.png)
![foto](ImagesTestplan/HandmatigInstalleren/adk02.png)
![foto](ImagesTestplan/HandmatigInstalleren/adk03.png)
![foto](ImagesTestplan/HandmatigInstalleren/adk04.png)

Hierna hebben we nog een SQL server nodig.

![foto](ImagesTestplan/HandmatigInstalleren/mssql01.png)
![foto](ImagesTestplan/HandmatigInstalleren/mssql02.png)
![foto](ImagesTestplan/HandmatigInstalleren/mssql03.png)
![foto](ImagesTestplan/HandmatigInstalleren/mssql04.png)
![foto](ImagesTestplan/HandmatigInstalleren/mssql05.png)
![foto](ImagesTestplan/HandmatigInstalleren/mssql06.png)
![foto](ImagesTestplan/HandmatigInstalleren/mssql07.png)
![foto](ImagesTestplan/HandmatigInstalleren/mssql08.png)
![foto](ImagesTestplan/HandmatigInstalleren/mssql09.png)
![foto](ImagesTestplan/HandmatigInstalleren/mssql10.png)
![foto](ImagesTestplan/HandmatigInstalleren/mssql11.png)
![foto](ImagesTestplan/HandmatigInstalleren/mssql12.png)

We zullen ook nog WSUS moeten configureren op de server.

![foto](ImagesTestplan/HandmatigInstalleren/wsus01.png)
![foto](ImagesTestplan/HandmatigInstalleren/wsus02.png)
![foto](ImagesTestplan/HandmatigInstalleren/wsus03.png)
![foto](ImagesTestplan/HandmatigInstalleren/wsus04.png)
![foto](ImagesTestplan/HandmatigInstalleren/wsus05.png)

Configureer vervolgens de Firewall met deze settings.

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

Open deze poorten.

![foto](ImagesTestplan/HandmatigInstalleren/oo01.png)
![foto](ImagesTestplan/HandmatigInstalleren/oo02.png)
![foto](ImagesTestplan/HandmatigInstalleren/oo03.png)
![foto](ImagesTestplan/HandmatigInstalleren/oo04.png)
![foto](ImagesTestplan/HandmatigInstalleren/oo05.png)
![foto](ImagesTestplan/HandmatigInstalleren/oo06.png)
![foto](ImagesTestplan/HandmatigInstalleren/oo07.png)
![foto](ImagesTestplan/HandmatigInstalleren/oo08.png)
![foto](ImagesTestplan/HandmatigInstalleren/oo09.png)

Installeer tenslotte System Center 2012 R2 en ook deze hotfixes.

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

p.179

## Test report

    To do door ...

## Resources

De nodige documentatie hebben we verzameld in [dit bestand](https://github.com/HoGentTIN/p3ops-red/blob/master/papa2%20-%20werkstations/Links.md) opgeslaan.
