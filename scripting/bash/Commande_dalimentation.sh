#!/bin/bash

# --- Script de gestion des commandes d'alimentation ---

#connection via ssh
read -p "donner le nom du client :" sshname
read -p "donner l'adresse ip du client :" sship

nomssh=$sshname
addressip=$sship

filePath="./Commande_alimentationlog.txt"
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

while true; do
    # Affichage du menu
    echo "=============================="
    echo "Menu de gestion d'alimentation"
    echo "=============================="
    echo "1. Arrêter l'ordinateur"
    echo "2. Redémarrer l'ordinateur"
    echo "3. Verrouiller la session"
    echo "4. Quitter"
    echo -n "Choisissez une option [1-4] : "
    read choice

    case $choice in
        1)
            # Arrêter l'ordinateur
            echo "Arrêt en cours..."
            ssh $nomssh@$addressip shutdown now
             echo " $date - arret de l'ordinateur " >> $filePath
            break
            ;;
        
        2)
            # Redémarrer l'ordinateur
            echo "Redémarrage en cours..."
            ssh $nomssh@$addressip reboot
            echo " $date - redemarrage de l'ordinateur " >> $filePath
            break
            ;;
        
        3)
            # Verrouiller la session (fonctionne sur des environnements de bureau comme GNOME ou KDE)
            echo "Verrouillage de la session..."
            # Ici on utilise `gnome-screensaver-command` si disponible, sinon `loginctl lock-session` ou `xtrlock`
             ssh $nomssh@$addressip <<EOF
            if command -v gnome-screensaver-command &>/dev/null; then
             gnome-screensaver-command -l
                echo " $date - verrouillage de l'ordinateur " >> $filePath
            elif command -v loginctl &>/dev/null; then
                loginctl lock-session
                echo " $date - verrouillage de l'ordinateur " >> $filePath
            elif command -v xtrlock &>/dev/null; then
               xtrlock
                echo " $date - verrouillage de l'ordinateur " >> $filePath
            else
                echo "Impossible de verrouiller la session : aucune méthode disponible."
                echo " $date - erreur non verouillage de l'ordinateur " >> $filePath
            fi
EOF
            ;;
        
        4)
            # Quitter le script
            echo "Au revoir !"
            exit 0
            ;;
        
        *)
            # Option invalide
            echo "Option invalide. Veuillez choisir une option entre 1 et 4."
            ;;
    esac

    # Demander de revenir au menu principal après chaque action
    echo
    read -p "Appuyez sur [Entrée] pour revenir au menu principal..."
done
