#!/usr/bin/python3
"""
    @brief Google Maps Stitcher
    @author Kunal_Patel @ Swaayatt-Robots
    @date 2017/oct/10

    #### frame work scale, z20
    0.000008993 deg = 1.0 m       = 10 pixels
    0.00001 deg     = 1.112 m     = 11.12 pixels
    0.0005 deg      = 55.6 m      = 556 pixels 
    0.001 deg       = 111.2 m     = 1112 pixels

#TODO
"""

### Includes ###
import os
import numpy as np
import cv2
from mapGenerator import mapGenerator

### Default Parametes ###


### Constants ###
swytLocConst        = 0.0005            # deg
swytHeightConst     = 556               # pixels
swytLenghtConst     = 55.6              # meter


### Class Definations ###

class testNumpySubclass(np.ndarray):
    # Reference:https://docs.scipy.org/doc/numpy/user/basics.subclassing.html

    def __new__(subtype, shape=None, dtype=float, buffer=None, offset=0,
                strides=None, order=None, info="wow"):
        img = cv2.imread("london_51.5074.png")
        obj = super().__new__(subtype, img.shape, img.dtype, buffer, offset, strides, order)
        print (type(obj))
        obj.info = info
        print(obj.info)
        obj[:] = img
        print (type(obj))
        return obj

    def __array_finalize__(self, obj):
        print("in __array_finalize")
        self.info = "hello123"
        print(self.info)
        if obj is None: return
        print("in __array_finalize, after return")
        # self.info = getattr(obj, 'info', "hello")
        self.info = "hello"
        # obj.info = "obj"
        print(self.info, obj.info)
        print(type(self), type(obj))
        print("in __array_finalize, after info")

    def test():
        fac1 = testNumpySubclass()
        print(type(fac1), fac1.shape, fac1.info, "fac1")
        fac1.info = "teri"
        print(type(fac1), fac1.shape, fac1.info, "fac1")
        img = cv2.imread("london_51.5074.png")
        fac2 = fac1[1:10]
        fac2.info = "sali"
        print (fac1.shape, fac1[1:10].shape, fac2.shape, img[1:10].shape)
        fac2[:] = fac1[1:10]
        print (fac2.info)
        exit()
        fac = fac1.copy()
        print(type(fac), fac2.shape, fac.info, fac1.info, fac2.info)
        cv2.imshow("img", fac)
        cv2.waitKey(0)
        # print (fac.shape)






### Function Definations ###

### Main Function, just for testing purpose only ### 

if __name__ == '__main__':
    testNumpySubclass.test()
