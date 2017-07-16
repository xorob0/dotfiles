#!/bin/bash

printf "%s%s\n" "BRI" "$(paste /sys/class/backlight/*/{actual_brightness,max_brightness} | awk '{BRIGHT=$1/$2*100} END {if(BRIGHT!=0){printf "%.f", BRIGHT} else {print "none"}}')" > /tmp/i3_lemonbar_xorob0

