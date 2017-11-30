## Testplan Delta 2
# Fysiek
1. Start een computer waar Windows Server 2016 op geïnstalleerd staat.
2. Voer volgend [script]( https://github.com/HoGentTIN/p3ops-red/blob/master/Delta%202%20-%20Webserver/Scripts/Delta2.ps1) uit in Powershell.
3. Gebruik volgend commando `Get-WindowsFeature | where-object {$_.Installed -eq $True} | format-list DisplayName` om na te gaan welke features installed zijn.
4. Overige instellingen kunnen worden gecontroleerd via de GUI.
# Virtueel
1. Open Git Bash als Administrator en ga naar de juiste map met de scripts.
2. Open nu het programma "Hyper-V Manager" hierin gaan we volgende stappen nemen:
    1. Rechterklik op Hyper-V Manager en klik op `Connect to Server...`, kies voor Local computer en druk op OK. 
    2. Nu gaan we een Virtuele Switch creëren, eerst klik op "Virtual Switch Manager", dan doe je volgende stappen 
    ![Virtual_Switch1](https://github.com/HoGentTIN/p3ops-red/blob/master/Delta%202%20-%20Webserver/Testing/images/virtualswitch1.PNG)
      
      Dit geeft het volgende scherm, in dit scherm kunnen we naam van de switch aanpassen, het connectie type en het vlan id. We passen enkel de naam aan en zetten het connectie type op external en adapter op wireless ![Virtual_Switch2](https://github.com/HoGentTIN/p3ops-red/blob/master/Delta%202%20-%20Webserver/Testing/images/virtualswitch2.PNG)
    3. Als laatste krijg je als pop-up nog een error en hier klikken we gewoon op ja.
3. Nadat Hyper-V Manager goed is geconfigureerd gaan we terug naar het Git Bash scherm en typen het commando `vagrant up`. Deze zal de volledige installatie van de Webserver uitvoeren.
4. Wanneer de installatie afgelopen is kunnen we de Webserver openen in Hyper-V Manager en controleren we of alles correct is ingesteld en geïnstalleerd.

- De tijd staat juist en de tijdzone is "Central Europe Standard Time"
- Volgende features zijn geïnstalleerd (bij "Web Server(IIS)" features) :  
    + Default Document  
    + Directory Browsing  
    + HTTP Errors  
    + Static Content  
    + HTTP Logging  
    + Request Monitor  
    + Tracing  
    + Static Content Compression  
    + Request Filtering  
    + .NET Extensibility4.6  
    + ASP.NET 4.6  
    + ISAP Extensions  
    + ISAPI Filters  
    + IIS Management Console  
    
 - Met volgende netwerkinstellingen :
    + IP adres : 172.18.2.70
    + Netmask : 255.255.255.224
    + Default Gateway : 172.18.2.65
    + DNS : 172.18.2.68
    
  - De server moet tot het domein "red.local" behoren.
  
  - Controleer of de naam van de server "Delta2" is.
     





