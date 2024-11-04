#!/bin/bash

# Liste des applications/paquets installés
function Application_installees() {
    dpkg --get-selections
}

# Liste des services en cours d'exécution
function Service_en_execution() {
    systemctl list-units --type=service --state=running
}

# Liste des utilisateurs locaux
function Utilisateur_locaux() {
    cut -d: -f1 /etc/passwd
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
