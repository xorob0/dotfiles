#!/bin/bash
result=$(ykman oath list | dmenu)

ykman oath code $result | cut -d " " -f3 | xclip -selection "clipboard"
