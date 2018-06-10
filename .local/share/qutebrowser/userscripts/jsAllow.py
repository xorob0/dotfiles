#!/usr/bin/env python3
import os, sys

# Defining varibales
argument = str(sys.argv[1])
url = os.getenv('QUTE_URL').split("//")[-1].split("/")[0].split('?')[0]
l = url + '\n'
path = '/home/toum/.config/qutebrowser'
urlInFile = False
commandAllow = 'echo "set -u *.' + url + ' content.javascript.enabled True" >> $QUTE_FIFO'
commandDeny = 'echo "set -u *.' + url + ' content.javascript.enabled False" >> $QUTE_FIFO'
commandReload = 'echo "reload" >> $QUTE_FIFO'

# Coping the list
text_file = open(path + "/jsAllow.txt", "r")
lines = text_file.readlines()

# Disabling javascript on the url
os.system(commandDeny)

# Rewritting the file
text_file = open(path + "/jsAllow.txt", "w")
for line in lines :
    # If the line is not the current url, rewrite it
    if line != l :
        text_file.write(line)
    # If the line is the current url and we are trying to add it
    elif line == l and argument == '-a' :
        text_file.write(line)
        urlInFile = True
        os.system(commandAllow)
# If the current url is not in the file, write it at the end of it
if not urlInFile and argument == '-a' :
    text_file.write(l)
    os.system(commandAllow)

# Don't forget to close the file
text_file.close()

os.system(commandReload)
