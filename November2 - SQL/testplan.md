# Testplan November2
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
1. Open de command prompt
2. Doe een ipconfig/all
3. Dit moeten de waarde zijn:
	- **IP-Address:** 172.18.2.4
	- **Netmask:** 255.255.255.224
	- **Default Gateway:** 172.18.2.1
	- **Preffered DNS:** 172.18.2.67
	- **Alternate DNS:** 172.18.2.68
4. Als dit klopt is het netwerk correct geconfigureerd.

### Java
1. Open windows en gaan naar het Control Panel of configuratiescherm
2. Ga naar programma's
3. Bij de programma's moet **Javanaam** staan.
4. Als dit zo is, is Java geïnstalleerd. 

### ISO Mount
1. Open windows verkenner en ga naar 'Deze pc' of 'This pc'
2. Hierbij moet de file **isertsql** staan.
3. Als deze er is, is de iso file gëimporteerd.

### Firewall Rules
1. todo

### SQl Server
1. todo
### SQL Management Studio
1. todo



