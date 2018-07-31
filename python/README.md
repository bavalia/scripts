# Pip Libraries
* pynupt    # Monitor and control user input devices, keyboard and mouse
** # https://pypi.python.org/pypi/pynput 
* keyboard
* mouse
* PIL       # pillow library for image processing
** ImageGrab    # windows only, capture screen
* pyscreenshot  # ImageGrab alternative on linux # 1.5 Hz
* mss       # capture screen # 50-100 Hz, 100 times faster than pyscreenshot
* flask-socketio    # flaskio, low latency bi-directional comunication 
* eventlet  # concurrent networking library, backend for flaskio
* socketio-client   # a client for socketio flask server
* lcm       # light communication library
**          # sudo ldconfig
            # sender needs : lcm.LCM("udpm://?ttl=1")
            # default ip = lcm.LCM("udpm://239.255.76.67:7667?ttl=1")
            # https://lcm-proj.github.io/type_specification.html

**          # https://lcm-proj.github.io/tut_python.html
**          # https://lcm-proj.github.io/group__LcmC__lcm__t.html#gaf29963ef43edadf45296d5ad82c18d4b 
**          # https://groups.google.com/forum/#!topic/lcm-users/0w5sX9TXilc
        
        
# Default Libraries
* time      # sleep(seconds), wait
