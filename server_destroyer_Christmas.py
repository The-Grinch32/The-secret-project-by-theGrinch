import socket
import sys
import time

# --- Fictive Configuration ---
TARGET_HOST = 'santa-server-prod.northpole'    # Target address (fictive)
TARGET_PORT = 443                              # Target port (HTTPS)
PACKET_SIZE = 1024                             # Size of packets to send (not used directly here, but kept for configuration)
MAX_ATTEMPTS = 5                               # Number of attempts

def launch_flood(host, port, attempts):
    """Simulates sending a flood of data to the target server."""
    try:
        # Creating a TCP/IP socket
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        
        # Connection attempt (the fictive server won't exist, this will be fast)
        s.settimeout(2)
        s.connect((host, port))
        
        print(f"Connection established to {host}:{port} (Simulation).")
        
        # Sending the fictive payload
        payload = b"GET /admin/verify_sleigh_load HTTP/1.1\r\n\r\n"
        
        for i in range(attempts):
            s.sendall(payload)
            print(f"Packet {i+1}/{attempts} sent. Overload in progress...")
            time.sleep(0.1) # Small pause to make the simulation visible
        
        print("\nOverload simulation finished. The server held up.")
        s.close()
        
    except socket.error as e:
        print(f"\n--- Active Decoy ---")
        print(f"Connection or socket error: {e}")
        print("Santa's servers are too well protected!")
        print("Hint: Maybe the script is using an old protocol or a bad target.")

if __name__ == "__main__":
    print("Starting the DDoS simulation on the Toy Factory servers...")
    launch_flood(TARGET_HOST, TARGET_PORT, MAX_ATTEMPTS)
