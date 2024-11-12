#!/bin/bash

#connection via ssh
read -p "donner le nom du client :" sshname
read -p "donner l'adresse ip du client :" sship

nomssh=$sshname
addressip=$sship

# Chemin du fichier log

filePath="./information_ramlog.txt"
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

# Fonction pour afficher la date de la dernière connexion de l'utilisateur
connexion_utilisateur(){
     #ssh $nomssh@$adresseip
   ssh $nomssh@$addressip last -n 1
    echo " $date - information date de la derniere connexion de l'utilisateur" >> $filePath
    exit 0
}

# Fonction pour afficher la date de dernière modification du mot de passe d'un utilisateur
motDePasse_utilisateur(){
     #ssh $nomssh@$adresseip
    read -p "Nom de l'utilisateur: " nom
     ssh $nomssh@$addressip <<EOF
    if id "$nom" &>/dev/null; then
        chage -l wilder | grep "Dernière modification du mot de passe"
        echo " $date - information derniere modification du mot de passe de l'utilisateur" >> $filePath
        exit 0
    else
        echo "Utilisateur introuvable."
    fi
EOF    
}

# Fonction pour afficher la liste des sessions ouvertes par les utilisateurs
session_ouverte_utilisateur(){
     #ssh $nomssh@$adresseip
    ssh $nomssh@$addressip who
    echo " $date - information sur les session ouverte par les utilisateur" >> $filePath
    exit 0
}

# Menu des options d'historique d'activités utilisateur
while true; do
    clear
    echo "=== Historique des activités utilisateur ==="
    echo "1. Date de dernière connexion d'un utilisateur"
    echo "2. Date de dernière modification du mot de passe"
    echo "3. Liste des sessions ouvertes par l'utilisateur"
    echo "4. Retour"
    read -p "Choisissez une option: " choice

    case $choice in
        1) connexion_utilisateur ;;
        2) motDePasse_utilisateur ;;
        3) session_ouverte_utilisateur ;;
        4) echo "Retour au menu principal..." ;;
        *) echo "Choix invalide !" && menu_historique_des_activités_utilisateur ;;
    esac
done

# Appel du menu principal pour lancer le script

