#!/bin/bash

# Fonction pour afficher la date de la dernière connexion de l'utilisateur
connexion_utilisateur(){
     #ssh $nomssh@$adresseip
    last -n 1
    exit 0
}

# Fonction pour afficher la date de dernière modification du mot de passe d'un utilisateur
motDePasse_utilisateur(){
     #ssh $nomssh@$adresseip
    read -p "Nom de l'utilisateur: " nom
    if id "$nom" &>/dev/null; then
        chage -l wilder | grep "Dernière modification du mot de passe"
        exit 0
    else
        echo "Utilisateur introuvable."
    fi
}

# Fonction pour afficher la liste des sessions ouvertes par les utilisateurs
session_ouverte_utilisateur(){
     #ssh $nomssh@$adresseip
    who
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

