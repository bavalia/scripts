#!/usr/bin/env python

import sys
import csv

print 'Argument List:', sys.argv

if len(sys.argv)>1:
	inputFile = sys.argv[1]
	if len(sys.argv)>2: column = num(sys.argv[2])
	else : column = input("Enter column number to numerize starting from 1: ") - 1
else : print "usage: ./numerize.py filename.csv [column number to numerize (starting from 1)]"; exit()


if column==0: numOutput = inputFile[:-4]+"_users.csv"
elif column==1: numOutput = inputFile[:-4]+"_items.csv"
else : numOutput = inputFile[:-4]+"_other.csv"

output = inputFile[:-4]+"_numerize.csv"

#lines = map(str.split, open(name).readlines())

#lines = [line[:-1].split(',') for line in open(inputFile).readlines()]
lines = [line for line in csv.reader(open(inputFile,'rb'),delimiter=',', quotechar='"')]

#build dictionary 
dic = {}
i = 1
for line in lines: 
    if dic.has_key(line[column])==0: 
        dic[line[column]] = 100*i
        i=i+1
print str(i-1)+"/"+str(len(lines)),"unique items found"


#write dictionary
print "writing to ", numOutput
File = open(numOutput,"wb")
File1 = csv.writer(File, delimiter=',', quotechar='"', quoting=csv.QUOTE_MINIMAL )

#for item in dic.items(): File.write(item[0]+","+str(item[1])+"\n")
#for item in dic.items(): File.writerow(item)
File1.writerows(dic.items())

File.close()

#write numerized file

#numLines = [line[:column]+[str(dic[line[column]])]+line[column+1:] for line in lines]
for line in lines : line[column] = dic[line[column]]

print "writing to ", output
File = open(output,"wb")
File1 = csv.writer(File, delimiter=',', quotechar='"', quoting=csv.QUOTE_MINIMAL )

File1.writerows(lines)

#for line in numLines: 
#	temp = line[0]
#	for item in line[1:]: temp += ','+item
#	File.write(temp+'\n')

File.close()

print "done"

