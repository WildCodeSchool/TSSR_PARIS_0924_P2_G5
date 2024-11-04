
#!/bin/bash

# Fonction pour afficher la mémoire RAM totale
Ram_total() {
    clear
    free -h -t 
}

# Fonction pour afficher l'utilisation de la RAM
Utilisation_ram() {
    clear
    free -h
}

# Menu des options pour la mémoire RAM
while true; do
    
    echo "=== Historique des activités utilisateur ==="
    echo "1. Mémoire RAM totale"
    echo "2. Utilisation de la RAM"
    echo "3. Retour"
    read -p "Choisissez une option: " choice

    case $choice in
        1) Ram_total ;;
        2) Utilisation_ram ;;
        3) echo "Retour au menu principal..." ; break ;;
        *) echo "Choix invalide !" ;;
    esac
done

