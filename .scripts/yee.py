#!/bin/python

from yeelight import Bulb
import sys

bulb = Bulb(str(sys.argv[1]))

brightness = int(bulb.get_properties()['bright'])

def plus():
    bulb.set_brightness(brightness + 10)

def minus():
    bulb.set_brightness(brightness - 10)

def adjust(value):
    bulb.set_brightness(brightness + value)

if sys.argv[2] in globals():
    adjust(int(sys.argv[2]))
