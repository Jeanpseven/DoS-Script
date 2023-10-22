#!/bin/bash

echo "Author   : Wrench"
echo "Instagram : @jeanseven"
echo "github   : https://github.com/Jeanpseven"
echo "[+] https://github.com/Jeanpseven/Dr4xVPN activated"

while true; do
    read -p "IP Target or URL: " target
    read -p "Port       : " port

    clear
    echo "Cyber Bombing Started"

    sent=0
    success=false

    variations=("$target" "www.$target" "http://$target" "https://$target")

    for variation in "${variations[@]}"; do
        if ip=$(getent ahosts "$variation" | awk '{print $1}' | head -n 1); then
            success=true
            break
        else
            echo "Erro de resolução de nome de host para a variação: $variation"
        fi
    done

    if [ "$success" = true ]; then
        while true; do
            echo "Sent $sent packet to $ip through port:$port"
            sent=$((sent+1))
            port=$((port+1))
            if [ "$port" -eq 65534 ]; then
                port=1
            fi
        done
    else
        echo "Não foi possível resolver o nome de host. Verifique sua conexão à internet e o nome de host."
    fi

    # Loop para alterar o IP e o fuso horário a cada 5 segundos
    while true; do
        new_ip="$(shuf -i 0-255 -n 4 | tr '\n' '.' | sed 's/\.$//')"
        new_timezone=$(timedatectl list-timezones | shuf -n 1)

        # Alterar o IP
        ifconfig eth0 "$new_ip"

        # Alterar o fuso horário
        timedatectl set-timezone "$new_timezone"

        echo "IP alterado para $new_ip, Fuso horário alterado para $new_timezone"

        # Aguarde 5 segundos antes da próxima alteração
        sleep 5
    done
done
