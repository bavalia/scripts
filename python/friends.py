#! /usr/bin/python 

from numpy import random as rn

#x = [rn.randint(12),rn.randint(25)]
y = rn.randint(300)
x = [y/25,y%25]
print x

# write list ------
import os
command = 'echo "' +str(x[0]) +'\\t' +str(x[1]) +'" >>./friends.data'
os.system(command)


# write matrix --------
from numpy import *

name = "friends.data1"

data = zeros((1,25,13), dtype=int)

try :
	lines = map(str.split, open(name).readlines())
	data[0] = lines[2:]
except IOError: 
	print name+" not found.....creating new"
	for i in range(data.shape[1]) : data[0][i][0]=i

data = data[0]
data[x[1],x[0]+1] += 1

# write file
File = open(name,"w")

File.write("e\s\t")
for i in range(data.shape[1]-1) : File.write(str(i)+"\t")
File.write("\n")
for i in range(data.shape[1]) : File.write("___\t")
File.write("\n")
for episode in data :
	for season in episode : File.write(str(season)+"\t")
	File.write("\n")
File.close()

# end --------




		
