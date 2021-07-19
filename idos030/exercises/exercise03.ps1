# Exercice 03

# On dÃ©marre la transcription
#Start-Transcript

# Dans un tableau interactif (GridView), on veut faire apparaitre les services en cours dâ€™exÃ©cution, en affichant les propriÃ©tÃ©s suivantes (headers) : 
# NomService, ExeFullName, Description.
#Get-WmiObject -Class Win32_Service | Format-List -Property *
#Get-WmiObject -Class "Win32_Service" | Select-Object -Property Name, PathName, Description | Out-GridView
$Global:winService

# On dÃ©fini une fonction qui va stocker les infos "Win32_Service"
Function getServices {
    param(
        # La classe dans laquelle ont fait la recherche de process
        [parameter(Mandatory = $true)]
        [string]$searchServices

    )
    # On veut rÃ©cupÃ©rer les services en cours d'execution "running"
    # On initialise la variable de sortie
    $selectedService = $null
    Get-WmiObject -Class "Win32_Service" -filter "state = 'running'" | Out-GridView -OutputMode Multiple -Outvariable selectedService
    # On boucle sur les services sélectionnés pour les stopper
    if($selectedService.Count -eq 0){
        write-host "Aucun service selectionné."
    }
    else{
        $number_of_services = $selectedService.Count
        write-host "Vous avez séléctioné $number_of_services service(s) pour arrêt."
        Foreach($service in $selectedService){
            Stop-Service -Name $service.Name -WhatIf
        }
    }
}

getServices -searchServices "Win32_Service"
