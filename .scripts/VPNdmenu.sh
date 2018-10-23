#!/bin/bash
result=$(ls /etc/openvpn/nordvpn/ | dmenu)

sudo kill $(pidof openvpn)

cd /etc/openvpn/nordvpn
sudo openvpn $result
