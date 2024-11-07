#!/bin/bash

# Chemin du fichier log

filePath="./profil_et_activites_utilisateurlog.txt"
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
groupe_appartenance_utilisateur(){
 #ssh $nomssh@$adresseip
    groups 
    echo " $date - succes demande appartenance au groupe" >> $filePath
    exit 0
}

# Fonction pour afficher historique des commandes exécutées par l'utilisateur 
historique_commande_utilisateur(){
     #ssh $nomssh@$adresseip
   history
echo " $date - succes demande historique de commandes" >> $filePath
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

