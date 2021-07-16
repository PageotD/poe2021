# EXERCICE 02

Function createFiles {
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
    If(Test-Path -Path $folderPath){
        write-host "Le dossier TestFinal existe déjà"
    }
    Else{
        write-host "Le dossier TestFinal n'existe pas. Il va être créé."
        New-Item -ItemType Directory -Path $folderPath
    }

    # On veut créer 76 fichiers dont le nom doit correspondre à la nomenclature "monfichierXXX.txt"
    # On veut stocker le nom du fichier et sa date de création dans un tableau
    # On commence par créer le tableau
    [System.Collections.ArrayList]$tabFiles = @()

    $date = (Get-Date)
    For($i=0; $i -lt $nfile; $i++){
        $item = New-Object -TypeName psobject -Property ([Ordered]@{
            NomFichier = (-join($fileName, $i.ToString("000"), ".txt"))
            DateCreation = $date})
        write-host "DATE $date"
        $tabFiles.add($item)
        New-Item -ItemType File -force -Path (-join($folderPath, $fileName, $i.ToString("000"), ".txt"))
    }

    # On exporte le tableau au format XML
    $tabFiles | Export-Clixml (-join($folderPath,"tabelau.xml"))

    # On écrit le tableau formaté dans un fichier de sortie
    $tabFiles | ft > (-join($folderPath,"tableau_sortie.txt"))

}

createFiles -fileName "monfichier" -nfile 76 -folderPath "C:\Temp\TestFinalB\"

