Configuratie voor Router0:

```
enable
configure terminal
hostname Router0
int Fa0/0
(code vpn)
no shut
exit
int Se0/0
ip add 192.168.3.2 255.255.255.0
no shut
exit
end
copy running-config startup-config

```