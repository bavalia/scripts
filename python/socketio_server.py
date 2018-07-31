# interface server
# https://gist.github.com/kylehounslow/767fb72fde2ebdd010a0bf4242371594

from time import time
from mss import mss
import socketio
import eventlet
import eventlet.wsgi
from flask import Flask, render_template
from base64 import b64encode
import numpy as np
import json

sio = socketio.Server()
app = Flask(__name__)
sct = mss()
# monitor = {'top': 0, 'left': 0, 'width': 1300 , 'height': 720}
monitor = sct.monitors[0]

def getImage():
    img = np.asarray(sct.grab(monitor))[::2,::2,:3]
    imgStr = b64encode()

@sio.on('control')
# def control(*args):
def control(sid, data):
    print("in control :", type(data), len(data), data)
    sendData("data from control")

@sio.on('connect')
def connect(sid, environ):
    # data = args
    # print("in connect :", type(data), len(data), data)
    print("connect ", sid)
    data = "hello world"
    sendData(data)


def sendData(data1):
    sio.emit("screen", {"img": data1.__str__()}, skip_sid=True)

if __name__ == '__main__':
    app = socketio.Middleware(sio, app)
    eventlet.wsgi.server(eventlet.listen(('0.0.0.0', 4444)),app)

