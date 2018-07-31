#the code to filter for a red door. 
import cv2
import numpy as np

frame = cv2.imread("./color-chart-exp.png")

print (frame.shape)
hsv = cv2.cvtColor(frame, cv2.COLOR_BGR2HSV)

#modify the upper and lower bounds of the filter
#to alter the filter Tektron3000.
cRange = np.array([[0,150,50],[255,255,180]])


mask = cv2.inRange(hsv, cRange[0], cRange[1])
res = cv2.bitwise_and(frame,frame, mask= mask)
#print (mask.shape)

mask2 = np.copy(frame)
vis = np.concatenate((frame,mask2,res), axis=0)

#cv2.imshow('frame',frame)
#cv2.imshow('mask',mask)
#cv2.imshow('res',res)
#cv2.waitKey(0)
#cv2.destroyAllWindows()



def display():
    mask = cv2.inRange(hsv, cRange[0], cRange[1])
    res = cv2.bitwise_and(frame,frame, mask= mask)
    #mask2 = np.copy(frame)
    mask2[:,:,1] = mask2[:,:,2] = mask2[:,:,0] = mask
    vis = np.concatenate((frame,mask2,res), axis=0)
    cv2.imshow('vis',vis)
    cv2.waitKey(0)
    cv2.destroyAllWindows()
    

