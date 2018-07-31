
from time import time
import numpy as np
import cv2



### 1.5 Hz
# print ("pyscreenshot as ImageGrab")
# import pyscreenshot as ImageGrab
# t = time()
# N = 10
# for n in range(N):
#     im = ImageGrab.grab()
# speed = (time()-t)/N
# print("time sec= ", speed, 1/speed)


### 60 Hz
print("mss")
from mss import mss
t = time()
N = 100
cv2.namedWindow("img")
with mss() as sct:
    # monitor = {'top': 0, 'left': 0, 'width': 1300 , 'height': 720}
    monitor = sct.monitors[0]
    for n in range(N):
        img = np.asarray(sct.grab(monitor))
        img = img[::2,::2,:3]
        cv2.imshow("img",img)
        cv2.waitKey(1)
speed = (time()-t)/N
print("time sec= ", speed, 1/speed)





