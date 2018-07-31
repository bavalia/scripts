import subprocess


#subprocess.check_call(['bash', 'unixCommands.txt'])
#subprocess.check_call(['bash', 'bashShell.sh'])
if(subprocess.check_call(['bash', 'bashShell.sh']) != 0):
    print subprocess.check_call(['bash', 'bashShell.sh'])

    