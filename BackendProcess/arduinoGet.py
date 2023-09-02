import serial
import hashlib

# Define the serial port and baud rate for your Arduino
ser = serial.Serial('/dev/ttyUSB0', baudrate=9600)

# Create a SHA-1 hash object
sha1_hash = hashlib.sha1()

try:
    while True:
        # Read a line from the serial port
        line = ser.readline().decode('utf-8').strip()
        
        # Update the hash object with the received data
        sha1_hash.update(line.encode('utf-8'))
        
        # Print the received data and its SHA-1 hash
        print(f"Received: {line}")
        print(f"SHA-1 Hash: {sha1_hash.hexdigest()}")

except KeyboardInterrupt:
    # Handle Ctrl+C to gracefully exit the program
    ser.close()
    print("Serial communication closed.")