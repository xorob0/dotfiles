#!/bin/bash
result=$(ls /etc/openvpn/client/ | dmenu)

sudo kill $(pidof openvpn)

cd /etc/openvpn/client/
sudo openvpn  $result
