Configuratie voor Router0:

```
enable
configure terminal
hostname Router0
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
ip add 192.168.3.2 255.255.255.0
no shut
int Fa1/0
ip add 172.16.2.113 255.255.0.0
no shut
exit
do wr
copy running-config startup-config
end

```