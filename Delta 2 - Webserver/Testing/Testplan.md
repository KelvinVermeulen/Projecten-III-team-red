## Testplan Delta 2
# Fysiek
1. Start een computer waar Windows Server 2016 op geïnstalleerd staat.
2. Voer volgend [script]( https://github.com/HoGentTIN/p3ops-red/blob/master/Delta%202%20-%20Webserver/Scripts/Delta2.ps1) uit in Powershell.
3. Gebruik volgend commando `Get-WindowsFeature | where-object {$_.Installed -eq $True} | format-list DisplayName` om na te gaan welke features installed zijn.
4. Overige instellingen kunnen worden gecontroleerd via de GUI.
# Virtueel
1. Open Git Bash als Administrator en ga naar de juiste map met de scripts.
2. Gebruik het commando "Vagrant up" en laat de installatie volledig verlopen.
3. Via Hyper-V kan je een GUI openen en volgende instellingen zouden moet overeenkomen met de instellingen op de VM.

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
     





