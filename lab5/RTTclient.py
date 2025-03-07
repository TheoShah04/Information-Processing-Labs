import socket
import time
import struct

print("We're in tcp client...") #the server name and port client wishes to access
server_name = '18.132.9.98' #'52.205.252.164'
server_port = 11000 #create a TCP client socket
client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM) #Set up a TCP connection with the server #connection_socket will be assigned to this client on the server side
client_socket.connect((server_name, server_port))
print("Measuring RTT over 500 instances")
totalTime = 0
for _ in range(500) :
    start_time = time.time()
    client_socket.send(struct.pack("!I", 1))
    msg = client_socket.recv(1024)
    end_time = time.time()
    totalTime += (end_time - start_time) * 1000
    time.sleep(0.01)
print("Average time: ", totalTime/500, "ms")
client_socket.close()