# Testrapport firewall

Verantwoordelijke testen: Pieter en Ebu

## Uitvoering testplan

### Configuratie

We kunnen de informatie over configuratie van de firewall uit de XML of PDF halen. Hierin zien we dat de protocollen van het LAN toegelaten worden, DNS-resolving uit staat, hostname en timezone geconfigureerd zjin, DNS-servers met domeinnaam en upstream WAN ook in orde is, en dat de interfaces ook correct zijn.


### Opstelling (connectiviteit) testen

We gebruiken de opstelling van de PT.

We stellen ook alles in zoals aangegeven in [het testplan](https://github.com/HoGentTIN/p3ops-red/blob/master/Firewall/testen/Testplan.md)

- [We stellen vast dat we vanaf een client (in het intern netwerk) de Linux-webserver kunnen bereiken (dus ook over/door de firewall heen)](w13/webserver_linux.PNG)
- [Rules LAN](w13/RULES_LAN.pdf)
- [Rules WAN](w13/RULES_WAN.pdf)
- [routes](w13/routes.pdf)
- [gateways](w13/routes2.pdf)
- [We hebben ook "reserved networks" aangepast](w13/3.PNG)
- [Packet filtering staat dus effectief aan](w13/2.PNG)

Alle configuratie komt dus overeen en we kunnen de webserver buiten ons domein (via/over de firewall) bereiken, pings mislukken aangezien we dit niet hebben toegelaten (ICMP).

![De mails die verstuurd werden door de Linux-mailserver (en de mails die wij versturen naar de Linux-mailserver) komen ook aan op onze mailserver.](https://github.com/HoGentTIN/p3ops-red/blob/master/TESTRAPPORTEN%20RELEASE/Testrapport_Charlie2.md)