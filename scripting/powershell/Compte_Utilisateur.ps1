# Fonction pour afficher le menu principal
function Show-MainMenu {
    Clear-Host
    Write-Host "=== Menu Principal ==="
    Write-Host "1. Créer un compte utilisateur"
    Write-Host "2. Modifier le mot de passe d'un compte utilisateur"
    Write-Host "3. Supprimer un compte utilisateur"
    Write-Host "4. Désactiver un compte utilisateur"
    Write-Host "5. Quitter"
    
    $choice = Read-Host "Choisissez une option"

    switch ($choice) {
        1 { Create-UserAccount }
        2 { Change-UserPassword }
        3 { Remove-UserAccount }
        4 { Disable-UserAccount }
        5 { exit }
        default { Write-Host "Choix invalide ! Veuillez réessayer." ; Show-MainMenu }
    }
}

# Fonction pour créer un compte utilisateur
function Create-UserAccount {
    Clear-Host
    Write-Host "=== Création compte utilisateur ==="
    $newUser = Read-Host "Donner un nom de compte à créer"

    if (Get-LocalUser -Name $newUser -ErrorAction SilentlyContinue) {
        Write-Host "L'utilisateur $newUser existe déjà. Sortie du script."
        exit 1
    } else {
        Write-Host "Création de l'utilisateur $newUser"
        New-LocalUser -Name $newUser -NoPassword
        
        if (Get-LocalUser -Name $newUser) {
            Write-Host "Utilisateur $newUser créé !"
        } else {
            Write-Host "Erreur : Utilisateur $newUser non créé."
        }
    }
    Read-Host "Appuyez sur Entrée pour revenir au menu principal..."
    Show-MainMenu
}

# Fonction pour modifier le mot de passe d'un utilisateur
function Change-UserPassword {
    Clear-Host
    Write-Host "Modification du mot de passe du compte utilisateur"
    
    $mdp = Read-Host -AsSecureString "Nouveau mot de passe"
    
    if (-not $mdp) {
        Write-Host "Le mot de passe ne peut pas être vide."
        exit 1
    }

    $mdp2 = Read-Host -AsSecureString "Retapez le mot de passe (vérification)"

    # Convertir les chaînes sécurisées en texte clair pour la comparaison
    $mdpPlain = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($mdp))
    $mdp2Plain = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($mdp2))

    if ($mdpPlain -ne $mdp2Plain) {
        Write-Host "Les mots de passe saisis ne correspondent pas."
        exit 1
    }

    $username = Read-Host "Entrez le nom d'utilisateur pour modifier le mot de passe"
    Set-LocalUser -Name $username -Password $mdp
    Write-Host "Modification du mot de passe avec succès."
    Read-Host "Appuyez sur Entrée pour revenir au menu principal..."
    Show-MainMenu
}

# Fonction pour supprimer un compte utilisateur
function Remove-UserAccount {
    Clear-Host
    Write-Host "=== Suppression d'un compte utilisateur ==="
    $delUser = Read-Host "Donner un nom de compte utilisateur à supprimer"

    if (Get-LocalUser -Name $delUser -ErrorAction SilentlyContinue) {
        Write-Host "L'utilisateur $delUser existe. Suppression en cours..."
        Remove-LocalUser -Name $delUser
        
        if (-not (Get-LocalUser -Name $delUser -ErrorAction SilentlyContinue)) {
            Write-Host "Utilisateur $delUser supprimé."
        } else {
            Write-Host "! Erreur : Utilisateur $delUser non supprimé."
        }
    } else {
        Write-Host "Utilisateur $delUser non existant."
        exit 1
    }

    Read-Host "Appuyez sur Entrée pour revenir au menu principal..."
    Show-MainMenu
}

# Fonction pour désactiver un compte utilisateur
function Disable-UserAccount {
    Clear-Host
    Write-Host "=== Désactivation d'un compte utilisateur ==="
    $userToDisable = Read-Host "Donner un nom de compte utilisateur à désactiver"

    if (Get-LocalUser -Name $userToDisable -ErrorAction SilentlyContinue) {
        Write-Host "L'utilisateur $userToDisable existe. Désactivation en cours..."
        Disable-LocalUser -Name $userToDisable
        
        if (-not (Get-LocalUser -Name $userToDisable -ErrorAction SilentlyContinue).Enabled) {
            Write-Host "Utilisateur $userToDisable désactivé."
        } else {
            Write-Host "! Erreur : Utilisateur $userToDisable non désactivé."
        }
    } else {
        Write-Host "Utilisateur $userToDisable non existant."
        exit 1
    }

    Read-Host "Appuyez sur Entrée pour revenir au menu principal..."
    Show-MainMenu
}

# Lancer le menu principal
Show-MainMenu
