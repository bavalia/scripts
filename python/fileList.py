import glob
import natsort
import os

folder = "imgs_R/"
FPS = 15

imgPattern = folder + "img*"
files = glob.glob(imgPattern)
files = natsort.natsorted(files)

i=0.0
with open(folder[:-1] +".txt", 'w') as f:
    for file in files:
        text = "%.6f " %(i/FPS) + file + "\n"
        f.write(text)
        i += 1

# N = int(os.popen("ls " + folder + " |wc -l").readline())
# print (N)
