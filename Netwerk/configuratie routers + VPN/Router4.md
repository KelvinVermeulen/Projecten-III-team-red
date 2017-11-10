Configuratie voor Router4:

```
enable
configure terminal
hostname Router4
line console 0
password cisco
login
exit
ip domain-name SSH1
crypto key generate rsa
1024
line vty 0 15
login local
transport input ssh
ip ssh version 2
int Se0/1
ip add 192.168.1.1 255.255.255.0
no shut
int Se0/2
ip add 192.168.0.1 255.255.255.0
no shut
int Se0/0
no ip address
no shut
exit
ip route 192.168.2.0 255.255.255.0 192.168.0.2
ip route 192.168.3.0 255.255.255.0 192.168.1.2
ip route 192.168.4.0 255.255.255.0 192.168.0.2
ip route 172.16.129.0  255.255.255.0 192.168.1.2
ip route 172.18.0.0  255.255.255.0 192.168.0.2
end
copy running-config startup-config

```