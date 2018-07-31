#!/usr/bin/python2
'''
works on any web page and extracts url of files with matching extentions
only if matching link is set
usage python script webpage
'''
from bs4 import BeautifulSoup
import requests
import sys

# extension = ['txt', 'tar', 'gz','pdf', 'zip']
extension = ['pdf']
url = "http://cs229.stanford.edu/materials.html"

if len(sys.argv) == 2:
    url = sys.argv[1]
file_name = "url.txt"

page = url.split('/')[-1]
if page: 
    root = url[:-len(page)]
else :
    root = url

html = requests.get(url).text
soup = BeautifulSoup(html, 'lxml')
links = [ x.get('href') for x in soup.findAll('a') ]
file = open(file_name,'w')
for link in links:
    for ext in extension:
        l = len(ext)
        if link[-l:]==ext:
            if '://' not in link : link= root+link
            print(link)
            file.write(link)
            file.write("\n") 
file.close()

