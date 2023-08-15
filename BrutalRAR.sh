#!/bin/bash

sudo apt install lolcat
clear
cat banner.txt | lolcat
generate_password() {
    local length="$1"
    local chars="$2"
    local password=""

    for i in $(seq 1 "$length"); do
        password="$password${chars:$(($RANDOM % ${#chars})):1}"
    done

    echo "$password"
}

display_help() {
    echo ""
    echo ""
    echo "Uso: $0 -i interesses -q quantidade -p arquivo.rar -f arquivo_ou_pasta -t tamanho_min,tamanho_max"
    echo ""
    echo "Opções:"
    echo ""
    echo "  -i interesses      Lista de interesses para gerar senhas"
    echo "  -q quantidade      Número de senhas a serem geradas e testadas"
    echo "  -p arquivo.rar     Arquivo RAR protegido por senha"
    echo "  -f arquivo_ou_pasta Arquivo ou pasta de destino para a descompactação"
    echo "  -t tamanho_min,tamanho_max   Tamanhos mínimo e máximo da senha"
    echo "  -h                 Exibir esta mensagem de ajuda"
    echo ""
    exit 0
}

if [ $# -lt 6 ]; then
    display_help
fi

while getopts ":i:q:p:f:t:h" opt; do
    case $opt in
        i)
            interests="$OPTARG"
            ;;
        q)
            quantity="$OPTARG"
            ;;
        p)
            rar_file="$OPTARG"
            ;;
        f)
            target_file="$OPTARG"
            ;;
        t)
            IFS=',' read -r -a password_lengths <<< "$OPTARG"
            ;;
        h)
            display_help
            ;;
        \?)
            exit 1
            ;;
        :)
            exit 1
            ;;
    esac
done

IFS=',' read -r -a interest_array <<< "$interests"
first_interest="${interest_array[0]}"
cleaned_first_interest=$(echo "$first_interest" | tr -d ', ')
available_chars="${cleaned_first_interest}abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()_-+=<>?"

combined_passwords=()
for ((i = 1; i <= 5; i++)); do
    if [ $i -eq 1 ]; then
        combined_passwords+=("${cleaned_first_interest}${interest_array[$i]}")
    else
        for interest in ${interest_array[@]:1}; do
            combined_passwords+=("${cleaned_first_interest}${interest}")
        done
    fi
done

all_passwords=()
for ((i = 1; i <= quantity; i++)); do
    if [ $i -le ${#combined_passwords[@]} ]; then
        generated_password="${combined_passwords[$((i-1))]}"
    else
        password_length=$((password_lengths[0] + RANDOM % (password_lengths[1] - password_lengths[0] + 1)))
        generated_password=$(generate_password "$password_length" "$available_chars")
    fi

    all_passwords+=("$generated_password")

    output=$(unrar t -p"$generated_password" "$rar_file" 2>&1)
    success_message="All OK"
    error_message="Incorrect password for"

    if [[ "$output" == *"$success_message"* ]]; then
        echo "Senha correta encontrada: $generated_password"
        exit 0
    elif [[ "$output" != *"$error_message"* ]]; then
        sleep 3
    fi
done

echo "Senhas testadas:"
for password in "${all_passwords[@]}"; do
    echo "$password"
done

echo "Todas as senhas testadas falharam."
exit 1
