Configuratie voor Router2:

```
enable
configure terminal
hostname Router2
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
ip add 192.168.1.2 255.255.255.0
no shut
int Se0/1
ip add 192.168.2.1 255.255.255.0
no shut
int Se0/2
ip add 192.168.3.1 255.255.255.0
no shut
exit
do wr
copy running-config startup-config
end

```