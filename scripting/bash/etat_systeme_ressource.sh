#!/bin/bash

#connection via ssh
read -p "donner le nom du client :" sshname
read -p "donner l'adresse ip du client :" sship

nomssh=$sshname
addressip=$sship

filePath="./etat_systeme_ressourcelog.txt"
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

# Liste des applications/paquets installés
function Application_installees() {
 ssh $nomssh@$addressip dpkg --get-selections
    echo " $date - Liste des applications/paquets installés " >> $filePath
}

# Liste des services en cours d'exécution
function Service_en_execution() {
   ssh $nomssh@$addressip systemctl list-units --type=service --state=running
    echo " $date - Liste des services en cours d'exécution " >> $filePath
}

# Liste des utilisateurs locaux
function Utilisateur_locaux() {
   ssh $nomssh@$addressip cut -d: -f1 /etc/passwd
    echo " $date - Liste des utilisateurs locaux " >> $filePath
}

# Boucle du menu principal
while true; do
    echo "=== État du système et des ressources ==="
    echo "1. Liste des applications/paquets installés"
    echo "2. Liste des services en cours d'exécution"
    echo "3. Liste des utilisateurs locaux"
    echo "4. Retour"
    read -p "Choisissez une option: " choice

    case $choice in
        1) Application_installees ;;
        2) Service_en_execution ;;
        3) Utilisateur_locaux ;;
        4) echo "Retour au menu principal..." ; break ;;
        *) echo "Choix invalide !" ;;
    esac
done
