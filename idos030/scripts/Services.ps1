Get-Service # liste tous les services

Get-Service -Name EventLog # affiche les informations pour un service donné

# affichage des services dans un tableau

Get-Service | select -Property "Status", "Name", "DisplayName" | Out-GridView

#Start-Service
#Stop-Service
#Restart-Service
#New-Service

# intérractions avec le tableau :

for ($i = 0; $i -lt 15; $i++)
{
    new-item -Path "C:\temp" -ItemType File -Name "Fichier-N$i.txt" -Force
}

$files = Get-ChildItem -Path C:\Temp | select @{n="Nom-du-fichier";e={$_.Name}} | Out-GridView -Title "Gestion des Fichiers" -OutputMode Multiple

$files | % {
    rename-item -Path "C:\temp\$($_.'Nom-du-fichier')" -NewName "Formation-$($_.'Nom-du-fichier')"
}