# Fonction pour lister les applications/paquets installés
function Get-InstalledApplications {
    Get-WmiObject -Class Win32_Product | Select-Object Name, Version
}

# Fonction pour lister les services en cours d'exécution
function Get-RunningServices {
    Get-Service | Where-Object { $_.Status -eq 'Running' } | Select-Object Name, Status
}

# Fonction pour lister les utilisateurs locaux
function Get-LocalUsers {
    Get-LocalUser | Select-Object Name, Enabled
}

# Boucle du menu principal
while ($true) {
    Write-Host "=== État du système et des ressources ==="
    Write-Host "1. Liste des applications/paquets installés"
    Write-Host "2. Liste des services en cours d'exécution"
    Write-Host "3. Liste des utilisateurs locaux"
    Write-Host "4. Retour"
    $choice = Read-Host "Choisissez une option"

    switch ($choice) {
        1 { 
            Get-InstalledApplications
        }
        2 {
            Get-RunningServices
        }
        3 {
            Get-LocalUsers
        }
        4 {
            Write-Host "Retour au menu principal..."
            break
        }
        default {
            Write-Host "Choix invalide !"
        }
    }
}
