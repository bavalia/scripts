#! /usr/bin/python


#FILE = 'HuniePopSaveData1copy.game'
FILE = 'HuniePopSaveData1.game'
OFFSET = 1694
VALUE = b'\x9f\x86\x01\x00\x9f\x86\x01\x00'

with open(FILE, "r+b") as toWrite:
    toWrite.seek(OFFSET)
    toWrite.write(VALUE)