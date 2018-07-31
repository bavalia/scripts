#! /bin/bash
sudo ifconfig eth0 down
sudo ifconfig wlan0 down
sudo macchanger -A eth0
sudo macchanger -A wlan0
sudo ifconfig eth0 up
sudo ifconfig wlan0 up
echo eth0
macchanger -s eth0
echo wlan0
macchanger -s wlan0
echo done

