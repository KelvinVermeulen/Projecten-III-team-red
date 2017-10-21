Configuratie voor Switch 6:

```
enable
configure terminal
hostname Switch6
banner motd %Unauthorized access prohibited%
enable secret DirkThijs
ip domain-name red.local
crypto key generate rsa
1024
username red secret DirkThijs
line con 0
password BertVanVreckem
login
line vty 0 15
password DirkThijs
transport input ssh
login local
exit
ip ssh version 2
ip ssh authentication-retries 2
ip ssh time-out 60

interface vlan 400
description Switch6 met VLAN 400
ip address 172.18.2.61 255.255.255.224
no shutdown
exit

interface vlan 500
description Switch6 met VLAN 500
ip address 172.18.2.94 255.255.255.224
no shutdown
exit

interface vlan 600
description Switch6 met VLAN 600
ip address 172.18.2.110 255.255.255.240
no shutdown
exit

interface fa0/1
switchport mode access
switchport access vlan 600
no shutdown

interface range f0/20-21
channel-group 1 mode desirable
interface port-channel 1
switchport mode trunk
switchport trunk allowed vlan 500
exit

interface range f0/22-23
channel-group 2 mode desirable
interface port-channel 2
switchport mode trunk
switchport trunk allowed vlan 400
exit

interface g0/1
switchport mode trunk
no shutdown

interface range f0/2-19
shutdown
interface f0/24
shutdown
interface g0/2
shutdown

end
copy running-config startup-config

```

Configuratie voor Router op Switch 6:

```
enable
configure terminal
hostname RouterSwitch6
banner motd %Unauthorized access prohibited%
enable secret DirkThijs
ip domain-name red.local
crypto key generate rsa
1024
username red secret DirkThijs
line con 0
password BertVanVreckem
login
line vty 0 15
password DirkThijs
transport input ssh
login local
exit
ip ssh version 2
ip ssh authentication-retries 2
ip ssh time-out 60
end

configure terminal
router eigrp 1
network 172.18.2.32 0.0.0.31
network 172.18.2.64 0.0.0.31
network 172.18.2.96 0.0.0.15
no auto-summary
exit

interface g0/0
ip helper-address 172.18.2.2
interface g0/0.400
encapsulation dot1q 400
ip address 172.18.2.33 255.255.255.224
no shutdown
interface g0/0.500
encapsulation dot1q 500
ip address 172.18.2.65 255.255.255.224
no shutdown
interface g0/0.600
encapsulation dot1q 600
ip address 172.18.2.97 255.255.255.240
no shutdown
interface g0/0
no shutdown
end
copy running-config startup-config

```
