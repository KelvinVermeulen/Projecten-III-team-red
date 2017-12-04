Configuratie voor Router1:

```
enable
configure terminal
hostname Router1
line console 0
password cisco
login
exit
int Fa0/1
ip add 172.16.129.13 255.255.0.0
no shut
int Fa0/0
ip add 192.168.1.1 255.255.255.0
no shut
exit
ip route 172.16.0.0 255.255.0.0 fa0/1
ip route 172.18.0.0 255.255.0.0 fa0/0
ip route 0.0.0.0 0.0.0.0 fa0/0
ip route 192.168.0.0 255.255.255.0 fa0/0
ip route 192.168.2.0 255.255.255.0 fa0/0
end
copy running-config startup-config

reload
```
