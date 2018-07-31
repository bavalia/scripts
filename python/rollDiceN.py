#! /usr/bin/python3

'''
Gives the rolling of a dice with N face, default is N=6

usage: ./rollDiceN [N]
'''
import argparse
import random

class NotAnInteger(Exception):
    pass

def rollDiceN (N=6):
  '''
  returns a tuple with 1st value as rolled dice and 2nd value as total face of dice
  '''
  if (isinstance(N, int) and (N>0)):
    return random.randint(1,N), N
  else:
    raise NotAnInteger("Number of sides of dice is not a positive integer, received N = " + str(N))
  return 0  


if __name__=='__main__':
    parser=argparse.ArgumentParser(description='rolls a dice with N face, default N=6')
    parser.add_argument("N", default=6, type=int, nargs='?' , help="number of faces of a dice ")
    args=parser.parse_args()

    diceN = args.N
    #print (args)
    
    roll = rollDiceN(diceN)
    print ("Rolling dice of face N = %d ... result = %d" % (roll[1],roll[0]))
   
    # -- end --
