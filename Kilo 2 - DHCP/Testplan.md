# Testplan
## VM (In de VM is er een andere ip adres gerbuikt dan de ip adres dat werd gegeven door de team "netwerken")
1. Gebruik de computer waarin de VM geïnstalleerd staat en start de DHCP server
2. Log in met de volgende wachtwoord: Aa12345
3. Ga naar de instellingen van de dhcp server op virtualbox. Klik op netwerken en controleer of de netwerk instellingen van adapter 1 op "intern netwerk" staat. Indien dat niet het geval is, zet dit op "intern netwerk"
4. Open CMD, type ipconfig en druk enter. Controleer of de netwerkinstellingen dezelfde zijn als hieronder:
- IP-adres: 192.168.1.11
- Subnetmask: 255.255.255.0
- Default-Gateway: 192.168.1.10
- DNS: 192.168.1.10
4. Maak een nieuwe VM aan en installeer Windows 10 daarop. [Klik hier om het stappenplan voor de installatie van een VM te volgen.](https://www.extremetech.com/computing/198427-how-to-install-windows-10-in-a-virtual-machine). Voordat je begint met de installatie van windows 10, verander de netwerk instellingen van de VM (Windows 10) van adapter 1 naar "intern netwerk". In [dit](https://www.youtube.com/watch?v=nsbxw_jx1wQ) video wordt er uitgelegd hoe je dat kan doen.
5. Nadat de installatie voltooid is, open CMD, type ipconfig in en kijk of er automatisch een IP-adres is toegekend.
6. Indien er een ip-adres binnen het range 192.168.1.50 - 192.168.1.100, een subnetmask van 255.255.255.0, een default-gateway van 192.168.1.10 en een dns van 192.168.1.10 werd toegekend, is de server goed geconfigureerd.

## Fysiek
1. Start de dhcp server dat aangesloten is aan de netwerk dat geconfigureerd is door team "Netwerken" en log in met de volgende wachtwoord: Aa12345. Indien de team "Netwerken" nog geen switch geconfigureerd heeft, neem een switch uit de kast sluit de server daaraan.
2. Neem een computer uit de kast, sluit de ethernetkabel aan in één van de poorten van de switch en installeer windows 10 daarop. [Klik hier om het stappenplan voor de installatie van Windows 10 via een USB stick op een computer te volgen.](https://www.youtube.com/watch?v=SKbR6XT7fcA)
3. Nadat de installatie voltooid is, open CMD, type ipconfig en kijk of er automatisch een IP-adres toegekend is.
4. Haal de ethernetkabel uit de switch en sluit het aan op een andere poort.
5. Type de ipconfig /release in CMD en druk op enter, type daarna ipconfig /renew en druk opnieuw op enter.
6. Voer stap 3 opnieuw uit.
5. Herhaal stap 4, 5 en 6 tot je alle poorten hebt doorlopen. Indien er voor elk poort een ip-adres binnen het range 172.18.0.50 - 172.18.0.100, een subnetmask van 255.255.254.0, een default-gateway van 172.18.0.1 en een dns van 172.18.2.67 en 172.18.2.68 werd toegekend, is de server goed geconfigureerd.

(Let op indien de switch door de team "netwerken" al geconfigureerd is, zullen enkel de poorten f01 tot f05 werken en moet stap 4 enkel van poort 1 tot 5 uitgevoerd worden!)
