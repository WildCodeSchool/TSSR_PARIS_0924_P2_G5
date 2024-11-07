# Fonction pour afficher la mémoire RAM totale
function Get-RamTotal {
    Clear-Host
    $memory = Get-WmiObject -Class Win32_OperatingSystem
    $totalRam = [math]::round($memory.TotalVisibleMemorySize / 1MB, 2)
    Write-Host "Mémoire RAM Totale : $totalRam MB"
}

# Fonction pour afficher l'utilisation de la RAM
function Get-RamUsage {
    Clear-Host
    $memory = Get-WmiObject -Class Win32_OperatingSystem
    $totalRam = [math]::round($memory.TotalVisibleMemorySize / 1MB, 2)
    $freeRam = [math]::round($memory.FreePhysicalMemory / 1MB, 2)
    $usedRam = $totalRam - $freeRam
    Write-Host "Utilisation de la RAM :"
    Write-Host "  Total : $totalRam MB"
    Write-Host "  Utilisé : $usedRam MB"
    Write-Host "  Libre : $freeRam MB"
}

# Menu des options pour la mémoire RAM
while ($true) {
    Write-Host "=== Historique des activités mémoire RAM ==="
    Write-Host "1. Mémoire RAM Totale"
    Write-Host "2. Utilisation de la RAM"
    Write-Host "3. Retour"
    $choice = Read-Host "Choisissez une option"

    switch ($choice) {
        1 { 
            Get-RamTotal
            Read-Host "Appuyez sur [Entrée] pour revenir au menu"
        }
        2 {
            Get-RamUsage
            Read-Host "Appuyez sur [Entrée] pour revenir au menu"
        }
        3 {
            Write-Host "Retour au menu principal..."
            break
        }
        default {
            Write-Host "Choix invalide. Veuillez choisir une option valide."
            Read-Host "Appuyez sur [Entrée] pour revenir au menu"
        }
    }
}
