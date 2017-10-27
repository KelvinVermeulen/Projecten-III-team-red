# Enterprise Linux Lab Report - Troubleshooting

- Student name: Cedric Van Dorpe
- Class/group: TIN-TI-3B (Gent)

## Instructions

- Write a detailed report in the "Report" section below (in Dutch or English)
- Use correct Markdown! Use fenced code blocks for commands and their output, terminal transcripts, ...
- The different phases in the bottom-up troubleshooting process are described in their own subsections (heading of level 3, i.e. starting with `###`) with the name of the phase as title.
- Every step is described in detail:
    - describe what is being tested
    - give the command, including options and arguments, needed to execute the test, or the absolute path to the configuration file to be verified
    - give the expected output of the command or content of the configuration file (only the relevant parts are sufficient!)
    - if the actual output is different from the one expected, explain the cause and describe how you fixed this by giving the exact commands or necessary changes to configuration files
- In the section "End result", describe the final state of the service:
    - copy/paste a transcript of running the acceptance tests
    - describe the result of accessing the service from the host system
    - describe any error messages that still remain

## Report

### Phase 1: Physical and Network Access layer
- first of all, i have to check whether the power is on and whether the network adapters are connected or not.
- the power is on, since virtualbox states the machine is running 
- by going to the network settings of the virtual machine, by opening "advanced", i found that the second adapter (host-only) was not connected (since cable connected was unchecked).
- after checking the box to reconnect the cable, i checked whether `ip link` would now say the link was up instead of no-carrier.
- `IP link` returns `UP` for all interfaces.
- this means we are finished with the physical and network access layer

### Phase 2: The internet Layer
- Now i have to check whether all interfaces have an ip address assigned and whether a default gateway and a dns server are configured.
- by going to the ifcfg files of the interfaces with `sudo vi /etc/sysconfig/network-scripts/ifcfg-enp0s3`
- Inside enp0s3, i checked whether an ip adress was set automatically or manually or not at all.
- no ip address was defined specifically, but the bootprotocol stated that it was chosen by the dhcp.
- to make everything easier, i changed the keyboard layout with `localectl set-keymap be`
- I checked the same for enp0s8 with `sudo vi /etc/sysconfig/network-scripts/ifcfg-enp0s8`
- here the ip address was set to 192.168.56.42 as expected for enp0s3.
- finally, i checked the same for the loopback interface with `sudo vi /etc/sysconfig/network-scripts/ifcfg-lo`
- this had the expected ip address of 127.0.0.1 aswell.
- by entering `ip a`, i found that the ip adresses are indeed all correctly configured to the values i found in the ifcfg's. The only difference is the NAT interface.(since this ip isn't supposed to be specifically written in the ifcfg-enp0s3) The nat shows an ip address of 10.0.2.15/24 as expected aswell.
- by using `ip r` i will now check the default gateway.
- the output states `default via 10.0.2.2`, showing that the default gateway is correctly configured.
- to check the dns server, i used `cat /etc/resolv.conf`
-  the dns server is named hogent.be, and it is configured with `nameserver 10.0.2.3`, which is correct.
- getent ahosts www.google.com shows the expected results
- finally, to check the connection, i'm going to ping to several addresses. 
- Ping to the nat ip address , with the `ping 10.0.2.15`
- Ping to the ip address of the default gateway, with the `ping 10.0.2.2`
- Ping to the ip address of the webpage, with the `ping 192.168.52.42`
- all pings succeeded, so this layer is finished

### Phase 3: The Transport Layer
- to check if the required services are running, and if apache is not running, i'm using `sudo systemctl status httpd.service`.
- the service httpd was not found and therefore inactive(dead), which is the correct result.
- `sudo systemctl status nginx.service` shows that the nginx service is on "Active: failed".
- using `sudo systemctl start nginx.service` and `sudo systemctl enable nginx.service` didn't work to resolve the issue either.
- I used `sudo journalctl -f -u nginx` to be able to read the full error message.
- configuration file /etc/nginx/nginx.conf test failed, there seems to be a problem with /etc/pki/tls/certs/nigxn.pem .
- I assume this is a typo, since it says nigxn instead of nginx, so i'll doublecheck by going to the certs folder with `cd /etc/pki/tls/certs` and using ls
- in this folder, it states nginx.pem, so it must be a typo that needs to be corrected.
- near the bottom of the conf file /etc/nginx/nginx.conf , i changed the ssl_certificate to reference /etc/pki/tls/certs/nginx.pem instead of /etc/pki/tls/certs/nigxn.pem.
- now i'll test if the service works after these changes by using `sudo systemctl start nginx` and `sudo systemctl enable nginx`, followed by `sudo systemctl status nginx`.
- now the service is Active (running) but the vendor preset is disabled
- the error says: failed to read PID from file /run/nginx.pid: invalid argument
- `sudo firewall-cmd --list-all` shows that the service https is not allowed yet and the interface enp0s8 is not allowed yet.
- `sudo firewall-cmd --permanent --add-service=https` & `sudo firewall-cmd --permanent --add-interface=enp0s8`
- `sudo firewall-cmd --reload` followed by `sudo firewall-cmd --list-all`shows that https is now also allowed
- still `failed to read pid from /run/nginx.pid`
- by using systemctl status, i found that nginx is degraded.
- pinging with `ping 192.168.56.42` on my hostsystem does not work.
- I have no idea what I have to do next to fix my issue.

### Phase 4: The Application Layer


## End result



## Resources

List all sources of useful information that you encountered while completing this assignment: books, manuals, HOWTO's, blog posts, etc.

- [vi commands](https://www.cs.colostate.edu/helpdocs/vi.html)
- [keyboard layout command](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/system_administrators_guide/s1-changing_the_keyboard_layout)
- [nginx vendor disabled error fix](https://www.digitalocean.com/community/questions/unable-to-start-nginx-failed-to-read-pid-from-file-run-nginx-pid)
- https://serverfault.com/questions/565339/nginx-fails-to-stop-and-nginx-pid-is-missing
- https://stackoverflow.com/questions/36176255/error-invalid-pid-number-in-run-nginx-pid
