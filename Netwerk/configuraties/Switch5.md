Configuratie voor Switch 5:

```

enable
configure terminal
hostname Switch5
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

interface vlan 200
description Switch5 met VLAN 200
ip address 172.18.1.254 255.255.254.0
no shutdown
exit

interface vlan 300
description Switch5 met VLAN 300
ip address 172.18.2.30 255.255.255.224
no shutdown
exit

interface vlan 400
description Switch5 met VLAN 400
ip address 172.18.2.62 255.255.255.224
no shutdown
exit

interface range f0/4-9
switchport mode access
switchport access vlan 300
exit

interface range f0/20-21
channel-group 1 mode desirable
interface port-channel 1
switchport mode trunk
switchport trunk allowed vlan 200
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

interface range f0/1-3
shutdown
interface range f0/10-19
shutdown
interface f0/24
shutdown
interface g0/2
shutdown

end
copy running-config startup-config

```


Configuratie voor Router op Switch 5:

```

enable
configure terminal
hostname RouterSwitch5
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
interface g0/0.200
encapsulation dot1q 200
ip address 172.18.0.1 255.255.254.0
no shutdown
interface g0/0.300
encapsulation dot1q 300
ip address 172.18.2.1 255.255.255.224
no shutdown
interface g0/0.400
encapsulation dot1q 400
ip address 172.18.2.32 255.255.255.224
no shutdown
interface g0/0
no shutdown
end
copy running-config startup-config
```
