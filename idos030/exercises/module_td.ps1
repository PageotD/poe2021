# EXERCICE 01
Function getSysEventsExo1{
    param(
        # ID to search
        [parameter(Mandatory = $true)]
        [int]$searchId,
        # Number of days for which the ID search must be done
        [parameter(Mandatory = $true)]
        [int]$ndays
    )

    # Get the starting time in ms format ndays*24*3600*1000
    Write-Host " * Calcul de la date de reference"
    $refDate = (Get-Date).Adddays(-1*$ndays)
    $refDateXML = $ndays*24*3600*1000
    
    # Print the request date for confirmation
    write-host "   $refDate"
    Write-Host "   $refDateXML"
    
    $customFilterXML = "
        <QueryList>
            <Query Id='0' Path='System'>
                <Select Path='System'>*[System[(EventID=$searchID) and TimeCreated[timediff(@SystemTime) &lt;= $refDateXML]]] 
                </Select>
            </Query>
        </QueryList>
    "

    # Search for events with ID=$searchId after $startDate and write output in c:\Temp\exercise01_start.txt
    Write-Host " * Recherche des evenements correspondant a ID: $searchID "
    Write-Host "   a partir du $refDate."
    Get-WinEvent -FilterXml $customFilterXML | Out-File -FilePath C:\Temp\exercise01_start.txt
    Write-Host " * Ecriture des resultats dans C:\Temp\exercise01_start.txt"
}

# EXERCICE 02

Function createFilesExo2 {
    param(
        # ID to search
        [parameter(Mandatory = $true)]
        [string]$fileName,
        # Number of days for which the ID search must be done
        [parameter(Mandatory = $true)]
        [int]$nfile,
        # Path to folder where the files will be stored
        [parameter(Mandatory = $true)]
        [string]$folderPath
    )

    # Check if folder exist
    Write-Host "* On teste si le dossier $folderPath existe ou non"
    If(Test-Path -Path $folderPath){
        write-host "  -Le dossier TestFinal existe déjà"
    }
    Else{
        write-host "  -Le dossier TestFinal n'existe pas. Il va être créé."
        New-Item -ItemType Directory -Path $folderPath
    }

    # On veut créer 76 fichiers dont le nom doit correspondre à la nomenclature "monfichierXXX.txt"
    # On veut stocker le nom du fichier et sa date de création dans un tableau
    # On commence par créer le tableau
    Write-Host "* Creation du tableau stockant le nom des fichiers et leur date de création."
    [System.Collections.ArrayList]$tabFiles = @()

    # On boucle sur le nombre des fichiers
    Write-Host "* Création des $nfiles fichiers..."
    For($i=0; $i -lt $nfile; $i++){
        # On prend la date système pour la création des fichiers
        $date = (Get-Date)
        # On cree un item a ajouter dans le tableau $tabFiles
        $item = New-Object -TypeName psobject -Property ([Ordered]@{
            NomFichier = (-join($fileName, $i.ToString("000"), ".txt"))
            DateCreation = $date})
        # On ajoute l'item au tableau
        $tabFiles.add($item)
        # On cree le fichier correspondant dans le dossier $folderPath 
        # On écrase le fichier si il existe déjà
        New-Item -ItemType File -force -Path (-join($folderPath, $fileName, $i.ToString("000"), ".txt"))
    }

    # On exporte le tableau au format XML
    Write-Host "* On exporte le tableau au format XML dans $folderPath\tableau.xml"
    $tabFiles | Export-Clixml (-join($folderPath,"tabelau.xml"))

    # On écrit le tableau formaté dans un fichier de sortie
    Write-Host "* On exporte le tableau au format TXT dans $folderPath\tableau.txt"
    $tabFiles | Format-Table > (-join($folderPath,"tableau_sortie.txt"))

}

# EXERCICE 03

# Dans un tableau interactif (GridView), on veut faire apparaitre les services en cours d’exécution, en affichant les propriétés suivantes (headers) : 
# NomService, ExeFullName, Description.

# On défini une fonction qui va stocker les infos "Win32_Service"
Function getServicesExo3 {
    param(
        # La classe dans laquelle ont fait la recherche de process
        [parameter(Mandatory = $true)]
        [string]$searchServices

    )
    # On veut récupérer les services en cours d'execution "running"
    # On initialise la variable de sortie
    $selectedService = $null
    Write-Host "* Recherche des services actifs dans $searchServices"
    $allServices = Get-WmiObject -Class $searchServices -filter "state = 'running'" | Select-Object -Property Name, PathName, Description 
    # On affiche les resultats
    Write-Host "* Affichage des resultat en GridView pour selection"
    $allServices | Out-GridView -OutputMode Multiple -Outvariable selectedService
    # On boucle sur les services sélectionnés pour les stopper
    if($selectedService.Count -eq 0){
        write-host "* Aucune selection de service."
    }
    else{
        $number_of_services = $selectedService.Count
        write-host "* $number_of_services service(s) selectione(s) pour arret."
        Foreach($service in $selectedService){
            Stop-Service -Name $service.Name -WhatIf
        }
    }
}