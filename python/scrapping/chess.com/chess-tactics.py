#!/usr/bin/python3
'''
Save url number for awailable chess.com tactics
eg. https://www.chess.com/tactics/831/practice?autostart=1
'''

from time import sleep 
from os import system 
from random import random

problemFile = "tactics_problems"
stateFile = "state-chess"

N = 20000
s = 0
s = int(open(stateFile).readline().split()[0])
print ("found state file for : ", s)

s+=1
exist = 1
# while exist is not 0:
for i in range(s, s+N):
    print ("#####", i, "#####")
    web = "https://www.chess.com/tactics/" + str(i) + "/practice?autostart=1"
    cmd = "wget --server-response --spider " + web + " --quiet " #2>&1 /dev/null" #&>/dev/null"
    print (cmd)
    exist = system(cmd)
    system("echo " + str(i) + " > " + stateFile)

    if exist is 0:
        system("echo " + str(i) + " >> " + problemFile)
        print (web)

    sleep(random()*4)

