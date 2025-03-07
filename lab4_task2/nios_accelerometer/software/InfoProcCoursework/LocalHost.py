import socket

HOST = '127.0.0.1'  # Localhost
PORT = 12345        # Port to listen on

# Create a TCP socket
server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server_socket.bind((HOST, PORT))  # Bind to the specified host and port
server_socket.listen(1)  # Listen for one connection at a time

print(f"Server listening on {HOST}:{PORT}...")

conn, addr = server_socket.accept()  # Accept an incoming connection
print(f"Connected by {addr}")

# Keep receiving and printing data
try:
    while True:
        data = conn.recv(15)  # Receive up to 15 bytes of data. 7 integers and 1 newline character.
        if not data:
            break  # Stop if no data is received (client disconnected)
        
        received_data = data.decode().strip()
        print(f"Received: {received_data}")  # Print the received message

except KeyboardInterrupt:
    print("\nServer shutting down...")

finally:
    conn.close()  # Close the connection
    server_socket.close()  # Close the server socket
