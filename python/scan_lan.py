#!/usr/bin/python
# -*- coding: utf-8 -*-
import time,datetime
from threading import Thread
from Queue import *
from math import *
import socket, sys, json, collections
from struct import *
from PyQt4 import QtGui,QtCore
import dpkt,MySQLdb

q = Queue()
count= 0
num_worker_threads=8
time_stamp = str(datetime.datetime.now())
time_stamp1 = str(datetime.datetime.now())    # gives current time info upto milliseconds
print time_stamp1
num = time_stamp
def worker():
    while True:
        def ip4_addr (a) :                      # this function decodes the given values to correponding MAC address.
          b = "%.2x:%.2x:%.2x:%.2x:%.2x:%.2x" % (ord(a[0]) , ord(a[1]) , ord(a[2]), ord(a[3]), ord(a[4]) , ord(a[5]))
          return b

        def ip6_addr (a) :                      # this function decodes the given values to correponding MAC address.
          b = "%.4x:%.4x:%.4x:%.4x:%.4x:%.4x:%.4x:%.4x" % (ord(a[0]) , ord(a[1]) , ord(a[2]), ord(a[3]), ord(a[4]) , ord(a[5]), ord(a[6]), ord(a[7]))
          return b
          
        def HTTP(data):                         # decoding and processing the HTTP packets.
            #print data
            
            """if tp=='request':
                    print "request data"
                    try:
                            tmp = dpkt.http.Request(data)
                            #print tmp
                    except dpkt.dpkt.NeedData:
                            return 0
                    except dpkt.dpkt.UnpackError:
                            return 0
            else:
                    print "response data "
                    try:    
                            tmp = dpkt.http.Response(data)
                            #print tmp
                    except dpkt.dpkt.NeedData:
                            return 0
                    except dpkt.dpkt.UnpackError:
                            return 0
            """
            #print len(data)
            #print data
            #print time_db
            cur.execute("insert into http values ('%s', '%s')"%(time_db,data))
            db.commit()


        def DNS(data):                                 # used for decoding DNS packets
            dns_length = 12                            # DNS header length is 12
            dns=dpkt.dns.DNS(data)                     # using dpkt to decode DNS packets.
            pack_id =  dns.id                          # getting packet id
            opcode = dns.get_opcode()                  # getting operation code
            dns_type = dns.get_qr()                    # getting the type of DNS request
            if dns_type == 0:                       
                query = 'query'
            else:
                query = 'response'
            #print time_db
            cur.execute("insert into dns values ('%s', %d, '%s', %d)"%(time_db,pack_id,query,opcode))                  #making database entry corresponding to the DNS packet recieved.
            db.commit()                                 # committing the changes to the database.
            

        def UDP(data):                                     #   used for decoding UDP packets, header length is 8.
            udph_length = 8                                #   udp header length
            udp = dpkt.udp.UDP(data)                       #   using dpkt decode UDP packets
            sport = udp.sport                              #   source port for the UDP connection
            dport = udp.dport                              #   destination port for the UDP connection
            if dport == 53 or sport == 53:                 #   if source or destination port is 53 then it is a DNS packet
                ptype='DNS'
                DNS(data[udph_length:])
            length = udp.ulen                              #   Length of packet after removing eth and IP header  
            checksum = udp.sum                             #   Check sum for the packet
            #print time_db
            cur.execute("insert into udp values ('%s', %d,%d,%d,%d)"%(time_db,sport,dport,length,checksum))               #     inserting data into the UDP table
            db.commit()         #commiting the database record


        def TCP(data):                                          #   used for decoding TCP packets, header length is 20
            tcp = dpkt.tcp.TCP(data)                            #   using dpkt to decode TCP packets.
            sport = tcp.sport                                   #   source port for TCP connection.
            dport = tcp.dport                                   #   destination port for TCP connection.
            seq = tcp.seq                                       #   Sequence Number of TCP packet                                     
            ack = tcp.ack                                       #   this number is of some previous packet whose acknowledgement is being sent from the other end.
            doff_res = tcp.off                             
            if dport == 80 or sport == 80:                      #   if source port or destination port are 80 then it is a HTTP packet and processed accordingly.
                ptype= 'HTTP'                           
                HTTP(tcp.data)
            #print time_db
            cur.execute("insert into tcp values ('%s', %d, %d,%d,%d,%d)"%(time_db,sport,dport,seq,ack,doff_res))                   #   storing the information into the UDP table.
            db.commit()                                         # committing the database records



        def ICMP(data):                                         # used for decoding ICMP packets.
            icmp = dpkt.icmp.ICMP(data)                         
            icmp_type = icmp.type
            code = icmp.code
            checksum = icmp.sum
            data=icmp.data
            '''icmph_length = 4
            icmp_header = packet[u:u+4]
            icmph = unpack('!BBH' , icmp_header)
            icmp_type = icmph[0]
            code = icmph[1]
            checksum = icmph[2]'''
            print 'Type : ' + str(icmp_type) + ' Code : ' + str(code) + ' Checksum : ' + str(checksum) + 'data:' + data
            '''h_size = eth_length + iph_length + icmph_length
            data_size = len(packet) - h_size
            data = packet[h_size:]


            ip_header = packet[eth_length:20+eth_length]
            iph = unpack('!BBHHHBBH4s4s' , ip_header)

            version_ihl = iph[0]
            version = version_ihl >> 4
            ihl = version_ihl & 0xF
            iph_length = ihl * 4

            ttl = iph[5]
            protocol = iph[6]
            src = socket.inet_ntoa(iph[8]);
            dst = socket.inet_ntoa(iph[9]);
            hdr_length= eth_length + iph_length'''

        quit = False
        while not q.empty():
		#print "not quit"
	        db = MySQLdb.connect(host="localhost", user="root1", passwd="hi", db="pack_sniff")
	        cur = db.cursor()
	        try:
	        	packet = q.get()
	        except q.empty :
		    	sys.exit(0)
		        #print packet[1]
	        packet = packet[0] 
	                               # we get two values out of which only the one is of use right now
	        time_db = str(datetime.datetime.now())
	        eth = dpkt.ethernet.Ethernet(packet)        # using dpkt to decode ethernet header
	        eth_length = 14                             # default ethernet header length
	        eth_protocol = socket.ntohs(eth.type)       # .type gives us the type of ethernet header and we use ntohs to make it use readeable
	        if eth_protocol == 8:
	            eth_type = 'ipV4'
	        elif eth_protocol == 1544:
	            eth_type = 'ARP'
	        elif eth_protocol == 56710:
	            eth_type = 'ipV6'
	        else:
	            eth_type = 'other' 
	        src_mac = ip4_addr(eth.src)                 # MAC address of source 
	        dst_mac = ip4_addr(eth.dst)                 # MAC address of destination
	        size = len(packet)
	        #print time_db
	        cur.execute("insert into eth values ('%s', '%s', '%s',%d, '%s')"%(time_db,src_mac,dst_mac,size,eth_type))
	        #print "entry to eth done"
	        db.commit()
	        if eth_protocol == 8 :                                 # if the ethernet protocol is 8 then it is an IP(internet protocol).
	                ip = dpkt.ip.IP(packet[eth_length:])           # using dpkt to decode ipv4 packets
	                iph_length = ip.hl * 4                         # gives us the length ip header
	                ttl = ip.ttl                                   # gives us the time to live
	                protocol = ip.p                                # gives us the protocol version
	                src = socket.inet_ntoa(ip.src)                 # .src gives us ip address of the source which we convert to human readable by inet_ntoa
	                dst = socket.inet_ntoa(ip.dst)                 # .dst gives us ip address of the source which we convert to human readable by inet_ntoa
	                if src == "127.0.0.1" or src == "127.0.1.1":   # ignoring the loopback packets
	                    continue
	                hdr_length= eth_length + iph_length            # total header size including ethernet header and ipv4 header
	                if protocol == 17:                             # if protocol number is 17 then the packet type is UDP and corresponding function is being called
	                    ptype = 'UDP'
	                    UDP(packet[hdr_length:])
	                elif protocol == 6:                            # if protocol number is 6 then the packet type is TCP and corresponding function is being called
	                    ptype = 'TCP'
	                    TCP(packet[hdr_length:])
	                elif protocol == 1 :                           # if protocol number is 1 then the packet type is ICMP and corresponding function is being called
	                    ptype = 'ICMP'
	                    ICMP(packet[hdr_length:])
	                else:
	                    ptype = 'Other'                            # all other packets are ignored as they are not of our concern
	                #self.signal.emit(str(src),str(dst),size,time_db,ptype)
	                cur.execute("insert into packet values ('%s', '%s', '%s', '%s')"%(time_db,src,dst,ptype))
	                db.commit()
	        elif eth_protocol == 1544:                             # if the ethernet protocol number is 1544 then it is an ARP packet and processed accordingly
	                arp=dpkt.arp.ARP(packet[eth_length:])
	                operation = arp.op                                      #   type of communication
	                if  operation== 1:                                     
	                    arp_type="REQUEST"
	                elif operation == 2:
	                    arp_type= "REPLY"
	                elif operation == 3:
	                    arp_type= "REVREQUEST"
	                elif operation == 4:
	                    arp_type= "REVREPLY"
	                src_hw = ip4_addr(arp.sha)                            #    source hardware address
	                src = socket.inet_ntoa(arp.spa)                    #    source internet protocol address
	                dst_hw = ip4_addr(arp.tha)                            #    target hardware address 
	                dst = socket.inet_ntoa(arp.tpa)                    #    target internet protocol address
	                ptype='ARP'
	                #self.signal.emit(str(src),str(dst),len(packet),time_db,ptype)
	                #print time_db
	                cur.execute("insert into arp values ('%s', '%s')"%(time_db,arp_type))               # making enteries in database corresponding to ARP packet recieved.
	                cur.execute("insert into packet values ('%s', '%s', '%s', '%s')"%(time_db,src,dst,ptype))                                   # making enteries in database corresponding to ARP packet recieved.
	                db.commit() 
	        elif eth_protocol == 56710:                            # if the ethernet protocol number is 56710 then it is an ipV6 packet and processed accordingly
	                '''temp= dpkt.ip6.IP6(packet[eth_length:])
	                src = ip6_addr(temp.src)
	                dst = ip6_addr(temp.dst)
	                data = temp.data
	                hoplim = temp.hlim
	                flowlabel = temp.flow
	                traffic_classes = temp.fc
	                packetlen =  temp.plen
	                cur.execute("insert into ipV6 values ('%s', '%s', %s', '%s', %d, %d, %d, %d)" % (time_db, src, dst, data, hoplim, flowlabel, traffic_classes, packetlen) )
	                db.commit()'''
	        print q.qsize()
		type(q.qsize())
	        db.close()
	        if q.qsize() == 0:
			#print "thread closed"
	        	quit = True
	        q.task_done()

for i in range(num_worker_threads):
	t = Thread(target=worker)
	t.daemon = True
	t.start()


while (fabs(int(time_stamp1[17])-int(time_stamp[17]))!=1):
	print "catching"
	s = socket.socket( socket.AF_PACKET , socket.SOCK_RAW , socket.ntohs(0x0003))
	packet = s.recvfrom(65565)             # it recives raw packets form the NIC of maximum size 65565.
	q.put(packet)
	time_stamp = str(datetime.datetime.now())    # gives current time info upto milliseconds
	#print time_stamp
	count = count+1
	#print count

print "waiting for main queue."
print time_stamp
print count
print num
if q.empty():
	print "yes"
else:
	print q.qsize()
q.join()       # block until all tasks are done
