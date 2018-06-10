#!/usr/bin/env python3
import os, sys

# Defining varibales
argument = str(sys.argv[1])
url = os.getenv('QUTE_URL') + '\n'
path = '/home/toum/.config/qutebrowser'
urlInFile = False

# Coping the list
text_file = open(path + "/jsAllow.txt", "r")
lines = text_file.readlines()

# Rewritting the file
text_file = open(path + "/jsAllow.txt", "w")
for line in lines :
    # If the line is not the current url, rewrite it
    if line != url :
        text_file.write(line)
    # If the line is the current url and we are trying to add it
    elif line == url and argument == '-a' :
        text_file.write(line)
        urlInFile = True
# If the current url is not in the file, write it at the end of it
if not urlInFile and argument == '-a' :
    text_file.write(url)

# Don't forget to close the file
text_file.close()
