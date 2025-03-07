import socket
import struct

print("We're in TCP server...")
server_port = 11000
welcome_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
welcome_socket.bind(('0.0.0.0', server_port))
welcome_socket.listen(1)
print('Server running on port', server_port)

while True:
    connection_socket, caddr = welcome_socket.accept()
    print(f"Connection established with {caddr}")

    while True:  # Keep listening for messages continuously
        try:
            cmsg = connection_socket.recv(1024)
            if not cmsg:  # If no message is received, break the loop
                break

            # Unpack the received integer
            cmsg = struct.unpack("!I", cmsg)[0]
            # print(f"Received value {cmsg}")

            if cmsg == 1:
                # Respond with an integer (e.g., 1)
                connection_socket.send(struct.pack("!I", 1))
                # print("Sending value")
        
        except Exception as e:
            print(f"Error: {e}")
            break  # Break if any exception occurs

    print(f"Closing connection with {caddr}")
    connection_socket.close()  # Close connection after finishing with the client