# Exercice 03

# Dans un tableau interactif (GridView), on veut faire apparaitre les services en cours d’exécution, en affichant les propriétés suivantes (headers) : 
# NomService, ExeFullName, Description.
#Get-WmiObject -Class Win32_Service | Format-List -Property *
Get-WmiObject -Class "Win32_Service" | Select-Object -Property Name, PathName, Description | Out-GridView