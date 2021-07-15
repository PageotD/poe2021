# EXERCICE 01

# On crée une variable Date qui contiendra la date à partir de laquelle on veut un retour de log
# On écrit la valeur en sortie terminal pour être sûr
$Date = (Get-Date).AddDays(-21)
Write-Host "Date de référence: $Date"

# On prend les évènements "Application" ayant l'ID 6005 et ayant lieu à partir de $Date
# Le résultat est redirigé dans un fichier texte nommé "Start.txt"
Get-WinEvent System | Where-Object {$_.id -eq 6005 -and $_.TimeCreated -ge $Date} > C:\Temp\Start.txt