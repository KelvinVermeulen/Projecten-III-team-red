# Configuratie pfSense

- Keymap: `be.iso.kbd: Belgian ISO-8859-1`
- Partitioning: `Auto (UFS)`
**Nu wordt pfSense geïnstalleerd**


Na het heropstarten:

"Enter the parent interface name for the new VLAN (or nothing if finished):"

`<Enter>`

We steken een kabel in, in `bge0`, zodat deze de WAN-interface wordt.

WAN: bge0
LAN: em0


We veranderen het IP-adres (niet default 192.168.1.1/24) door op 2 te drukken.

Zie IP-adressen schema.

Onderste poort is WAN, bovenste is LAN.

![Voorbeeld](img/1.jpg)
![Voorbeeld](img/2.jpg)
![Voorbeeld](img/3.jpg)

# Afbeeldingen + verloop

## Interfaces

![Verloop](img/extra/1.PNG)

### Interfaces / WAN

![Verloop](img/extra/5.PNG)

## System / Advanced / Admin Access

![Verloop](img/extra/2.PNG)
**Alternate hostname: zonder spaties!**
![Verloop](img/extra/2.1.PNG)
![Verloop](img/extra/2.2.PNG)

## System / General Setup

![Verloop](img/extra/3.PNG)
![Verloop](img/extra/3.1.PNG)
![Verloop](img/extra/3.2.PNG)

**Do not use the DNS Forwarder/DNS Resolver**

![Verloop](img/extra/3.3.PNG)

## System / Routing / Gateways

![Verloop](img/extra/4.PNG)

## Services / DNS Resolver / General Settings

![Verloop](img/extra/6.PNG)
![Verloop](img/extra/6.1.PNG)


**Schakel DNS Forwarder bij "Services" ook uit!**

## Wizard

![Verloop](img/extra/wiz1.PNG)
![Verloop](img/extra/wiz2.PNG)
![Verloop](img/extra/wiz3.PNG)
![Verloop](img/extra/wiz4.PNG)