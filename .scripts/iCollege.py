#!/bin/python
# This python script will download all the videos of your favourites pornhub star
from bs4 import BeautifulSoup
from urllib.request import urlopen

import sys
import youtube_dl

try :
	url = "https://www.pornhub.com/users/" + str(sys.argv[1]) + "/videos/public"
	html = urlopen(url).read()
	soup = BeautifulSoup(html, "html.parser")
except :
	print("This porn star does not exist")
	exit()

for link in soup.find("ul", {"id": "moreData"}).find_all('a'):
    youtube_dl.YoutubeDL({}).download(['https://www.pornhub.com' + link.get("href")])
