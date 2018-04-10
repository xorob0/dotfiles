#!/bin/bash
result=$(ls /etc/netctl | dmenu)

sudo netctl start "$result"
