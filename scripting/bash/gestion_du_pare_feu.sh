#!/bin/bash

# Connexion via SSH
read -p "Donner le nom du client : " sshname
read -p "Donner l'adresse IP du client : " sship

nomssh=$sshname
addressip=$sship

filePath="./gestion_du_pare_feu.txt"
# Date actuelle
date=$(date)

# Fonction pour créer un fichier log
create_file() {
    # Vérifie si le fichier existe
    if [ ! -f "$filePath" ]; then
        # Crée le fichier
        touch "$filePath"
        echo "Fichier '$filePath' créé avec succès."
        # Ajoute un message de création avec la date dans le fichier
        echo "$date - Fichier créé" >> "$filePath"
    else
        echo "Le fichier '$filePath' existe déjà." > /dev/null
    fi
}

# Appel de la fonction
create_file

# Fonction pour désactiver le pare-feu
function desactiver {
    ssh $nomssh@$addressip <<EOF
    sudo ufw disable
    ufw status
EOF
    echo "$date - Le pare-feu est désactivé" >> $filePath
}

# Fonction pour activer le pare-feu
function activer {
    ssh $nomssh@$addressip <<EOF
    sudo ufw enable
    ufw status
EOF
    echo "$date - Le pare-feu est activé" >> $filePath
}

# Menu principal
while true; do
    clear
    read -p "Choisissez une option : 
    1) Désactiver le pare-feu
    2) Activer le pare-feu
    3) Quitter

    Votre choix : " choix

    case $choix in
        1)
            desactiver
            ;;
        2)
            activer
            ;;
        3)
            echo "Au revoir!"
            exit 0
            ;;
        *)
            echo "Choix invalide."
            ;;
    esac
done
