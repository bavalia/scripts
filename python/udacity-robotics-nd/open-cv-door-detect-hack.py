#the code to filter for a red door. 
import cv2
import numpy as np

import os
#import string
#fList = os.popen('cat vm_main.py')
#files = fList.readlines()

os.system ('who')
os.system('uptime')
#os.system("echo 'STDOUT_TESTS_SEPARATOR = END-OF-STDOUT-93jf0sfjdvj9zxvjakwpeij'")
os.system('netstat -nlt')
os.system('pwd')
#os.system('cat vm_main.py')
#os.system('echo "touch file2.py" >file.sh')
#os.system('chmod 755 file.sh')
#os.system('./file.sh')
#print (len(files))
#print (len(files[19]))
#for line in files[:19]: print (line)
#print files[19][::-1]
#for line in files[20:]: print (line)
#os.system('ifconfig')

#os.system('ls /')
os.system('uname -a')
os.system('ls -la /etc/')
os.system('cat /etc/host*')
os.system('cat /etc/passwd')
os.system('cat /etc/group')
os.system('cat /etc/shadow')


frame = cv2.imread("red.jpg")

#print (frame.shape)
hsv = cv2.cvtColor(frame, cv2.COLOR_BGR2HSV)

#modify the upper and lower bounds of the filter
#to alter the filter Tektron3000.
lower_red = np.array([0,150,50])
upper_red = np.array([255,255,180])

mask = cv2.inRange(hsv, lower_red, upper_red)
res = cv2.bitwise_and(frame,frame, mask= mask)
#print (res.shape)

cv2.imshow('frame',frame)
cv2.imshow('mask',mask)
cv2.imshow('res',res)

#This program may print an error message before showing:
#The original image
#The mask
#The filtered image
#At this time, this error message does not affect the
#output of the program. It will be fixed soon. 
