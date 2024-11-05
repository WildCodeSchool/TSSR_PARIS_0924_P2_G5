# --- Script de gestion des commandes d'alimentation en PowerShell ---

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
            break
        }
        
        2 {
            # Redémarrer l'ordinateur
            Write-Host "Redémarrage en cours..."
            Restart-Computer -Force
            break
        }
        
        3 {
            # Verrouiller la session
            Write-Host "Verrouillage de la session..."
            # Utilisation de la commande de verrouillage pour Windows
            rundll32.exe user32.dll,LockWorkStation
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
