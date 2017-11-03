# Testplan November2

* Verantwoordelijke uitvoering: Maarten De Smedt
* Verantwoordelijke testen: 

## Server opzetten + Aanmelden
1. Start Git Bash als adminn.
2. Ga naar de Vagrant map van de server.
3. Doe vagrant up --provider hyperv .
4. Als vagrant klaar is ga naar hyperv manager en open de draaiende virtuele machine.
5. Meld aan met deze gebruikersinstellingen:
	- **Gebruikersnaam:** Administrator
	- **Wachtwoord:** Projecten3Nov2

## Testen
### Ipconfiguratie
1. Open de command prompt.
2. Doe een ipconfig/all.
3. Dit moeten de waarde zijn:
	- **IP-Address:** 172.18.2.4
	- **Netmask:** 255.255.255.224
	- **Default Gateway:** 172.18.2.1
	- **Preffered DNS:** 172.18.2.67
	- **Alternate DNS:** 172.18.2.68
4. Als dit klopt is het netwerk correct geconfigureerd.

### Computernaam
1. Ga naar de server manager
2. Ga daar naar Local Server
3. De computer naam moet **November2** zijn.
4. Als dit zo is heeft het de correcte computernaam

### Java
1. Open windows en gaan naar het Control Panel of configuratiescherm.
2. Ga naar programma's.
3. Bij de programma's moet **Java 8** staan.
4. Als dit zo is, is Java geïnstalleerd. 

### ISO Mount
1. Open windows verkenner en ga naar 'Deze pc' of 'This pc'.
2. Hierbij moet op de D,E,F disc **SQL206_x64_ENU** staan.
3. Als deze er is, is de iso file gëimporteerd.

### Firewall Rules
1. Open het Control Panel of Configuratie Scherm.
2. Ga daarna naar Windows Firewall.
3. Klik op advanced settings.
4. Klik op Inbound Rules.
5. Daar moet de rule **MSSQL ENGINE TCP** staan.
6. Als je deze vindt is de rule toegevoegd.

### SQl Server
1. todo

### SQL Management Studio
1. Ga naar het start menu.
2. Zoek naar **SQL Server Management Studio**.
3. Als je dit vindt heb je het geïnstalleerd.
4. Open het programma.
5. Meld aan met windows authenticatie.
6. Als dit gaat is het werkt het programma.