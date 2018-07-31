#!/usr/bin/python3
'''
works on any text file and extracts url of files with matching extentions
usage: python script webpage
Note: doesn't detect if relative address
'''
import requests
import re
import sys

extension = ['txt','tar.gz', '.tar', 'pdf']
url = "http://www.lookingatpeople.com/download-daimler-ped-det-benchmark/index.html"
outFile = 'url.txt'

### url if as argument
if len(sys.argv) == 2:
    url = sys.argv[1]

html = requests.get(url).text

#use re.findall to get all the links
# links = re.findall('"((http|ftp)s?://.*?)"', html)  # not capcuring without parentheses
links = re.findall('((http|ftp)s?://.*?(?=("|>| |\'|<)))', html) # working
# links = re.findall('((?<=<a href=)(?="?)(http|ftp)s?://.*?(?="?>))', html) # not working(?="?)

file = open(outFile, "w")

for link in links:
    print(link[0])
    for ext in extension:
        l = len(ext)
        if link[0][-l:]==ext:
            file.write(link[0])
            file.write("\n") 
file.close()
