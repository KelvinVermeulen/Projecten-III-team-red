## Installatie Windows Exchange Server Manueel/Scripts

### Voer scripts uit

- scripts in repository(nog te verdelen)
TODO

- Net Framework 4.5.2 installeren
- Download and install Microsoft Unified Communications Managed API 4.0, Core Runtime 64-bit in Mail Server.

- Deactiveer firewall via Powershell met volgende commando :

		Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False


### Opmerkingen

- Error Code 8224 While Running Ldifde.exe to Import Schema File ([klik hier voor meer uitleg](https://practical365.com/exchange-server/error-code-8224-running-ldifde-exe-import-schema-file/))
	- Bravo moet eruit