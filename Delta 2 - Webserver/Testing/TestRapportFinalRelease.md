
# Testrapport Delta2 Final Release 

### Stap 1
Windows is normaal opgestart
### Stap 2
Script uitgevoerd zonder problemen.
### Stap 3
Get-WindowsFeature toont alle Features als 'Installed' dit is correct.
### Stap 4
	- Time zone is correct
	- Alle features zijn in orde.
	- IP instellingen zijn correct. Server is ook in het domein toegevoegd en de naam Delta2 is aan de server gegeven.
### Stap 5
Login met RED\Administrator is gelukt.
### Stap 6
Het bestand DotNetCore.2.0.3-windowsHosting.exe is goed uitgevoerd.
### Stap 7
 Server is geconnecteerd met Databank en heeft een databank gecreëerd.
### Stap 8
Eerst naar de tool Internet Information Services Manager gegaan. Vervolgens Default Web Site geopend.

Applicatie toegevoegd met de domainuser. Tests zijn geslaagd
Na de permissions en Directory Browsing aan te passen kan ik de applicatie zien online. Alles is dus correct geïnstalleerd en verlopen.

### Stap 9
IIS is correct gereset en er kan geschreven worden naar de databank.
