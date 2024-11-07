# Fonction pour désactiver le pare-feu
function Desactiver {
    # Vérifie si le pare-feu est activé
    $firewallStatus = Get-NetFirewallProfile | Where-Object { $_.Enabled -eq $true }

    if ($firewallStatus) {
        Write-Host "Désactivation du pare-feu..."
        Set-NetFirewallProfile -Profile Domain,Private,Public -Enabled False
        # Vérification de l'état du pare-feu après désactivation
        $newStatus = Get-NetFirewallProfile | Where-Object { $_.Enabled -eq $true }
        if ($newStatus) {
            Write-Host "Le pare-feu est toujours activé."
        } else {
            Write-Host "Le pare-feu a été désactivé avec succès."
        }
    } else {
        Write-Host "Le pare-feu est déjà désactivé."
    }
}

# Fonction pour activer le pare-feu
function Activer {
    # Vérifie si le pare-feu est désactivé
    $firewallStatus = Get-NetFirewallProfile | Where-Object { $_.Enabled -eq $false }

    if ($firewallStatus) {
        Write-Host "Activation du pare-feu..."
        Set-NetFirewallProfile -Profile Domain,Private,Public -Enabled True
        # Vérification de l'état du pare-feu après activation
        $newStatus = Get-NetFirewallProfile | Where-Object { $_.Enabled -eq $false }
        if ($newStatus) {
            Write-Host "Le pare-feu est toujours désactivé."
        } else {
            Write-Host "Le pare-feu a été activé avec succès."
        }
    } else {
        Write-Host "Le pare-feu est déjà activé."
    }
}

# Menu principal
while ($true) {
    Clear-Host
    $choix = Read-Host "Choisissez une option : 
    1) Désactiver le pare-feu
    2) Activer le pare-feu
    3) Quitter"

    switch ($choix) {
        1 {
            Desactiver
            Read-Host "Appuyez sur [Entrée] pour revenir au menu principal..."
        }
        2 {
            Activer
            Read-Host "Appuyez sur [Entrée] pour revenir au menu principal..."
        }
        3 {
            Write-Host "Au revoir!"
            exit 0
        }
        default {
            Write-Host "Choix invalide."
            Read-Host "Appuyez sur [Entrée] pour revenir au menu principal..."
        }
    }
}
