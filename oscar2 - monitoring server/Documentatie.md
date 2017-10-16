# Documentatie

## Hyper-V

### VM aanmaken
1. In Hyper-V Manager, in het rechtse paneel 'Actions' > New > Virtual Machine...

2. In de wizard klik op next. Kies een gepaste naam (hier: MonitoringServer).
Klik op next.

3. Kies voor generatie 2. Klik op next.

4. Vul een startup memory in (hier: 4096 MB. Laat 'Use Dynamic Memory' aangevinkt. Klik op next.

5. In Configure networking, klik op next.

6. Voor de virtuele hard drive, laat alles op default staan. (dynamisch gealloceerd). Klik op next.

7. Selecteer 'Install an operating system from a bootable image file'. Selecteer een gepaste ISO file (Windows 2012 R2). Klik op next.

8. Om te finaliseren controleer settings, klik op finish.

## VM configureren
1. In de Hyper-V manager, ga naar de settings van je VM en selecteer Network Adapter. Vink 'Enable Virtual LAN identification' aan en vul 300 in.
Klik op Apply.

2. Ga da naar Integration Services, vink Guest Services aan. Klik op Apply.

3. In de Hyper-V manager, rechtsklik op je VM en klik op start.

4. In de Windows Setup, kies Time and currency format: Dutch (Belgium) en Keyboard setting: Belgian (Period).

5. Klik op Install now.

6. Geef een geldige product key mee. Klik op next.

7. Kies de GUI installatie. Klik op next. Accepteer de license terms. Klik op next.

8. Kies voor een custom install.

9. Maak een nieuwe harde schijf aan en kies voor de primary partitie. Klik op next.

10.

### installatie PRTG

* & 'c:\Users\Arto\Downloads\PRTG Network Monitor 17.3.33.2830 Setup (Stable).exe' /silent
