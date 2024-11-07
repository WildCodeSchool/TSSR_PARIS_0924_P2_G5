
#!/bin/bash

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

# Fonction pour afficher la mémoire RAM totale
Ram_total() {
    clear
    free -h -t 
    echo " $date - memoire ram total affiché " >> $filePath
}

# Fonction pour afficher l'utilisation de la RAM
Utilisation_ram() {
    clear
    free -h
    echo " $date - utilisation de la memoire ram affiché " >> $filePath
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

