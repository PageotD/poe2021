# Exercice 03

# On démarre la transcription
#Start-Transcript

# Dans un tableau interactif (GridView), on veut faire apparaitre les services en cours d’exécution, en affichant les propriétés suivantes (headers) : 
# NomService, ExeFullName, Description.
#Get-WmiObject -Class Win32_Service | Format-List -Property *
#Get-WmiObject -Class "Win32_Service" | Select-Object -Property Name, PathName, Description | Out-GridView
$Global:winService

# On défini une fonction qui va stocker les infos "Win32_Service"
Function getServices {
    param(
        # La classe dans laquelle ont fait la recherche de process
        [parameter(Mandatory = $true)]
        [string]$searchServices

    )
    # On veut récupérer les services en cours d'execution "running"
    # On initialise la variable de sortie
    $selectedService = $null
    Get-WmiObject -Class "Win32_Service" -filter "state = 'running'" | Out-GridView -OutputMode Multiple -Outvariable selectedService
    # On boucle sur les services s�lectionn�s pour les stopper
    if($selectedService.Count -eq 0){
        write-host "Aucun service selectionn�."
    }
    else{
        $number_of_services = $selectedService.Count
        write-host "Vous avez s�l�ction� $number_of_services service(s) pour arr�t."
        Foreach($service in $selectedService){
            Stop-Service -Name $service.Name -WhatIf
        }
    }
}

getServices -searchServices "Win32_Service"
