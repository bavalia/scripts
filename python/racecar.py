#! /usr/bin/python

#x=-5
#print raw_input('hello'+'give no. eg.'+str(x))

import os
#import string
fList = os.popen('ls ./')

# This function renames files in ./ in reverse order
for f in fList.readlines():
	f = f[:-1]
	g = ""
	l = len(f)
	ext = 0
	for i in range(l):
		if f[l-1-i]==".":
			ext = i+1
			break 
	for i in range(l-ext):
		g+=f[l-ext-1-i]
	
	for i in range(ext):
		g+=f[l-ext+i]
	print f,g
	command = "mv ./'"+f+"' ./'"+g+"'"
	print command
	os.system(command)
	#print 'and'

