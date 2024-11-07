#!/bin/bash

filePath="./gestion_du_pare_feu.txt"
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

#fonction desactiver le pare feu
function desactiver {
    #ssh $nomssh@$adresseip
if sudo ufw enable
then
sudo ufw disable
sudo ufw status 
echo " $date - Le pare feu est desactivé " >> $filePath
exit 0
fi 
}

#fonction activer le pare feu
function activer {
     #ssh $nomssh@$adresseip
if sudo ufw disable
then
sudo ufw enable
sudo ufw status 
echo " $date - Le pare feu est activé " >> $filePath
exit 0
fi 
}


# Menu principal
while true; do
    clear
    read -p "Choisissez une option : 
    1) désactiver le pare feu
    2) activer le pare feu
    3) quitter

    Votre choix : " choix

    case $choix in
        1)
            desactiver
            ;;
        2)
            activer
            ;;
        3)
            quitter
            echo "Au revoir!"
            exit 0
            ;;
        *)
            echo "Choix invalide."
            ;;
    esac
done