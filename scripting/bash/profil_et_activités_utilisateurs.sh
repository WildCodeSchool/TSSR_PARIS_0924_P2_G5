#!/bin/bash

# Fonction pour afficher Groupe d'appartenace d'un utilisateur
groupe_appartenance_utilisateur(){
 #ssh $nomssh@$adresseip
    groups 
    exit 0
}

# Fonction pour afficher historique des commandes exécutées par l'utilisateur 
historique_commande_utilisateur(){
     #ssh $nomssh@$adresseip
   history

}



# Menu des options d'historique d'activités utilisateur
while true; do
    clear
    echo "=== Historique des activités utilisateur ==="
    echo "1. Groupe d'appartenace d'un utilisateur"
    echo "2. historique des commandes exécutées par l'utilisateur"
    echo "3. Retour"
    read -p "Choisissez une option: " choice

    case $choice in
        1) groupe_appartenance_utilisateur ;;
        2) historique_commande_utilisateur ;;
        3) echo "Retour au menu principal..." ;;
        *) echo "Choix invalide !"  ;;
    esac
done

# Appel du menu principal pour lancer le script

