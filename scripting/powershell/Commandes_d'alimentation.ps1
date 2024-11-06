# --- Script de gestion des commandes d'alimentation en PowerShell ---

$filePath =  ".\commande_dalimentation.txt"
$date = Get-Date

# Fonction pour créer un fichier log
function Create-File {
    param (
        [string]$filePath
    )

    if (-not (Test-Path -Path $filePath)) {
        New-Item -ItemType File -Path $filePath -Force | Out-Null
        Write-Output "Fichier '$filePath' créé avec succès."
        # Ajout d'un message de création dans le fichier
        Add-Content -Path $filePath -Value "$date - Fichier créé"
    } else {
        Write-Output "Le fichier '$filePath' existe déjà." > $null
    }
}


while ($true) {
    # Affichage du menu
    Write-Host "=============================="
    Write-Host "Menu de gestion d'alimentation"
    Write-Host "=============================="
    Write-Host "1. Arrêter l'ordinateur"
    Write-Host "2. Redémarrer l'ordinateur"
    Write-Host "3. Verrouiller la session"
    Write-Host "4. Quitter"
    $choice = Read-Host "Choisissez une option [1-4]"

    switch ($choice) {
        1 {
            # Arrêter l'ordinateur
            Write-Host "Arrêt en cours..."
            Stop-Computer -Force
             # Ajouter une entrée dans le fichier log sans écraser son contenu
            Add-Content -Path $filePath -Value "$date - L'ordinateur à été arrété."
            break
        }
        
        2 {
            # Redémarrer l'ordinateur
            Write-Host "Redémarrage en cours..."
            Restart-Computer -Force
            # Ajouter une entrée dans le fichier log sans écraser son contenu
            Add-Content -Path $filePath -Value "$date - L'ordinateur à été redemmaré."
            break
        }
        
        3 {
            # Verrouiller la session
            Write-Host "Verrouillage de la session..."
            # Utilisation de la commande de verrouillage pour Windows
            rundll32.exe user32.dll,LockWorkStation
            # Ajouter une entrée dans le fichier log sans écraser son contenu
            Add-Content -Path $filePath -Value "$date - L'ordinateur à été verrouillé."
        }
        
        4 {
            # Quitter le script
            Write-Host "Au revoir !"
            exit
        }
        
        default {
            # Option invalide
            Write-Host "Option invalide. Veuillez choisir une option entre 1 et 4."
        }
    }

    # Demander de revenir au menu principal après chaque action
    Write-Host
    Read-Host "Appuyez sur [Entrée] pour revenir au menu principal..."
}
