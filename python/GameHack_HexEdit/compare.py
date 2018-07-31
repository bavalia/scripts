#! /usr/bin/python

import argparse
from time import time




if __name__=='__main__':
    parser=argparse.ArgumentParser(description='Compare binary files byte wise')

    parser.add_argument("file1", help="file1")
    parser.add_argument("file2", help="file2")

    args=parser.parse_args()


    with open(args.file1, "rb") as file1:
        with open(args.file2, "rb") as file2:

            toWrite = "compare"+str(int(time()))+".txt"
            
            with open(toWrite, "w") as compare:

                bite1 = file1.read(1)
                bite2 = file2.read(1)
                while (bite1 and bite2):
                    if bite1 == bite2 :
                        compare.write("1")
                    else :
                        compare.write("0")
                    bite1 = file1.read(1)
                    bite2 = file2.read(1)

                print "byte wise comparision written in file: "+toWrite



    # -- end --

