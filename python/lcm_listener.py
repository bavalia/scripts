import lcm

# lcm-gen -p *.lcm  # generate struct/class for python for given dataset in lcm
from exlcm import example_t

def my_handler(channel, data):
    msg = example_t.decode(data)
    print("Received message on channel \"%s\"" % channel)
    print("   timestamp   = %s" % str(msg.timestamp))
    print("   position    = %s" % str(msg.position))
    print("   orientation = %s" % str(msg.orientation))
    print("   ranges: %s" % str(msg.ranges))
    print("   name        = '%s'" % msg.name)
    print("   enabled     = %s" % str(msg.enabled))
    print("")

# Listen over default ip, port
# lc = lcm.LCM()
# lc = lcm.LCM("udpm://239.255.76.67:7667?ttl=0")

# Listen over default ip,port + specified ip (both)
# ttl=0 affects only sender
# ip range should be 224.0.0.0 through 239.255.255.255 for multimedia UDP  
# #TODO how this IP address works, no need to set manual ip!! why??
# lc = lcm.LCM("udpm://239.255.76.87:7667")

subscription = lc.subscribe("EXAMPLE", my_handler)

try:
    while True:
        lc.handle()
except KeyboardInterrupt:
    pass

lc.unsubscribe(subscription)
