#!/bin/bash

#nombre de disque 

function nbrDeDisque {
 #ssh $nomssh@$adresseip
sudo fdisk -l


}
 
#partition par disque

function partitionPArDisque {
     #ssh $nomssh@$adresseip

sudo parted --list

}

#espace disque restant par partition

function espaceDiskRestant {
     #ssh $nomssh@$adresseip

    df -h
}

#nom et espace disque d'un dossier

function espaceDiskDossier {
 #ssh $nomssh@$adresseip
    du -sh
}

#liste des disque monté

function listeLecteurMonte {
 #ssh $nomssh@$adresseip
    lsblk
}



# Menu principal
while true; do
    clear
    read -p "Choisissez une option : 
    1) Nombre de disque
    2) Partition par disque
    3) Espace disque restant par partition
    4) nom et espace disque d'un dossier
    5) Liste des disques monté
    6) Quitter
    Votre choix : " choix

    case $choix in
        1)
            nbrDeDisque
            ;;
        2)
            partitionPArDisque
            ;;
        3)
            espaceDiskRestant
            ;;
            4)
             espaceDiskDossier
            ;;
            5) 
             listeLecteurMonte
            ;;
            6)
                echo "au revoir" 
                exit 0
            ;;
        *)
            echo "Choix invalide."
            ;;
    esac
done

