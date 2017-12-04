# Stappenplan Release

## Automatische installaties

1. In hyper-v check de instellingen voor de virtuele switch adapter.
Extern netwerk staat op wireless en de vlan-id staat op 200.

![vlan](https://github.com/HoGentTIN/p3ops-red/tree/master/oscar2%20-%20monitoring%20server/img/switch.JPG)

2. 'vagrant up' op de locatie van vagrantfile

3. In Hyper-V manager bij instellingen van de VM moet het vlan nog meegegevn worden.

4. Script runnen voor de installatie PRTG & IP instellingen

5. Check of google chrome werd geïnstalleerd


## Configuratie PRTG

1. Voeg 9 servers toe met de templates. Gebruik hiervoor de IP adressen van de template. (Voor de 2 dc's gebruik de DNSTemplate)

2. Tijd om te testen!

3. Als de services klaar zijn volg dan documentatie voor de juiste sensors toe te voegen. (vanaf .7 onder PRTG configureren)
