#!/bin/bash

# --- Script de gestion des commandes d'alimentation ---

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
            sudo shutdown now
            break
            ;;
        
        2)
            # Redémarrer l'ordinateur
            echo "Redémarrage en cours..."
            sudo reboot
            break
            ;;
        
        3)
            # Verrouiller la session (fonctionne sur des environnements de bureau comme GNOME ou KDE)
            echo "Verrouillage de la session..."
            # Ici on utilise `gnome-screensaver-command` si disponible, sinon `loginctl lock-session` ou `xtrlock`
            if command -v gnome-screensaver-command &>/dev/null; then
                gnome-screensaver-command -l
            elif command -v loginctl &>/dev/null; then
                loginctl lock-session
            elif command -v xtrlock &>/dev/null; then
                xtrlock
            else
                echo "Impossible de verrouiller la session : aucune méthode disponible."
            fi
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
