
function show-UserGroups {

# Remplacez "NomUtilisateur" par le nom de l'utilisateur
$NomUtilisateur = "NomUtilisateur"
Get-LocalGroup | ForEach-Object {
    $group = $_
    if ((Get-LocalGroupMember -Group $group.Name | Where-Object { $_.Name -eq $NomUtilisateur })) {
        Write-Output $group.Name
    }
}

}
function Show-CommandHistory {
    clear-host
    Write-Host "Historique des commandes :"
    Get-History
}

while ($true) {

    Write-Host "=== Historique des activités utilisateur ==="
    Write-Host "1. Groupe d'appartenance d'un utilisateur"
    Write-Host "2. Historique des commandes exécutées par l'utilisateur"
    Write-Host "3. Retour"
    $choice = Read-Host "Choisissez une option"

    switch ($choice) {
        "1" { Show-UserGroups }
        "2" { Show-CommandHistory }
        "3" { break }
        default { Write-Host "Choix invalide !" }
    }
}
