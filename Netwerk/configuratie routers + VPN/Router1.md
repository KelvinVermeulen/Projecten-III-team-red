Configuratie voor Router1:

```
enable
configure terminal
hostname Router1
line console 0
password cisco
login
exit
ip domain-name SSH1
crypto key generate rsa
line vty 0 15
login local
transport input ssh
ip ssh version 2
int Se0/0
ip add 192.168.4.2 255.255.255.0
no shut
int Fa1/0
ip add 172.18.0.1 255.255.255.0
no shut
exit
do wr
copy running-config startup-config
end

```



