#!/usr/bin/python
'''
Grab similar links from a webpage and mass download
needs script editing for case by case, to define type of links
'''

import mechanize
from bs4 import BeautifulSoup
import os

## start main work

# Browser
br = mechanize.Browser()

site = 'http://nptel.ac.in/downloads/101108057/'
sitetitle = 'http://nptel.ac.in'


html = br.open(site).read()

soup = BeautifulSoup(html, 'html.parser')

links = soup.findAll('a')

links = links[18:58] #filter only required links

pdfs  = []

for link in links: pdfs = pdfs + [sitetitle+link.get('href')]

cd ~/Desktop

for pdf in  pdfs: os.system("wget " +pdf)

#EOF


