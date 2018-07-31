import os
import sys
sys.path.append('/opt/udacity/opencv/lib/python3.4/dist-packages')
import cv2
import base64
import json
import subprocess
import numpy as np
from io import BytesIO
import matplotlib.image as mpimg

image_start = "BEGIN_IMAGE_f9825uweof8jw9fj4r8"
image_end = "END_IMAGE_0238jfw08fjsiufhw8frs"

image_name_prefix = "output-"
image_name_suffix = ".png"
#here's a comment
max_images = 5  # limit - no. of times imshow() calls will be entertained
num_images = 0  # counter for imshow() calls

# Import and configure matplotlib, before anything else (!)
import matplotlib
matplotlib.use('Agg')  # TODO: Configure this (and other rcParams) in ./.matplotlibrc (backend: Agg)
import matplotlib.pyplot as plt
matplotlib.rcParams['figure.figsize'] = 7.2, 4.05  # 16:9, good text size at default width (512), dpi (96)
#matplotlib.rcParams['savefig.dpi'] = 64  # make text/outlines bigger/thicker

def show(block=False, close=True):
    """Custom version of matplotlib.pyplot.show() to send plot to stdout using savefig()."""
    
    global max_images, num_images
    
    # Enforce max image limit
    if num_images >= max_images:
        print("WARNING: Exceeded max no. of images ({}), no more will be shown.".format(max_images))
        return
    num_images += 1
    
    # Store figure data as PNG image in memory (as a StringIO buffer)
    #plt.savefig('output.png')  # [debug]
    image_data = BytesIO()
    plt.savefig(image_data, format='png')  # bbox_inches='tight' messes up image size
    
    try:
        image_name = "{}{:02d}{}".format(image_name_prefix, num_images, image_name_suffix)
        #print "show(): Image name: {}".format(image_name)  # [debug]
        data = {}
        data['name'] = image_name
        data['format'] = 'png'
        data['bytes'] = base64.encodestring(image_data.getvalue()).decode('utf-8')
        dump = json.dumps(data)
        sys.stdout.write(image_start + dump + image_end)
        image_data.close()
    except Exception as e:
        print(sys.stderr, "show(): Error showing figure.")
        raise e  # should be properly handled by caller
    
    if close:
        plt.close()



def cv2_imshow(name, image):
    """Display an OpenCV image (2D NumPy array) through the Udacity IDE."""
    
    global max_images, num_images
    
    if num_images >= max_images:
        print( "WARNING: Exceeded max no. of imshow() calls ({}), no more images will be shown.".format(max_images))
        return
    num_images += 1
    
    ext = 'png'
    
    #encodedImage = cv2.cv.EncodeImage('.' + ext, cv2.cv.fromarray(image))  # OpenCV 2.3.x
    #bytes = encodedImage.tostring()
    
    retval, bytes = cv2.imencode('.' + ext, image)  # OpenCV 2.4.x
    
    output_image(name, ext, bytes)

def output_image(name, format, bytes):
    """Display an image file "output-image.png" through the Udacity IDE."""
    
    global image_start, image_end
    
    data = {}
    data['name'] = name
    data['format'] = format
    data['bytes'] = base64.encodestring(bytes)
    #print "<Image: {}>".format(name),  # [debug]
    print( image_start + json.dumps(data) + image_end)




# Method 1: Run "image_test.py", grab "output-image.png"
# Note: Students need to save final output as "output-image.png"
'''
main = subprocess.Popen(['python', 'image_test.py'], stdout=subprocess.PIPE)
out, err = main.communicate()

print out
output_image('output-image.png', 'png', open('output-image.png', 'rb').read())
'''

# Method 2: Override cv2.imshow(), import image_test
# Note: Students can call cv2.imshow() to display images
# Also, redirect stderr to StringIO buffer to be filtered later

 # override matplotlib.pyplot.show()
#plt.imshow = cv2_imshow  # override matplotlib.pyplot.show()
#import cv2
cv2.imshow = cv2_imshow  # override cv2.imshow() method
#import cv2

#with stdchannel_redirected(sys.stderr, os.devnull):


plt.show = show 
# Display the original image and binary  
import tt
plt.show()
print('')
