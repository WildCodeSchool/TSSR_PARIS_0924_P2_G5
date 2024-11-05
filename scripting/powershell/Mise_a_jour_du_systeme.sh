# --- Script PowerShell de gestion des mises à jour pour Windows et Windows Server ---

function Show-Menu {
    # Affichage du menu
    Write-Host "=============================="
    Write-Host "Menu de gestion de mise à jour"
    Write-Host "=============================="
    Write-Host "1. Mettre à jour le système"
    Write-Host "2. Quitter"
    $choice = Read-Host "Choisissez une option [1-2]"

    switch ($choice) {
        1 {
            # Lancer la mise à jour
            Update-System
            break
        }
        
        2 {
            # Quitter le script
            Write-Host "Au revoir !"
            exit
        }
        
        default {
            # Option invalide
            Write-Host "Option invalide. Veuillez choisir une option entre 1 et 2."
        }
    }
}

# Boucle pour afficher le menu et exécuter l'option choisie
while ($true) {
    Show-Menu
    Write-Host
    Read-Host "Appuyez sur [Entrée] pour revenir au menu principal..."
}

function Update-System {
    try {
        # Vérification de la version du système (Windows ou Windows Server)
        $osVersion = [System.Environment]::OSVersion.Version
        $isWindowsServer = $osVersion.Major -eq 10 -and (Get-WmiObject -Class Win32_OperatingSystem).ProductType -eq "Server"

        Write-Host "Mise à jour du système en cours..."

        # Si c'est un Windows Server, utiliser PSWindowsUpdate si disponible
        if ($isWindowsServer) {
            # Vérification si le module PSWindowsUpdate est installé
            if (Get-Module -ListAvailable -Name PSWindowsUpdate) {
                Import-Module PSWindowsUpdate
                Write-Host "Mise à jour via PSWindowsUpdate sur Windows Server..."
                # Lancer les mises à jour
                Get-WindowsUpdate -AcceptAll -AutoReboot
            } else {
                Write-Host "PSWindowsUpdate n'est pas installé. Vous pouvez l'installer avec la commande : Install-Module PSWindowsUpdate"
            }
        } else {
            # Pour Windows client (ex: Windows 10), utiliser la commande UsoClient pour la mise à jour
            Write-Host "Mise à jour via Windows Update sur Windows..."
            Invoke-Expression -Command "UsoClient StartScan"
            Start-Sleep -Seconds 5
            Invoke-Expression -Command "UsoClient StartDownload"
            Start-Sleep -Seconds 5
            Invoke-Expression -Command "UsoClient StartInstall"
            Start-Sleep -Seconds 5
            Invoke-Expression -Command "UsoClient RestartDevice"
        }

        Write-Host "Mise à jour terminée avec succès !"
    } catch {
        Write-Host "Une erreur s'est produite lors de la mise à jour : $_"
    }
}
