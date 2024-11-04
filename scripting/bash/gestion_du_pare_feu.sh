#!/bin/bash

#fonction desactiver le pare feu
function desactiver {
    #ssh $nomssh@$adresseip
if sudo ufw enable
then
sudo ufw disable
sudo ufw status 
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