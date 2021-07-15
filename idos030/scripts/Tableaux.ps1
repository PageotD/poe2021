####### Tableaux

$tab = @("Test1","Test2")

$tab += "Test3"

$tab -= "Test1"

[System.Collections.ArrayList]$tab2 = @()

$tab2.add("Test1")
$tab2.add("Test2")
$tab2.add("Test3")

$tab2

$tab2.remove("Test2")

$tab2

####### Tableaux complexes

[System.Collections.ArrayList]$tab3 = @()

$item = New-Object -TypeName psobject -Property ([Ordered]@{
    Marque = "Renault"
    Modèle = "Megane"
    Année = "2017"
})

$tab3.add($item)

$item = New-Object -TypeName psobject -Property ([Ordered]@{
    Marque = "Seat"
    Modèle = "Leon"
    Année = "2013"
})

$tab3.add($item)

$item = New-Object -TypeName psobject -Property ([Ordered]@{
    Marque = "Peugeot"
    Modèle = "206"
    Année = "1998"
})

$tab3.add($item)

# Ajout d'une propriété à un item

$tab3 | where {$_.modèle -eq "Megane"} | Add-Member -MemberType NoteProperty -Name "Puissance" -Value "205 Cv"
$tab3 | where {$_.modèle -eq "Leon"} | Add-Member -MemberType NoteProperty -Name "Puissance" -Value "184 Cv"

$tab3 | foreach {
    write-host "Il s'agit d'une voiture de marque $($_.marque), modèle: $($_.modèle). Puissance référencée: $($_.puissance)"
}

foreach ($voiture in $tab3){
    write-host "Il s'agit d'une voiture de marque $($voiture.marque), modèle: $($voiture.modèle). Puissance référencée: $($voiture.puissance)"
}

# condition

foreach ($voiture in $tab3){

    if (!($voiture.puissance))
    {
        write-host "Il s'agit d'une voiture de marque $($voiture.marque), modèle: $($voiture.modèle). Puissance référencée: non référencée"
    }
    else
    {
        write-host "Il s'agit d'une voiture de marque $($voiture.marque), modèle: $($voiture.modèle). Puissance référencée: $($voiture.puissance)"
    }
}

foreach ($voiture in $tab3){
    write-host "Il s'agit d'une voiture de marque $($voiture.marque), modèle: $($voiture.modèle). Puissance référencée: $(if(!($voiture.puissance)){"puissance non référencée"}else{$voiture.puissance})"
}

#### manipulation d'un tableau

## compteur

$tab3.count

## recherche

$tab3.Contains("Seat")

$($tab3.marque).Contains("Seat") #<=== Case sensitive 

$tab3.marque -match "seat"

$tab3 | ? {$_.Marque -match "Seat"}

$tab3.IndexOf($($tab3 | ? {$_.Marque -match "Peugeot"}))

$tab3[1]

## Insertion a un index spécifique

$item = New-Object -TypeName psobject -Property ([Ordered]@{
    Marque = "Dacia"
    Modèle = "Duster"
    Année = "2018"
    Puissance = "130"
})

$tab3.Insert(1, $item)

## traduction à la volée 

$tab3 | foreach {
    $_ | select @{Name = 'trademark'; Expression = {$_.Marque}}, @{Name = 'Model'; Expression = {$_."Modèle"}}, @{Name = 'HP'; Expression = {$_.puissance}}
}

## copie 

[System.Collections.ArrayList]$tab4 = $tab3 | where {
    $_.marque -ne "Peugeot"
}

## comparaison

$test = Compare-Object -ReferenceObject $tab3 -DifferenceObject $tab4 -IncludeEqual

write-host "La voiture qui a été supprimée est la suivante: $(($test | where {$_.SideIndicator -ne "=="}).InputObject."modèle")"

## changement valeurs

$tab3[2].Modèle = 308
$tab3[2].Année = 2018
$tab3[2].Puissance = "150 Cv"

## suppression d'objets

$($tab3 | ? {$_.Marque -in ("Seat","Renault")}) | % {
    $tab3.remove($_)
}

####### Function

# parameters: https://social.technet.microsoft.com/wiki/contents/articles/15994.powershell-advanced-function-parameter-attributes.aspx
#             https://buzut.fr/la-puissance-des-regex/

function ModifTab {
    param (
        [parameter(Mandatory = $true)]
        [ValidateLength(0,10)]
        [ValidateNotNullOrEmpty()]
        [ValidatePattern("\D+$")] # l'argument ne peut pas contenir de chiffre
        [string]$marque,

        [parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [string]$modele,

        [ValidateNotNullOrEmpty()]
        [string]$puissance = "non renseignée"
    )
        
    [System.Collections.ArrayList]$tab3 = @()

    $item = New-Object -TypeName psobject -Property ([Ordered]@{
        Marque = $marque
        Modèle = $modele
        Puissance = $puissance
    })

    return $item
}

[System.Collections.ArrayList]$tab = @()

$tab.Add($(ModifTab -marque "Renault" -modele "Megane" -puissance "205 Cv"))
$tab.Add($(ModifTab -marque "Seat" -modele "Leon" -puissance "184 Cv"))
$tab.Add($(ModifTab -marque "Peugot" -modele "206"))

Function Traitement{
    param (
        [parameter(Mandatory = $true,
        ValueFromPipeline=$true)]
        $item
    )

    write-output "La voiture n°$global:cpt est un(e) $($item."modèle") de la marque $($item.marque)"
    $cpt++
    
}

[int]$cpt = 1

$tab | %{
    $_ | Traitement
}

#### avec variable globale

Function Traitement2{
    param (
        [parameter(Mandatory = $true,
        ValueFromPipeline=$true)]
        $item
    )

    write-output "La voiture n°$global:cpt2 est un(e) $($item."modèle") de la marque $($item.marque)"
    $global:cpt2++
    
}

[int]$global:cpt2 = 1

$tab | %{
    $_ | Traitement2
}