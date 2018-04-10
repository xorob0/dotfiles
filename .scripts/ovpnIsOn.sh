#!/bin/bash
OUTPT=$(ps -aux | grep openvpn | sed -n '1p' | rev | cut -d " " -f1 | rev | cut -d "." -f1)

if [ "$OUTPT" != "openvpn" ]; then
	echo "VPN:" $OUTPT
	exit 0
else
	echo "VPN"
	exit 1
fi
