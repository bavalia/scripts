# interface client

import json
from time import time,sleep
import base64
from socketIO_client import SocketIO, LoggingNamespace
# import logging
# logging.basicConfig(level=logging.DEBUG)

# from base64 import b64encode

def respond(data):
    global i
    i += 1
    img = data["img"]
    print ("in respond", img)
    sendData("Data from respond for control")

# def on_connect(*args):
#     data = args
#     print('in connect', type(args), len(args), args)


def sendData(data1):
    # sio.emit("control", {"steer": data1.__str__()})
    sio.emit("control", {"steer": data1.__str__()}, skip_sid=True)

t=time()
i = 0 
# sio = SocketIO('127.0.0.1', 4444, LoggingNamespace)
sio = SocketIO('192.168.0.100', 4444, LoggingNamespace)
print("it toook seconds = ", time()-t)
# sio = SocketIO('127.0.0.1', 4444)
print("hihi")
sio.on('screen', respond)
# sio.on('disconnect', on_disconnect)
sendData("I am client")
sio.wait()
print("wowo")
speed = (time()-t)/i
print("time sec= ", speed, 1/speed)
print ("i = ", i)
