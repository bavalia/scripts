#!/usr/bin/python3

def getChar():
    try:
        # for Windows-based systems
        import msvcrt # If successful, we are on Windows
        return msvcrt.getch()

    except ImportError:
        # for POSIX-based systems (with termios & tty support)
        import tty, sys, termios  # raises ImportError if unsupported

        fd = sys.stdin.fileno()
        oldSettings = termios.tcgetattr(fd)

        try:
            tty.setraw(fd)
            answer = sys.stdin.read(1)
        finally:
            termios.tcsetattr(fd, termios.TCSADRAIN, oldSettings)

        return answer

# Program starts

time = {'min':0,'hour':0}

def increment():
    if time['min']==59 :
        time['min']=00
        if time['hour']==23:
            time['hour']=00
        else : time['hour']+=1
    else : time['min']+=1

def decrement():
    if time['min']==00:
        time['min']=59
        if time['hour']==00:
            time['hour']=23
        else : time['hour']-=1
    else : time['min']-=1

def printTime():
    print ("%02d:%02d" %(time['hour'], time['min']))


print ("Press 'i' to increament clock, 'd'to decrement, 'q' to quit.")
printTime()

for n in range(1000) :
    ch = getChar()
    arrow = '\x00'
    if ch=='\x1b':
        getChar()
        arrow = getChar()

    if ch=='i' or arrow=='A': increment()
    elif ch=='d' or arrow=='B': decrement()
    elif ch=='q': break

    printTime()

