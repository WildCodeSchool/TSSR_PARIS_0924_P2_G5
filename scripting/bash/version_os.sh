#!/bin/bash

#connection via ssh
read -p "donner le nom du client :" sshname
read -p "donner l'adresse ip du client :" sship

nomssh=$sshname
addressip=$sship

# Chemin du fichier log

filePath="./version_oslog.txt"
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



 #ssh $nomssh@$adresseip
 ssh $nomssh@$addressip lsb_release -a
echo " $date - succes demande os" >> $filePath