
#!/bin/bash

# Sous-menu pour la suppression d'un compte utilisateur 
menu_suppression_dun_compte_utilisateur() { 
    clear 
    echo "=== Suppression d'un compte utilisateur ===" 
    read -p "Donner un nom de compte utilisateur à supprimer : " delUser
    
    if grep -qw "$delUser" /etc/passwd > /dev/null 2>&1; then
        # Le compte $delUser existe ==> suppression
        echo -e "Utilisateur $delUser déjà existant\nGo SUPPRESSION !"
        
        # Suppression du compte
        userdel -r -f "$delUser" 2> /dev/null
        
        # Vérification de la suppression
        if ! grep -qw "$delUser" /etc/passwd; then
            echo "Utilisateur $delUser supprimé."
        else
            echo "! Erreur : Utilisateur $delUser non-supprimé."
        fi
    else
        # Le compte $delUser n'existe pas
        echo -e "Utilisateur $delUser non existant.\nSortie du script."
        exit 1
    fi
}

# Appel de la fonction (si nécessaire)
menu_suppression_dun_compte_utilisateur

# Optionnel : exit 0 peut être ici si la fonction ne se termine jamais
exit 0
