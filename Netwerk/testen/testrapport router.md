# Testrapport routers

* Verantwoordelijke uitvoering testrapport: Laurens Bracke

## Testen

## Overeenkomst Packet-tracer met brochure:

Opstelling brochure:

![alt text](images%20testrapport/test1.PNG)

Opstelling Packet-tracer:

![alt text](images%20testrapport/test2.PNG)

- Opstellingen komen overeen


## Configuratie routers:

IK MIS BIJ ELKE ROUTER WEL BEVEILIGING VAN SSH EN/OF CONSOLE PASWOORDEN

### Router4

Deze router heeft juiste config qua poorten, weet momenteel niet of het genoeg is om naar buiten te gaan via de cloud

```
ROUTER4#show running-config
Building configuration...

Current configuration : 760 bytes
!
version 12.2
no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption
!
hostname ROUTER4
!
no ip cef
no ipv6 cef
!
!
!
!
interface FastEthernet0/0
 no ip address
 duplex auto
 speed auto
 shutdown
!
interface Serial0/0
 no ip address
 clock rate 2000000
 shutdown
!
interface Serial0/1
 ip address 192.168.1.1 255.255.255.0
!
interface Serial0/2
 ip address 192.168.0.1 255.255.255.0
!
interface Serial0/3
 no ip address
 clock rate 2000000
 shutdown
!
ip classless
ip route 192.168.1.0 255.255.255.0 192.168.1.2
ip route 192.168.0.0 255.255.255.0 192.168.0.2
!
ip flow-export version 9
!
!
line con 0
!
line aux 0
!
line vty 0 4
 login
!
!
end

```

### Router 3

Poorten zijn correct ingesteld

```
ROUTER3#show running-config
Building configuration...

Current configuration : 841 bytes
!
version 12.2
no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption
!
hostname ROUTER3
!
!
!
no ip cef
no ipv6 cef
!
!
!
!
interface FastEthernet0/0
 no ip address
 duplex auto
 speed auto
 shutdown
!
interface Serial0/0
 ip address 192.168.0.2 255.255.255.0
 clock rate 2000000
!
interface Serial0/1
 ip address 192.168.4.1 255.255.255.0
!
interface Serial0/2
 ip address 192.168.2.2 255.255.255.0
 clock rate 2000000
!
interface Serial0/3
 no ip address
 clock rate 2000000
 shutdown
!
ip classless
ip route 192.168.0.0 255.255.255.0 192.168.0.1
ip route 192.168.2.0 255.255.255.0 192.168.2.1
ip route 192.168.4.0 255.255.255.0 192.168.4.2
!
ip flow-export version 9
!
!
line con 0
!
line aux 0
!
line vty 0 4
 login
!
!
!
end

```

### Router1

Bij hetgene wat ik terugvind, zijn alle poorten goed, behalve de VPN poort is niet ingesteld. Kan dus momenteel ook VPN niet testen.

```

ROUTER1#show running-config
Building configuration...

Current configuration : 907 bytes
!
version 12.2
no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption
!
hostname ROUTER1
!
!
no ip cef
no ipv6 cef
!
!
!
!
interface FastEthernet0/0
 no ip address
 duplex auto
 speed auto
 shutdown
!
interface Serial0/0
 ip address 192.168.4.2 255.255.255.0
 clock rate 2000000
!
interface Serial0/1
 no ip address
 clock rate 2000000
 shutdown
!
interface Serial0/2
 no ip address
 clock rate 2000000
 shutdown
!
interface Serial0/3
 no ip address
 clock rate 2000000
 shutdown
!
interface FastEthernet1/0
 ip address 172.18.2.113 255.255.0.0
 duplex auto
 speed auto
!
interface FastEthernet1/1
 no ip address
 duplex auto
 speed auto
 shutdown
!
ip classless
ip route 192.168.4.0 255.255.255.0 192.168.4.1
!
ip flow-export version 9
!
!
line con 0
!
line aux 0
!
line vty 0 4
 login
!
!
!
end
```

## Lukt het pingen van PC2 naar PC3 en omgekeerd??

- IP van PC3

![alt text](images%20testrapport/test3.PNG)

- IP van PC2

![alt text](images%20testrapport/test4.PNG)

- De ping tussen de 2 pc's wilt niet werken! loopt vast bij Router1

## VPN-configuratie testen?

Ik zie niets van instellingen over VPN, in geen enkel van de 2 PT's.
