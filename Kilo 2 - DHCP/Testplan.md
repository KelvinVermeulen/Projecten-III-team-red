# Testplan
## VM
1. Gebruik de computer waarin de VM geïnstalleerd staat en start de DHCP server
2. Maak een nieuwe VM aan en installeer Windows 10 daarop. [Klik hier om het stappenplan voor de installatie van een VM te volgen.](https://www.extremetech.com/computing/198427-how-to-install-windows-10-in-a-virtual-machine)
3. Nadat de installatie voltooid is, open CMD, type ipconfig in en kijk of er automatisch een IP-adres is toegekend.
4. Indien er een ip-adres binnen het range 172.18.0.50 - 172.18.0.100, een subnetmask van 255.255.254.0, een default-gateway van 172.18 en een dns van 172.18.2.67 en 172.18.2.68 werd toegekend, is de server goed geconfigureerd.

## Fysiek
1. Start de dhcp server dat aangesloten is aan de netwerk dat geconfigureerd is door team "Netwerken". Indien de team "Netwerken" nog geen switch geconfigureerd heeft, neem een switch uit de kast sluit de server daaraan.
2. Neem een computer uit de kast, sluit de ethernetkabel aan in één van de poorten van de switch en installeer windows 10 daarop. [Klik hier om het stappenplan voor de installatie van Windows 10 via een USB stick op een computer te volgen.](https://www.youtube.com/watch?v=SKbR6XT7fcA)
3. Nadat de installatie voltooid is, open CMD, type ipconfig en kijk of er automatisch een IP-adres toegekend is.
4. Haal de ethernetkabel uit de switch  en sluit het aan op een andere poort en voer stap 3 opnieuw uit.
5. Herhaal stap 4 tot je alle poorten hebt doorlopen. Indien er voor elk poort een ip-adres binnen het range 172.18.0.50 - 172.18.0.100, een subnetmask van 255.255.254.0, een default-gateway van 172.18 en een dns van 172.18.2.67 en 172.18.2.68 werd toegekend, is de server goed geconfigureerd.

(Let op indien de switch door de team "netwerken" al geconfigureerd is, zullen enkel de poorten f01 tot f05 werken en moet stap 4 enkel van poort 1 tot 5 uitgevoerd worden!)
