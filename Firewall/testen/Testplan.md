# Testplan Firewall

* Verantwoordelijke uitvoering: Laurens en Robin
* Verantwoordelijke testen: Ebu en Pieter

## Wat moet getest worden

- Toegelaten protocollen (21, 25, 53, 80, 110, 143, 161, 443) van binnen het LAN
- IP-adressen LAN- en WAN-interface
- DNS-servers, domeinnaam, upstream IPv4 van WAN (gateway)
- Timezone en hostnaam
- DNS-resolving uitgeschakeld (de firewall mag enkel filteren!)
- *Optioneel: Aliassen voor IP en poorten*

## Testwijze

1. Open de WebGUI vanop een machine met IP-adres `172.18.2.99` en surf naar het IP-adres `172.18.2.98` via een webbrowser.
    - Username: `admin`
    - Password: `pfsense`
2. Ga naar `Firewall -> Rules -> LAN` en controleer of alle protocollen (21, 25, 53, 80, 110, 143, 161, 443) toegelaten worden vanaf het LAN.
3. Controleer in het dashboard of de hostnaam `pfSense.red` is, en of beide netwerkinterfaces (LAN & WAN) aanwezig zijn (en correct ingesteld zijn qua IP-adressen. 
    - LAN: `172.18.2.98/28`
    - WAN: `172.18.2.114/28`
4. Controleer verder of de WAN-interface ook een IPv4 Upstream gateway address heeft, dit kan je nagaan bij `Interfaces -> WAN`.
5. Controleer of DNS-resolver en DNS-forwarder beide uitgeschakeld zijn, dit kan je nagaan bij `Services -> DNS Resolver en Services -> DNS Forwarder`.
6. Controleer of de hostnaam (`pfSense`), domeinnaam (`red`) en DNS-servers (`172.18.2.67` en `172.18.2.68`) correct ingesteld staan, dit kan je nagaan bij `System -> General Setup`. Hier kan je ook de Timezone nagaan, dit dient op `Europe/Brussels` te staan.


## Wat bevat het testrapport?

- Een overzicht (adhv afbeeldingen) van alle *belangrijke* firewall configuratie.
