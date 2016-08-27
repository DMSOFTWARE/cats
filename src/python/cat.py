#!/usr/bin/python

import sys

bufsize=131072

def process(file):
    data="start"
    while data != "":
        data=file.read(bufsize)
        sys.stdout.write(data)
    file.close()

file = open("../data",'r')
process(file)
