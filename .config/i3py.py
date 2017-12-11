# -*- coding: utf-8 -*-
#
import subprocess
import os
import os.path

from i3pystatus import Status
from i3pystatus.updates import pacman, cower


status = Status()

status.register("clock",
    format=" %H:%M:%S ",
    color='#C678DD',
    interval=1,)

status.register("clock",
    format=" %a %d-%m-%Y",
    color='#61AEEE',
    interval=60,)

# status.register("pomodoro",
#     sound="/home/toum/.config/sway/demonstrative.ogg",
#     interval=1,)

status.register("pulseaudio",
    color_unmuted='#98C379',
    color_muted='#E06C75',
    format_muted=' [muted]',
    format=" {volume}%",)

status.register("network",
   interface="eth0",
   color_up="#8AE234",
   color_down="#EF2929",
   format_up=" {v4cidr}",
   format_down="",)

status.register("network",
    interface="wlan0",
    color_up="#8AE234",
    color_down="#EF2929",
    format_up=" {essid}  {kbs} kbs",
    format_down="",)

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
    color='#78EAF2',)

status.register("cpu_usage",
    format=" {usage}%",)

status.register("mem",
    color="#999999",
    warn_color="#E5E500",
    alert_color="#FF1919",
    format=" {avail_mem}/{total_mem} GB",
    divisor=1073741824,)

status.register("disk",
    color='#56B6C2',
    path="/home",
    format=" {avail} GB",)

#status.register('ping',
#    format_disabled='',
#    color='#61AEEE')

# status.register("mpd",
#     host='localhost',
#     port='6600',
#     format="{status}",
#     on_leftclick="switch_playpause",
#     on_rightclick=["mpd_command", "stop"],
#     on_middleclick=["mpd_command", "shuffle"],
#     on_upscroll=["mpd_command", "next_song"],
#     on_downscroll=["mpd_command", "previous_song"],
#     status={
#         "pause": " ",
#         "play": " ",
#         "stop": " ",
#     },)

status.run()
