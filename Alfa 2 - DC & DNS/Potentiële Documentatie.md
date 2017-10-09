# Creëren van de Virtuele Omgeving & Installeren van het OS.
## Virtuele Machine
	Geheugengrootte: 2048 MB
	Virtuele Harde Schijf:
		Naam: C
		VMDK (Virtual Machine Disk)
		Vaste Grootte:
			32,00 GB
## Operating System
	Naam: Windows Server 2016 x64
	Grootte: 5,56 GB
	Language: English (US)
	Time & Currency: Dutch (Belgium)
	Keyboard Input: Belgian (Period)
## NIC
	Tijdelijk
		IP address: 192.168.1.10
		Netmask: 255.255.255.0
## Roles & Services
	### AD DS
		#### Users and Groups (Tools -> AD - User and Groups)
			5 OU's:
				* IT Administratie
				* Administratie
				* Verkoop
				* Directie
				* Ontwikkeling
			5 Groepen:
				* IT Administratie
				* Administratie
				* Verkoop
				* Directie
				* Ontwikkeling
			5 Users:
				* Lien Smet (Admin)
				* Tim Smet (Directie)
				* Jan Smet (IT Admin)
				* Sylvie Smet (Ontwikkeling)
				* Verkoop (Bert Smet)
			5 Workstations:
				* ITClient
				* DClient
				* AClient
				* VClient
				* OClient
		#### Group Policies (Tools -> Group Policy Management)

	### DNS

