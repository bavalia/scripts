#!/usr/bin/python
import re
import os
import sys
path = ""
name = "[INfiNitY]_"

def rename(a,b,path):
        cmd = "mv " +path+a+ " "+path+b
        print cmd
        os.system(cmd)
def lookdir(dname):
        dlist = []
        global path
        global name
        path=path+dname+'/'
        #print "path= " + path
        list0 = os.popen("ls "+path)
        for l in list0.readlines():
                l = l[:-1]
                l = l.replace(r'&','and')
                a = l.replace(' ','_')
                l = l.replace(' ',r'\ ')
                l = l.replace(r'(',r'\(')
                l = l.replace(r')',r'\)')
                #print l
                a = a.replace(r'(','_')
                a = a.replace(r')','_')
                #print a
                if l != a:
                        rename(l,a,path)
        list1 = os.popen("ls -l "+path)
        for ls in list1.readlines():
                if ls[0]=='d':
                        lsplit=ls.split()
                        dlist.append(lsplit[-1])
                elif ls[0]=='-':
                        lsplit=ls.split()
                        a = lsplit[-1]
                        b = name + a
                        if a[:11]!=name:
                                rename(a,b,path)
        for d in dlist:
                lookdir(d)
        path = path.replace('/'+dname+'/','/')
        a = name+dname
        if a[:11]!=name:
                rename(dname,a,path)
        
if __name__ == '__main__':
        lookdir(".")

