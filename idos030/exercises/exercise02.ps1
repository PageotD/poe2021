# EXERCICE 02

# On teste l'existance du dossier C:\Temp\TestFinal
# Si le dossier existe, on le fait apparaître dans le terminal
# sinon, on le crée
If(Test-Path -Path C:\Temp\TestFinal){
    write-host "Le dossier TestFinal existe déjà"
}
Else{
    write-host "Le dossier TestFinal n'existe pas. Il va être créé."
    New-Item -ItemType Directory -Path C:\Temp\TestFinal
}
# On veut créer 76 fichiers dont le nom doit correspondre à la nomenclature "monfichierXXX.txt"
# On veut stocker le nom du fichier et sa date de création dans un tableau

# On commence par créer le tableau
[System.Collections.ArrayList]$tabFiles = @()

For($i=0; $i -lt 76; $i++){
    $item = New-Object -TypeName psobject -Property ([Ordered]@{
    NomFichier = (-join("monfichier", $i.ToString("000"), ".txt"))
    DateCreation = $Date})
    $tabFiles.add($item)
#    #New-Item -ItemType File -Path (-join("C:\Temp\TestFinal\monfichier", $i.ToString("000"), ".txt")) #$fileFull
}

# On exporte le tableau au format XML
$tabFiles | Export-Clixml C:\Temp\TestFinal\tabelau.xml

# On écrit le tableau formaté dans un fichier de sortie
$tabFiles | ft > C:\Temp\TestFinal\tableau_sortie.txt