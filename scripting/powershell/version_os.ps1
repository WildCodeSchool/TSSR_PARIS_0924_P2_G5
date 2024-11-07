# Afficher les informations système
Clear-Host

# Obtenir des informations sur la version de Windows
$osInfo = Get-ComputerInfo

# Affichage des informations sur le système d'exploitation
Write-Host "Nom du système d'exploitation : $($osInfo.OsName)"
Write-Host "Version : $($osInfo.WindowsVersion)"
Write-Host "Build : $($osInfo.WindowsBuildLabEx)"
Write-Host "Architecture : $($osInfo.OsArchitecture)"
