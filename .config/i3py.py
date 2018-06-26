# -*- coding: utf-8 -*-
#
import subprocess
import os
import os.path

import netifaces
import sensors

from i3pystatus import Status
from i3pystatus.updates import pacman, cower

import urllib.request
from bs4 import BeautifulSoup
from parse import *

nord0 = "#2E3440"
nord1 = "#3B4252"
nord2 = "#434C5E"
nord3 = "#4C566A"
nord4 = "#D8DEE9"
nord5 = "#E5E9F0"
nord6 = "#ECEFF4"
nord7 = "#8FBCBB"
nord8 = "#88C0D0"
nord9 = "#81A1C1"
nord10 = "#5E81AC"
nord11 = "#BF616A"
nord12 = "#D08770"
nord13 = "#EBCB8B"
nord14 = "#A3BE8C"
nord15 = "#B48EAD"

def getTether():
    u = urllib.request.urlopen("http://192.168.1.60:8000")
    html = u.read()
    soup = BeautifulSoup(html, "html.parser")
    
    i = ""
    for p in soup.find_all('p'):
        i = i + str(p)
    
    reg = '<p>Battery level :{0} </p><p>Network type :{1}</p><p>IP: 192.168.43.1</p><p> Network connected</p><p> Network non restricted</p>'
    p = parse(reg, i)
    return p


status = Status(standalone=True, internet_check=('archlinux.org', 80),logfile='/tmp/i3pystatus.log')

status.register("clock",
    format=" %H:%M:%S",
    color=nord6,
    interval=1,)

status.register("clock",
    format=" %a %d-%m-%Y",
    color=nord4,
    interval=60,)

status.register("pulseaudio",
    color_unmuted=nord14,
    color_muted=nord11,
    format_muted='',
    format=" {volume}% {volume_bar}",)

status.register("external_ip",
    color=nord8,
    color_down=nord11,
    color_hide=nord8,
    format_hide="{country_name} {country_code} {ip}",
    format="{country_code}")

for s in netifaces.interfaces():
    if s == 'lo' or s.startswith("tun"):
        pass
    elif s.startswith('wl'):
        status.register("network",
            interface=s,
            color_up=nord14,
            color_down=nord11,
            format_up=" {essid} {v4cidr}",
            format_down="",)
    elif s.startswith('enp0s20f'):
        # p = getTether()
        status.register("network",
            interface=s,
            color_up=nord14,
            color_down=nord11,
            format_up=" Z5 Compact",
            format_down="",)
    else:
        status.register("network",
           interface=s,
           color_up=nord14,
           color_down=nord11,
           format_up=" {v4cidr}",
           format_down="",)

status.register("shell",
    command="bash /home/toum/.scripts/ovpnIsOn.sh",
    ignore_empty_stdout=True,
    error_color=nord11,
    color=nord14)

status.register("backlight",
    interval=5,
    format=" {percentage:.0f}%",
    backlight="intel_backlight",)


status.register("battery",
    battery_ident="BAT0",
    interval=5,
    format="{status}{percentage:.0f}%",
    alert=True,
    alert_percentage=15,
    color=nord4,
    critical_color=nord11,
    charging_color=nord12,
    full_color=nord15,
    status={
        "DIS": " ",
        "CHR": "  ",
        "FULL": "   ",
},)

status.register("temp",
                format="{Package_id_0}°C {Core_0_bar}{Core_1_bar}{Core_2_bar}{Core_3_bar}",
                hints={"markup": "pango"},
                lm_sensors_enabled=True,
                color=nord7,
                alert_color=nord12)

status.register("cpu_usage_bar",
    format=" {usage}% {usage_bar}",
    bar_type="vertical",
    start_color=nord10,
    end_color=nord7)

status.register("mem",
    color=nord9,
    warn_color=nord12,
    alert_color=nord11,
    format=" {avail_mem} Go",
    divisor=1073741824,)

status.register("disk",
    color=nord7,
    path="/home",
    format=" {avail} Go")

status.register("pomodoro",
    sound="~/.pomodoro.mp3")

status.register("shell",
    command="python3 /home/toum/.scripts/getTitle.py",
    ignore_empty_stdout=True,
    error_color=nord11,
    color=nord14,
    interval=1)

status.run()
