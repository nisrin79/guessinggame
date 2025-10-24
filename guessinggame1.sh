#!/bin/bash

guess_number() {
    local target=$1
    local guess

    while true; do
        read -p "Devinez combien de fichiers sont dans le répertoire actuel : " guess
        
        if ! [[ "$guess" =~ ^[0-9]+$ ]]; then
            echo "Veuillez entrer un nombre valide."
            continue
        fi

        if [ "$guess" -lt "$target" ]; then
            echo "Trop bas ! Essayez encore."
        elif [ "$guess" -gt "$target" ]; then
            echo "Trop haut ! Essayez encore."
        else
            echo "Félicitations ! Vous avez deviné le nombre correct de fichiers : $target"
            break
        fi
    done
}

file_count=$(ls -1 | wc -l)
echo "Bienvenue dans le jeu 'Devinez le nombre de fichiers' !"
guess_number "$file_count"
