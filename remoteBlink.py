from pyfirmata2 import Arduino
import time

# Make sure to change the port to match your Arduino's port
PORT = '/dev/ttyACM0'  # Change this to your Arduino's port

# Use 'Arduino.AUTODETECT' to automatically detect the port
# board = Arduino(Arduino.AUTODETECT)

board = Arduino(PORT)

# Define the pin for the LED
led_pin = 13  # Most Arduinos have the built-in LED on pin 13

print("Starting to blink LED. Press CTRL+C to stop.")

try:
    while True:
        board.digital[led_pin].write(1)  # Turn LED on
        time.sleep(1)
        board.digital[led_pin].write(0)  # Turn LED off
        time.sleep(1)
except KeyboardInterrupt:
    print("\nProgram stopped by user")
finally:
    board.exit()
    print("Connection to Arduino closed")
