#!/bin/python2.7

import string
import random

from selenium import webdriver
from selenium.webdriver import Firefox
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common import ActionChains, keys

def id_generator(size=6, chars=string.ascii_lowercase):
    return ''.join(random.choice(chars) for _ in range(6))

usernameStr = id_generator() + '@' + id_generator() + '.com'
passwordStr = id_generator()

browser = webdriver.Firefox()
browser.get(('https://nordvpn.com/fr/checkout/?Monthly'))

username = browser.find_element_by_id('email')
username.send_keys(usernameStr)

password = browser.find_element_by_id('password')
password.send_keys(passwordStr)

BitCoinButton = browser.find_element_by_id('payment-option-bitcoin')
BitCoinButton.click()

