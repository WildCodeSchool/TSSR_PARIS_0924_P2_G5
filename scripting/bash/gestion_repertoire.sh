#!/bin/bash

filePath="./gestion_repertoire.txt"
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

# Fonction pour créer un répertoire
function create {
     #ssh $nomssh@$adresseip
    read -p "Donnez un nom à votre répertoire : " nom

    # Vérifier si le répertoire n'existe pas
    while true; do
        if [ ! -e "$nom" ]; then
            mkdir "$nom"
            echo "Le dossier est créé."
            echo " $date - Le dossier $nom est créé " >> $filePath
        exit 0
        else 
            echo "Ce dossier existe déjà."
            read -p "Voulez-vous essayer un autre nom ? (o/n) : " reessayer
            if [[ "$reessayer" != "o" ]]; then
                break
            fi
        fi 
    done
}

# Fonction pour modifier un répertoire
function modified {
     #ssh $nomssh@$adresseip
    while true; do
        read -p "Quel répertoire voulez-vous modifier : " nomrep
        if [ ! -e "$nomrep" ]; then
            echo "Ce dossier n'existe pas."
        else
            while true; do
                read -p "Quel nouveau nom voulez-vous donner à \"$nomrep\" : " newname
                if [ ! -e "$newname" ]; then
                    mv "$nomrep" "$newname"
                    echo "Le nom a été modifié."
                     echo " $date - Le dossier $nomrep a été renommé $newname " >> $filePath
                
                else
                    echo "Ce dossier existe déjà."
                fi
            done
        fi 
    done  
}

# Fonction pour supprimer un répertoire
function delete {
     #ssh $nomssh@$adresseip
    while true; do
        read -p "Quel répertoire voulez-vous supprimer : " repsup
        if [ -e "$repsup" ]; then
            rm -r "$repsup"
            echo "Le répertoire a été supprimé."
             echo " $date - Le dossier $repsup a été supprimé " >> $filePath
            break
        else
            echo "Ce dossier n'existe pas."
        fi
    done
}

# Menu principal

while true; do
    clear
    read -p "Choisissez une option : 
    1) Créer un dossier
    2) Modifier un dossier
    3) Supprimer un dossier
    4) Quitter
    Votre choix : " choix

    case $choix in
        1)
            create
            ;;
        2)
            modified
            ;;
        3)
            delete
            ;;
        4)
            echo "Au revoir!"
            exit 0
            ;;
        *)
            echo "Choix invalide."
            ;;
    esac
done
