#!/bin/bash

# Chemin du fichier log

filePath="./install_desinstall_logiciellog.txt"
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

install_software() {
     #ssh $nomssh@$adresseip
    read -p "nom du logiciel" nom_install
    sudo apt update
    sudo apt install -y "$nom_install"
      echo " $date - le fichier $nom_install est installé " >> $filePath
}

uninstall_software() {
     #ssh $nomssh@$adresseip
    read -p "nom du logiciel" nom_desinstall
    sudo apt remove -y "$nom_desinstall"
    echo " $date - le fichier $nom_install est desinstallé " >> $filePath
}

while true; do
    clear
    read -p "Choisissez une option : 
    1) installer logiciel
    2) désinstaller logiciel
    3) quitter

    Votre choix : " choix

    case $choix in
        1)
            install_software
            ;;
        2)
            uninstall_software
            ;;
        3)
            quitter
            echo "Au revoir!"
            exit 0
            ;;
        *)
            echo "Choix invalide."
            ;;
    esac
    done