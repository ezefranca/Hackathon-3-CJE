# from time import sleep
# import serial
# ser = serial.Serial('/dev/tty.usbmodem1411', 9600) # Establish the connection on a specific port
# counter = 32 # Below 32 everything in ASCII is gibberish
# while True:
#      counter +=1
#      ser.write(str(chr(counter))) # Convert the decimal number to ASCII then send it to the Arduino
#      print ser.readline() # Read the newest output from the Arduino
#      sleep(.1) # Delay for one tenth of a second
#      if counter == 255:
#      	counter = 32
#!/usr/bin/python
import serial
import syslog
import time

#The following line is for serial over GPIO
port = '/dev/tty.usbmodem1411' # note I'm using Mac OS-X


ard = serial.Serial(port,9600,timeout=5)
time.sleep(2) # wait for Arduino

i = 0

while (i < 40):
    # Serial write section

    setTempCar1 = 63
    setTempCar2 = 37
    ard.flush()
    setTemp1 = str(setTempCar1)
    setTemp2 = str(setTempCar2)
    print ("Python value sent: ")
    print (setTemp1)
    ard.write(setTemp1)
    time.sleep(1) # I shortened this to match the new value in your Arduino code

    # Serial read section
    msg = ard.read(ard.inWaiting()) # read all characters in buffer
    print ("Message from arduino: ")
    print (msg)
    i = i + 1
else:
    print "Exiting"
exit()