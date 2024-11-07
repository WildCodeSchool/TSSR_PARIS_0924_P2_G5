#!/bin/bash

filePath="./droits_permissions_utilisateurslog.txt"
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

# Fonction pour afficher Groupe d'appartenace d'un utilisateur
dossier_utilisateur(){
    #ssh $nomssh@$adresseip
    read -p "donnez le nom du dossier" dossier
    ls -l "$dossier"
    echo " $date - droit sur le dossier  $dossier affiché  " >> $filePath
}

# Fonction pour afficher historique des commandes exécutées par l'utilisateur 

fichier_utilisateur(){
    #ssh $nomssh@$adresseip
    read -p "donnez le nom du fichier" fichier
   ls -ld "$fichier"
 echo " $date - droit sur le fichier $fichier affiché " >> $filePath
}



# Menu des options d'historique d'activités utilisateur

while true; do
    clear
    echo "=== Historique des activités utilisateur ==="
    echo "1. Droits/permissions de l'utilisateur sur un dossier"
    echo "2. Droits/permission de l'utilisateur sur un fichier"
    echo "3. Retour"
    read -p "Choisissez une option: " choice

    case $choice in
        1) dossier_utilisateur ;;
        2) fichier_utilisateur ;;
        3) echo "Retour au menu principal..." ;;
        *) echo "Choix invalide !"  ;;
    esac
done

# Appel du menu principal pour lancer le script

