#!/usr/bin/env python3
import os, sys

# Defining varibales
argument = str(sys.argv[1])
url = os.getenv('QUTE_URL').split("//")[-1].split("/")[0].split('?')[0]
l = url + '\n'
commandAllow = 'echo "set -u *.' + url + ' content.javascript.enabled True" >> $QUTE_FIFO'
commandDeny = 'echo "set -u *.' + url + ' content.javascript.enabled False" >> $QUTE_FIFO'
commandReload = 'echo "reload" >> $QUTE_FIFO'

if argument == '-a' :
    os.system(commandAllow)
elif argument == '-u':
    os.system(commandAllow)

os.system(commandReload)
