#!/usr/bin/env python

name = "file name"

#lines = map(str.split, open(name).readlines())
lines = [line[0:-1].split(',') for line in open(name).readlines()]


