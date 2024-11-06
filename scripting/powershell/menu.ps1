# Début du script
function Debut-Script  {
    Clear-Host
    Write-Host "=== Menu Principal ==="
    Write-Host "1. Action sur Utilisateurs ou Ordinateur"
    Write-Host "2. Information sur Utilisateurs ou Ordinateurs"
    Write-Host "3. Quitter"
    $choice = Read-Host "Choisissez une option"

    switch ($choice) {
        1 { Main-Menu }
        2 { Main-Menu2 }
        3 { exit }
        default { Write-Host "Choix invalide !" ; Debut-Script }
    }
}

# Menu principal pour les actions
function Main-Menu {
    Clear-Host
    Write-Host "=== Menu Principal ==="
    Write-Host "1. Gestion des Utilisateurs"
    Write-Host "2. Gestion des Ordinateurs"
    Write-Host "3. Quitter"
    $choice = Read-Host "Choisissez une option"

    switch ($choice) {
        1 { Menu-Gestion-Utilisateur }
        2 { Menu-Gestion-Ordinateur }
        3 { exit }
        default { Write-Host "Choix invalide !" ; Main-Menu }
    }
}

# Sous-menu pour la gestion des utilisateurs
function Menu-Gestion-Utilisateur {
    Clear-Host
    Write-Host "=== Gestion des Utilisateurs ==="
    Write-Host "1. Compte Utilisateur"
    Write-Host "2. Groupes"
    Write-Host "3. Retour au Menu Principal"
    $choice = Read-Host "Choisissez une option"

    switch ($choice) {
        1 { Menu-Compte-Utilisateur }
        2 { Menu-Groupe-Utilisateur }
        3 { Main-Menu }
        default { Write-Host "Choix invalide !" ; Menu-Gestion-Utilisateur }
    }
}

# Sous-menu pour les comptes utilisateurs
function Menu-Compte-Utilisateur {
    Clear-Host
    Write-Host "=== Compte Utilisateur ==="
    Write-Host "1. Création de compte utilisateur local"
    Write-Host "2. Changement de mot de passe"
    Write-Host "3. Suppression de compte utilisateur local"
    Write-Host "4. Désactivation de compte utilisateur local"
    Write-Host "5. Retour"
    $choice = Read-Host "Choisissez une option"

    switch ($choice) {
        1 { Create-Local-User }
        2 { Change-Password }
        3 { Delete-Local-User }
        4 { Disable-Local-User }
        5 { Menu-Gestion-Utilisateur }
        default { Write-Host "Choix invalide !" ; Menu-Compte-Utilisateur }
    }
}

# Sous-menu pour la gestion des groupes
function Menu-Groupe-Utilisateur {
    Clear-Host
    Write-Host "=== Gestion des Groupes ==="
    Write-Host "1. Ajout à un groupe d'administration"
    Write-Host "2. Ajout à un groupe local"
    Write-Host "3. Sortie d'un groupe local"
    Write-Host "4. Retour"
    $choice = Read-Host "Choisissez une option"

    switch ($choice) {
        1 { Add-To-Admin-Group }
        2 { Add-To-Local-Group }
        3 { Remove-From-Local-Group }
        4 { Menu-Gestion-Utilisateur }
        default { Write-Host "Choix invalide !" ; Menu-Groupe-Utilisateur }
    }
}

# Sous-menu pour la gestion des ordinateurs
function Menu-Gestion-Ordinateur {
    Clear-Host
    Write-Host "=== Gestion des Ordinateurs ==="
    Write-Host "1. Commande d'alimentation"
    Write-Host "2. Mise à jour du système"
    Write-Host "3. Gestion de répertoire"
    Write-Host "4. Prise en main à distance"
    Write-Host "5. Gestion du pare-feu"
    Write-Host "6. Gestion des logiciels"
    Write-Host "7. Retour au Menu Principal"
    $choice = Read-Host "Choisissez une option"

    switch ($choice) {
        1 { Power-Management-Menu }
        2 { Update-System }
        3 { & "./Gestion_repertoire.ps1"}
        4 { Remote-Access-Menu }
        5 { Firewall-Management }
        6 { Software-Management }
        7 { Main-Menu }
        default { Write-Host "Choix invalide !" ; Menu-Gestion-Ordinateur }
    }
}

# Menu principal pour les informations
function Main-Menu2 {
    Clear-Host
    Write-Host "=== Menu Principal Information ==="
    Write-Host "1. Information des Utilisateurs"
    Write-Host "2. Information des Ordinateurs"
    Write-Host "3. Script"
    Write-Host "4. Quitter"
    $choice = Read-Host "Choisissez une option"

    switch ($choice) {
        1 { Menu-Information-Utilisateur }
        2 { Menu-Information-Ordinateur }
        3 { exit }
        default { Write-Host "Choix invalide !" ; Main-Menu2 }
    }
}

# Sous-menu pour les informations des utilisateurs
function Menu-Information-Utilisateur {
    Clear-Host
    Write-Host "=== Information des Utilisateurs ==="
    Write-Host "1. Historique des activités utilisateur"
    Write-Host "2. Profils et activités utilisateurs"
    Write-Host "3. Droits/permissions utilisateurs"
    Write-Host "4. Retour au Menu Principal"
    $choice = Read-Host "Choisissez une option"

    switch ($choice) {
        1 { Get-User-Activity-History }
        2 { Get-User-Profile-Activity }
        3 { Get-User-Permissions }
        4 { Main-Menu2 }
        default { Write-Host "Choix invalide !" ; Menu-Information-Utilisateur }
    }
}

# Sous-menu pour les informations des ordinateurs
function Menu-Information-Ordinateur {
    Clear-Host
    Write-Host "=== Information des Ordinateurs ==="
    Write-Host "1. Version de l'OS"
    Write-Host "2. Information disque"
    Write-Host "3. Etat du système et des ressources"
    Write-Host "4. Informations RAM"
    Write-Host "5. Retour au Menu Principal"
    $choice = Read-Host "Choisissez une option"

    switch ($choice) {
        1 { Get-OS-Version }
        2 { Get-Disk-Info }
        3 { Get-System-Resource-State }
        4 { Get-RAM-Info }
        5 { Main-Menu2 }
        default { Write-Host "Choix invalide !" ; Menu-Information-Ordinateur }
    }
}


# Exécution du script
Debut-Script
