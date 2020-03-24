#!/bin/bash
result=$(ykman oath list | rofi -dmenu)

ykman oath code $result | cut -d " " -f3 | wl-copy -n
