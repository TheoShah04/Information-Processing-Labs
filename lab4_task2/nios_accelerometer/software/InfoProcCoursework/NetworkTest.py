import socket
import sys
import time

HOST = '127.0.0.1'  # Change this to the server’s IP if running on a different machine
PORT = 12345

try:
    client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    client_socket.connect((HOST, PORT))  # Connect to the server
    print(f"Connected to TCP server at {HOST}:{PORT}")
except Exception as e:
    print(f"Failed to connect to server: {e}")
    sys.exit(1)

state = 0  # Tracks A -> Nothing -> D cycle

while True:
    R = 0             
    W = 1
    A = 0
    S = 0
    D = 0
    impulse_slash = 0
    impulse_jab = 0

    # Cycle: A -> Nothing -> D
    if state == 0:
        A = 1  # Send "A"
        W = 0
        D = 0
        impulse_slash = 0
    elif state == 2:
        D = 1  # Send "D"
        A = 0
        W = 0
        impulse_slash = 0
    elif state == 3:
        D = 0  # Send "E"
        A = 0
        W = 0
        impulse_slash = 1
    # state == 1 means send nothing

    # Format and send data
    data_to_send = f"<Key>{W}/{A}/{S}/{D}/{impulse_slash}/{impulse_jab}/{R}/</Key>\n"
    
    try:
        client_socket.sendall(data_to_send.encode())
        print(f"Sent data to server: {data_to_send.strip()}")
    except Exception as e:
        print(f"Failed to send data to server: {e}")
        client_socket.close()
        sys.exit(1)
    
    # Move to next state (0 -> 1 -> 2 -> repeat)
    state = (state + 1) % 4

    time.sleep(2)  # Wait for half a second