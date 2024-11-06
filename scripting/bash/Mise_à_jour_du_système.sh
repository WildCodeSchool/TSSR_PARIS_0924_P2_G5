#!/bin/bash

# --- Script de gestion de la mise à jour pour Ubuntu/Debian ---

while true; do
    # Affichage du menu
    echo "=============================="
    echo "Menu de gestion de mise à jour"
    echo "=============================="
    echo "1. Mettre à jour le système"
    echo "2. Quitter"
    echo -n "Choisissez une option [1-2] : "
    read choice

    case $choice in
        1)
            # Vérification que nous sommes sur un système Debian/Ubuntu
            if [ -f /etc/debian_version ]; then
                echo "Mise à jour du système en cours sur Debian/Ubuntu..."
                sudo apt update -y && sudo apt upgrade -y
                echo "Mise à jour terminée avec succès !"
            else
                echo "Ce script est uniquement conçu pour les systèmes Debian/Ubuntu."
            fi
            ;;

        2)
            # Quitter le script
            echo "Au revoir !"
            exit 0
            ;;

        *)
            # Option invalide
            echo "Option invalide. Veuillez choisir une option entre 1 et 2."
            ;;
    esac

    # Demander de revenir au menu principal après chaque action
    echo
    read -p "Appuyez sur [Entrée] pour revenir au menu principal..."
done
