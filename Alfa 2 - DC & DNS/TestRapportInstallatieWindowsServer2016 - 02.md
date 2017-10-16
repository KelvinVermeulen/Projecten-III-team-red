# Testrapport Alfa 2

- Geschatte tijd: 2u
- Gerealiseerde tijd:

## Windows Server 2016 installatie

### GUI
In orde.

### CMD
In orde.

## Netwerkkaart
In orde.

## Domeincontroller en DNS
### DC en DNS geïnstalleerd?
In orde.

### Controleren of DC en DNS werkt
1. Maak een nieuwe VM aan en installeer windows 10 daarop. Je kan de stappen op [dit](https://www.extremetech.com/computing/198427-how-to-install-windows-10-in-a-virtual-machine) pagina volgen voor het installatie van een Windows 10 op VM.
2. Verander de ip adres van de computer zodat het in de zelfde netwerk ligt als de server, dit doe je door de inststructies op [dit pagina](https://support.microsoft.com/nl-be/help/15089/windows-change-tcp-ip-settings) te volgen (stap 5 moet je niet uitvoeren aangezien we niet werken met IPv6). Geef de volgende netwerkinformatie in voor het configureren van de netwerk:
- IP adres: 172.18.2.70
- Subnetmask: 255.255.0.0
- Default Gateway: 172.18.2.65
- DNS Server: 172.18.2.67
3. Maak na de netwerkconfiguratie de geïnstalleerde computer lid van de domein. Om dit te doen volg de volgende stappen
- Start de computer en log in
- Ga naar "Mijn computer", doe rechtermuisklik en klik op "eigenschappen"
- Klik daarna op "Instellingen wijzigen" in de gedeelte "Instellingen voor computernaam,domein en werkgroep"
- Klik daarna op de geopende pagina op wijzigen
- Vink daarna de "domein" aan en geef als domeinnaam "red.local" in. Er wordt een gebruikersnaam (Administrator) en wachtwoord (Aa12345) gevraagd, geef dat in en druk op enter. De computer zal opnieuw moeten opgestart worden, en de computer zal lid worden van red.local.
4. Als de bovenstaande procedure gelukt is, werkt domeincontroller en dns zonder porblemen.
