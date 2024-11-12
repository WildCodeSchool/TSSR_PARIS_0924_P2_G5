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

#nombre de disque 

function nbrDeDisque {
 #ssh $nomssh@$adresseip
 ssh $nomssh@$addressip fdisk -l
echo " $date - information nombre de disque succes " >> $filePath

}
 
#partition par disque

function partitionPArDisque {
     #ssh $nomssh@$adresseip

 ssh $nomssh@$addressip parted --list
echo " $date - information partition de disque succes " >> $filePath
}

#espace disque restant par partition

function espaceDiskRestant {
     #ssh $nomssh@$adresseip

  ssh $nomssh@$addressip df -h
    echo " $date - information espace disque restant succes " >> $filePath
}

#nom et espace disque d'un dossier

function espaceDiskDossier {
 #ssh $nomssh@$adresseip
  ssh $nomssh@$addressip du -sh
    echo " $date - information espace disque dossier succes " >> $filePath
}

#liste des disque monté

function listeLecteurMonte {
 #ssh $nomssh@$adresseip
   ssh $nomssh@$addressip lsblk
    echo " $date - information liste lecteur monté succes " >> $filePath
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

