"""Blink the LED, works as the Mendel user. Other users need permission to RW the GPIO"""
from periphery import GPIO
import time

LED_Pin = 73  # Physical Pin-16 is GPIO 73

# Open GPIO /sys/class/gpio/gpio73 with output direction
LED_GPIO = GPIO(73, "out")

while True:
    try:  # Blink the LED
        LED_GPIO.write(True)
        # Send HIGH to switch on LED
        print("LED ON!")
        time.sleep(0.5)
        LED_GPIO.write(False)
        # Send LOW to switch off LED
        print("LED OFF!")
        time.sleep(0.5)
    except KeyboardInterrupt:
        # Turn LED off before stopping
        LED_GPIO.write(False)
        break
    except IOError:
        print("Error")
        LED_GPIO.close()
