#!/bin/bash



#debut de script 
debut_script() {
    clear
    echo "=== Menu Principal ==="
    echo "1. action sur Utilisateurs ou ordinateur"
    echo "2. Information sur utilisateurs ou Ordinateurs"
    echo "3. Quitter"
    read -p "Choisissez une option: " choice

    case $choice in
        1) main_menu ;;
        2) main_menu2 ;;
        3) exit 0 ;;
        *) echo "Choix invalide !" && debut_script ;;
    esac
}



# Menu principal
main_menu() {
    clear
    echo "=== Menu Principal ==="
    echo "1. Gestion des Utilisateurs"
    echo "2. Gestion des Ordinateurs"
    echo "3. Quitter"
    read -p "Choisissez une option: " choice

    case $choice in
        1) menu_gestion_utilisateur ;;
        2) menu_gestion_ordinateur ;;
        3) exit 0 ;;
        *) echo "Choix invalide !" && main_menu ;;
    esac
}

# Sous-menu pour la gestion des utilisateurs
clear
menu_gestion_utilisateur() {
    echo "=== Gestion des Utilisateurs ==="
    echo "1. Compte Utilisateur"
    echo "2. Groupes"
    echo "3. Retour au Menu Principal"
    read -p "Choisissez une option: " choice

    case $choice in
        1) menu_compte_utilisateur ;;
        2) menu_groupe_utilisateur ;;
        3) main_menu ;;
        *) echo "Choix invalide !" && menu_gestion_utilisateur ;;
    esac
}

# Sous-menu pour les actions sur les comptes utilisateurs
clear
menu_compte_utilisateur() {
    echo "=== Compte Utilisateur ==="
    echo "1. Création de compte utilisateur local"
    echo "2. Changement de mot de passe"
    echo "3. Suppression de compte utilisateur local"
    echo "4. Désactivation de compte utilisateur local"
    echo "5. Retour"
    read -p "Choisissez une option: " choice

    case $choice in
        1) create_local_user ;;
        2) change_password ;;
        3) delete_local_user ;;
        4) disable_local_user ;;
        5) menu_gestion_utilisateur ;;
        *) echo "Choix invalide !" && menu_compte_utilisateur ;;
    esac
}

# Sous-menu pour la gestion des groupes
menu_groupe_utilisateur() {
    clear
    echo "=== Gestion des Groupes ==="
    echo "1. Ajout à un groupe d'administration"
    echo "2. Ajout à un groupe local"
    echo "3. Sortie d'un groupe local"
    echo "4. Retour"
    read -p "Choisissez une option: " choice

    case $choice in
        1) add_to_admin_group ;;
        2) add_to_local_group ;;
        3) remove_from_local_group ;;
        4) menu_gestion_utilisateur ;;
        *) echo "Choix invalide !" && menu_groupe_utilisateur ;;
    esac
}

# Sous-menu pour la gestion des ordinateurs
menu_gestion_ordinateur() {
    clear
    echo "=== Gestion des Ordinateurs ==="
    echo "1. Commande d'alimentation"
    echo "2. Mise à jour du système"
    echo "3. Gestion de répertoire"
    echo "4. Prise en main à distance"
    echo "5. Gestion du pare-feu"
    echo "6. Gestion des logiciels"
    echo "7. Retour au Menu Principal"
    read -p "Choisissez une option: " choice

    case $choice in
        1) power_management_menu ;;
        2) update_system ;;
        3) source gestion_repertoire.sh ;;
        4) remote_access_menu ;;
        5) source gestion_du_pare_feu.sh ;;
        6) source install_desinstall_logiciel.sh ;;
        7) main_menu ;;
        *) echo "Choix invalide !" && menu_gestion_ordinateur ;;
    esac
}

# Menu principal pour les informations
main_menu2() {
    clear
    echo "=== Menu Principal Information ==="
    echo "1. Information des Utilisateurs"
    echo "2. Information des Ordinateurs"
    echo "3. Script"
    echo "4. Quitter"
    read -p "Choisissez une option: " choice

    case $choice in
        1) menu_information_utilisateur ;;
        2) menu_information_ordinateur ;;
        3) exit 0 ;;
        *) echo "Choix invalide !" && main_menu2 ;;
    esac
}

# Sous-menu pour les informations des utilisateurs
menu_information_utilisateur() {
    clear
    echo "=== Information des Utilisateurs ==="
    echo "1. Historique des activités utilisateur"
    echo "2. Profils et activités utilisateurs"
    echo "3. Droits/permissions utilisateurs"
    echo "4. Retour au Menu Principal"
    read -p "Choisissez une option: " choice

    case $choice in
        1) source historique_des_activités_utilisateurs.sh ;;
        2) source profil_et_activités_utilisateurs.sh ;;
        3) source Droits_permissions_utilisateur.sh ;;
        4) main_menu2 ;;
        *) echo "Choix invalide !" && menu_information_utilisateur ;;
    esac
}

# Sous-menu pour les informations des ordinateurs
menu_information_ordinateur() {
    clear
    echo "=== Information des Ordinateurs ==="
    echo "1. Version de l'OS"
    echo "2. Information disque"
    echo "3. Etat du système et des ressources"
    echo "4. Informations RAM"
    echo "5. Retour au Menu Principal"
    read -p "Choisissez une option: " choice

    case $choice in
        1) source version_os.sh ;;
        2) source information_disque.sh ;;
        3) source etat_systeme_ressource.sh ;;
        4) source information_ram.sh ;;
        5) main_menu2 ;;
        *) echo "Choix invalide !" && menu_information_ordinateur ;;
    esac
}

# Démarrer le script en affichant le menu principal
debut_script
