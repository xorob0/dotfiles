#/usr/bin/env python3
import os
import json

def getFocused(element):
    if len(element['nodes']):
        for e in element['nodes']:
            getFocused(e)
    elif element['focused']:
        print(element['name'])
        exit()

jsonfile = os.popen('swaymsg -t get_tree').read()
tree = json.loads(jsonfile)
getFocused(tree)
