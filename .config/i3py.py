# -*- coding: utf-8 -*-
#
import subprocess
import os
import os.path

import netifaces
import sensors

from i3pystatus import Status
from i3pystatus.updates import pacman, cower


status = Status(standalone=True, internet_check=('archlinux.org', 80))

status.register("clock",
    format=" %H:%M:%S",
    color='#C678DD',
    interval=1,)

status.register("clock",
    format=" %a %d-%m-%Y",
    color='#61AEEE',
    interval=60,)

status.register("pulseaudio",
    color_unmuted='#98C379',
    color_muted='#E06C75',
    format_muted=' [muted]',
    format=" {volume}% {volume_bar}",)

status.register("external_ip")

for s in netifaces.interfaces():
    if s == 'lo' or s.startswith("tun"):
        pass
    elif s.startswith('wl'):
        status.register("network",
            interface=s,
            color_up="#8AE234",
            color_down="#EF2929",
            format_up=" {essid} {v4cidr}",
            format_down="",)
    else:
        status.register("network",
           interface=s,
           color_up="#8AE234",
           color_down="#EF2929",
           format_up=" {v4cidr}",
           format_down="",)

status.register("shell",
    command="bash /home/toum/.scripts/ovpnIsOn.sh",
    ignore_empty_stdout=True,
    error_color="#EF2929",
    color="#8AE234",)

status.register("backlight",
    interval=5,
    format=" {percentage:.0f}%",
    backlight="intel_backlight",)


status.register("battery",
    battery_ident="BAT0",
    interval=5,
    format="{status}{percentage:.0f}% {remaining}",
    alert=True,
    alert_percentage=15,
    color="#FFFFFF",
    critical_color="#FF1919",
    charging_color="#E5E500",
    full_color="#D19A66",
    status={
        "DIS": " ",
        "CHR": "  ",
        "FULL": "   ",
},)

status.register("temp",
                format="{Package_id_0}°C {Core_0_bar}{Core_1_bar}{Core_2_bar}{Core_3_bar}",
                hints={"markup": "pango"},
                lm_sensors_enabled=True,
                dynamic_color=True)

status.register("cpu_usage",
    format=" {usage}%",)

status.register("mem",
    color="#999999",
    warn_color="#E5E500",
    alert_color="#FF1919",
    format=" {avail_mem}/{total_mem} Go",
    divisor=1073741824,)

status.register("disk",
    color='#56B6C2',
    path="/home",
    format=" {avail} Go",)

status.register("updates",
                format = "Updates: {count}",
                format_no_updates = "No updates",
                backends = [pacman.Pacman(), cower.Cower()])

status.run()
