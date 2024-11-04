#!/bin/bash



# Fonction pour afficher Groupe d'appartenace d'un utilisateur
dossier_utilisateur(){
    #ssh $nomssh@$adresseip
    read -p "donnez le nom du dossier" dossier
    ls -l "$dossier"
}

# Fonction pour afficher historique des commandes exécutées par l'utilisateur 

fichier_utilisateur(){
    #ssh $nomssh@$adresseip
    read -p "donnez le nom du fichier" fichier
   ls -ld "$fichier"

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

