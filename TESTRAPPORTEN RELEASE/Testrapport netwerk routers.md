# Testrapport netwerk routers

* Verantwoordelijke uitvoering: Robin Bauwens en Laurens Bracke

## Testen

# Fysieke opstelling komt overeen met die van de packet tracer

Opstelling Packet Tracer:

![alt text](https://github.com/HoGentTIN/p3ops-red/blob/master/Netwerk/testen/images%20testrapport/opstellingFa.PNG)

Fysieke opstelling week 13 (final release):

![alt text](https://github.com/HoGentTIN/p3ops-red/blob/master/Netwerk/testen/images%20testrapport/opstellingweek13.JPG)

Deze komen overeen, we zien op de foto ook dat alle poorten open staan en werken.

# Configuratie is correct en komt overeen

We kijken naar de config van de routers/switch in de config files (map nieuwe config) en kijken of deze overeenkomen.

Router 1:

![alt text](https://github.com/HoGentTIN/p3ops-red/blob/master/Netwerk/testen/images%20testrapport/router1config.png)

Router 2:

![alt text](https://github.com/HoGentTIN/p3ops-red/blob/master/Netwerk/testen/images%20testrapport/router2config.png)

Router 3:

![alt text](https://github.com/HoGentTIN/p3ops-red/blob/master/Netwerk/testen/images%20testrapport/router3config.png)

Router 4:

![alt text](https://github.com/HoGentTIN/p3ops-red/blob/master/Netwerk/testen/images%20testrapport/router4config.png)

Switch:

![alt text](https://github.com/HoGentTIN/p3ops-red/blob/master/Netwerk/testen/images%20testrapport/switch1config.png)

Alle configuraties komen overeen met de config files en kloppen.

# Pingen tussen alle routers

We pingen van elke router naar een andere router om te kijken of de connecties kloppen.

Ping naar router 1:

![alt text](https://github.com/HoGentTIN/p3ops-red/blob/master/Netwerk/testen/images%20testrapport/pingrouter1.PNG)

Ping naar router 2:

![alt text](https://github.com/HoGentTIN/p3ops-red/blob/master/Netwerk/testen/images%20testrapport/pingrouter2.PNG)

Ping naar router 3:

![alt text](https://github.com/HoGentTIN/p3ops-red/blob/master/Netwerk/testen/images%20testrapport/pingrouter3.PNG)

Ping naar router 4:

![alt text](https://github.com/HoGentTIN/p3ops-red/blob/master/Netwerk/testen/images%20testrapport/pingrouter4.PNG)

We kunnen pingen naar elke router en hebben 0% packet loss, dus alle verbindingen werken.

# Pingtest tussen linux en windows:

We verbinden een PC aan het linux en windows gedeelte (deze verkrijgen beiden een internetconnectie) en testen of deze kunnen pingen naar elkaar.

Ping van linux naar windows:

![alt text](https://github.com/HoGentTIN/p3ops-red/blob/master/Netwerk/testen/images%20testrapport/pinglinuxwindowws.PNG)

Ping van windows naar linux:

![alt text](https://github.com/HoGentTIN/p3ops-red/blob/master/Netwerk/testen/images%20testrapport/pingwindowslinux.PNG)

Men verkrijgt internet en alle pings lukken. De opstelling is dus correct.

# Test webserver

Webserver linux (green-local):

![alt text](https://github.com/HoGentTIN/p3ops-red/blob/master/Netwerk/testen/images%20testrapport/linuxweb.PNG)

Webserver windows (red-local):

![alt text](https://github.com/HoGentTIN/p3ops-red/blob/master/Netwerk/testen/images%20testrapport/windowsweb.PNG)

We verkrijgen beide webservers (delta en echo) dus alles klopt.







