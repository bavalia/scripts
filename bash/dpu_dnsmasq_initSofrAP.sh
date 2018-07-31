#!/bin/bash

src="eth0"
if [ $# -gt "0" ]
then
    src=$1
fi
#Initial wifi interface configuration
ifconfig wlan0 up 10.0.0.1 netmask 255.255.255.0
sleep 2
echo 1
###########Start dnsmasq, modify if required##########
if [ -z "$(ps -e | grep dnsmasq)" ]
then
 dnsmasq
fi
echo 2
###########
 
#Enable NAT
iptables --flush
iptables --table nat --flush
iptables --delete-chain
iptables --table nat --delete-chain
iptables --table nat --append POSTROUTING --out-interface $src -j MASQUERADE
iptables --append FORWARD --in-interface $src -j ACCEPT
echo 3
#Thanks to lorenzo
#Uncomment the line below if facing problems while sharing PPPoE, see lorenzo's comment for more details
#iptables -I FORWARD -p tcp --tcp-flags SYN,RST SYN -j TCPMSS --clamp-mss-to-pmtu
 
sysctl -w net.ipv4.ip_forward=1
echo 4
#start hostapd
hostapd /etc/hostapd-hotspot.conf
#hostapd /etc/hostapd/hostapd.conf 1> /dev/null
echo 5
killall dnsmasq
echo 6
