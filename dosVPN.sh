#!/bin/bash

# Função para gerar um IP aleatório
generate_random_ip() {
  ip_parts=""
  for _ in {1..4}; do
    ip_parts="$ip_parts.$((RANDOM % 256))"
  done
  echo "${ip_parts:1}"
}

# Função para escolher um fuso horário aleatório
choose_random_timezone() {
  timezones=($(timedatectl list-timezones))
  random_index=$((RANDOM % ${#timezones[@]}))
  echo "${timezones[$random_index]}"
}

# Limpar a tela
clear

# Exibir o banner
echo "WeAreDedSec"
echo
echo "Author   : Wrench"
echo "Instagram : @jeanseven"
echo "github   : https://github.com/Jeanpseven"
echo "[+] https://github.com/Jeanpseven/Dr4xVPN activated"
echo
echo "Este script permite usar um IP ou uma URL como alvo."
echo

# Solicitar o alvo (pode ser um IP ou URL)
read -p "IP Target or URL: " target

# Solicitar a porta de destino
read -p "Port       : " port

# Exibir mensagem de início
clear
echo "Cyber Bombing Started"
echo

# Inicializar variáveis para a mudança de IP e fuso horário
ip=""
port_start="$port"

# Loop para alterar o IP e o fuso horário a cada 5 segundos
while true; do
  new_ip=$(generate_random_ip)
  new_timezone=$(choose_random_timezone)

  # Alterar o IP
  if [ "$ip" != "$new_ip" ]; then
    ip="$new_ip"
    echo "IP alterado para $ip"
    # Comando para alterar o IP aqui (exemplo: ifconfig eth0 $ip)
  fi

  # Alterar o fuso horário
  echo "Fuso horário alterado para $new_timezone"
  timedatectl set-timezone "$new_timezone"

  # Aguarde 5 segundos antes da próxima alteração
  sleep 5
done
