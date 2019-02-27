#!/bin/bash
result=$(ls /etc/netctl | dmenu -i)

sudo netctl start "$result"
