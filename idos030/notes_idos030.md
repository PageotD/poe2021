_IDOS030_

# Powershell & Automatisation de l'administration Windows

## 1-Prérequis à Powershell

**Windows Powershell 5.1** s'execute sur les versions suivantes de Windows. Pour exécuter Windows Powershell 5.1, il faut installer Windows Management Framework 5.1.

| Version de Windows           | Configuration requise                       |
|------------------------------|---------------------------------------------|
| Windows Server 2019          | Installé par défaut                         |
| Windows Server 2016          | Installé par défaut                         |
| Windows Server 2012 R2       | Installer Windows Management Framework 5.1  |
| Windows Server 2012          | Installer Windows Management Framework 5.1  |
| Windows Server 2008 SP1      | Installer Windows Management Framework 5.1  |
| Windows 10 v.1607+           | Installé par défaut                         |
| Windows 10 v.1507, 1511      | Installer Windows Management Framework 5.1  |
| Windows 8.1                  | Installer Windows Management Framework 5.1  |
| Windows 7 SP1                | Installer Windows Management Framework 5.1  |

**Windows Powershell 5.0** s'execute sur les versions suivantes de Windows. Pour exécuter Windows Powershell 5.0, il faut installer Windows Management Framework 5.1 (qui remplace Windows Management Framework 5.0).

| Version de Windows           | Configuration requise                       |
|------------------------------|---------------------------------------------|
| Windows Server 2019          | Installé par défaut                         |
| Windows Server 2016          | Installé par défaut                         |
| Windows Server 2012 R2       | Installer Windows Management Framework 5.1  |
| Windows Server 2012          | Installer Windows Management Framework 5.1  |
| Windows Server 2008 SP1      | Installer Windows Management Framework 5.1  |
| Windows 10 v.1607+           | Installé par défaut                         |
| Windows 10 v.1507, 1511      | Installer Windows Management Framework 5.1  |
| Windows 8.1                  | Installer Windows Management Framework 5.1  |
| Windows 7 SP1                | Installer Windows Management Framework 5.1  |

**Windows Powershell 4.0** s'execute sur les versions suivantes de Windows. Pour exécuter Windows Powershell 4.0, il faut installer Windows Management Framework 4.0.

| Version de Windows           | Configuration requise                       |
|------------------------------|---------------------------------------------|
| Windows 8.1                  | Installé par défaut                         |
| Windows Server 2012 R2       | Installé par défaut                         |
| Windows Server 2008 SP1      | Installer Windows Management Framework 4.0  |
| Windows 7 SP1                | Installer Windows Management Framework 4.0  |

**Windows Powershell 3.0** s'execute sur les versions suivantes de Windows. Pour exécuter Windows Powershell 3.0, il faut installer Windows Management Framework 3.0.

| Version de Windows           | Configuration requise                       |
|------------------------------|---------------------------------------------|
| Windows 8                    | Installé par défaut                         |
| Windows Server 2012          | Installé par défaut                         |
| Windows Server 2008 R2 SP1   | Installer Windows Management Framework 3.0  |
| Windows Server 2008 SP2      | Installer Windows Management Framework 3.0  |
| Windows 7 SP1                | Installer Windows Management Framework 3.0  |


Pour connaître la version de Powershell installée sur le client, on utilise la commande:
```powershell
$PSVersionTable
```

## 2-Les environnements de travail

Il est possible de travailler avec **Powershell** via la console Powershell, **ISE** (Integrated Scripting Environment) ou même via un terminal VSCode.

Grâce à l'**ISE**, il est possible d'utiliser des profils qui permettent l'execution automatique d'un script au démarrage d'une session Powershell. Cela permet, par exemple, d'executer des fonctions personnelles ou d'importer automatiquement des modules.

## 3-Powershell gallery

De nombreux modules Powershell sont mis à disposition sur la [Powershell Gallery](https://www.powershellgallery.com/). Il faut en prérequis disposer d’une connexion internet et que les flux vers la galerie soient ouverts.

On peut par exemple chercher le script 7zip sur la galerie, récupérer la commande fournie et l'executer dans **ISE**:
 
```powershell
Install-Module -Name 7Zip4Powershell
```

Les modules sont localisés dans:
```
C:\Windows\System32\WindowsPowerShell\v1.0\Modules
C:\Users\<USERNAME>\Documents\WindowsPowerShell\Modules
```

On peut importer un module avec la commande suivante:

```powershell
Save-Module 7Zip4Powershell -Path C:\temp\Module7Zip -Force
```

## 4-Sécurité

**Restricted**: Politique qui bloque l'intégralité des scripts PowerShell sur une machine, mais qui autorise l'utilisation de la console PowerShell ou d'un outil comme Windows Terminal pour exécuter du code en mode interactif.Néanmoins, cela signifie qu'il n'est pas possible d'exécuter directement un fichier PS1.

**AllSigned**: En entreprise, il s'agit de la politique d'exécution la plus sûre d'un point de vue sécurité puisqu'elle permet d'autoriser l'exécution des scripts PowerShell, à condition que le script soit signé par un certificat à partir de l'autorité de certification de votre entreprise (ADCS). La contrainte, c'est qu'à chaque fois qu'un script est modifié, même d'un seul caractère, il doit être signé de nouveau. Un peu plus lourd en termes d'administration, mais idéal pour la sécurité de votre SI.

**RemoteSigned**: Politique d'exécution par défaut sous Windows Server depuis Windows Server 2012 R2, elle autorise l'exécution des scripts locaux, mais bloque ceux en provenance d'Internet. 

**Unrestricted**: Cette politique autorise l'exécution de tous les scripts, que ce soit des scripts locaux ou en provenance d'Internet. Cependant, si un script provient d'Internet, un message d'avertissement s'affiche et vous devez confirmer que vous souhaitez qu'il soit exécuté.

**Bypass**: Il s'agit du mode "open bar" : il n'y a aucun contrôle, et tous les scripts, peu importe la provenance, seront exécutés sur la machine. A éviter en production.

**Undefined**: Ce mode signifie "non défini" et donc c'est la politique par défaut qui va s'appliquer, ou celle du scope de niveau supérieur. Vous comprendrez mieux cette notion de scope et la politique Undefined en poursuivant la lecture de cet article.

On peut connaître la sécurité appliquée grâce à la commande:
```powershell
Get-ExecutionPolicy
```

La sécurité peut être modifiée avec la commande:
```powershell
Set-ExecutionPolicy -ExecutionPolicy bypass
```

## 5-GET-COMMAND, GET-HELP

```powershell
### commandlet Get-command
Get-Command -Name Set-Variable -ShowCommandInfo

### commandlet Get-help
get-help -Name Set-Variable -Detailed

### Commandlet get-item
get-childitem c:\windows -Filter *.exe

### Command window
# ==> bouton help + insertion commande pré-saisie
```

## 6-Variables

```powershell
####### Création de variables
# Typer n'est pas nécessaire 
$var1 = "Hello"

# mais conseillé pour des variables servant pour des calculs par exemples
[string]$var1 = "Hello"
[int]$var2 = 2

$global:var1 = "hello"

New-Variable -Name var3 -Value "Hello" -Scope Script # le scope

$cpt = Get-Random

new-variable -name "var$cpt" -Value "Hello1"

Set-Variable -Name var3 -Value "Hello2"

Remove-Variable -name var3

####### Utilisation des variables

# Calcul
[int]$chiffre1 = 10
[int]$chiffre2 = 2

$total = $chiffre1 + $chiffre2

# Affichage
#Les doubles quotes prennent en compte la chaine de texte et la variable
write-host "Résultat: $total"
# Les simples quotes considèrent que tout est texte
write-host 'Résultat: $total'
# Le caractère ` joue le rôle d'échappement, le $ ne sera pas interprété
write-host "Le contenu de la variable `$total est: $total"

# Fonctions mathématiques 
[int]$chiffre1 = 100
[int]$chiffre2 = 43.56

$division = $chiffre1 / $chiffre2

write-host $division

[System.Math]::Round($division, 2)

[System.Math]::Truncate($division)

####### fonctions string
$var = $null

[string]::IsNullOrEmpty($var)

$var = "hello"

[string]::IsNullOrEmpty($var)

### switch

$var = "ok"

switch ($var)
{
    test {
        write-host "test"
    }
    ok {
        write-host "OK"
    }
    default {
        write-host "default"
    }
}
```

## 7-Commentaires

```powershell
### Commentaires

Start-Sleep -Seconds 5 # Commentaire

<# Début commentaires

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
#> 

### Les Regions, case sensitive
### #region <nom_de_region> permet de créer des blocs dans le scripts

#region test

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

#endregion
```

## 8-Fonctions et Switch

```powershell
### Functions

# affichage simple

function calcul {
    param ($chiffre1, $chiffre2)
    $total = $chiffre1 + $chiffre2

    write-host $total
}

calcul -chiffre1 2 -chiffre2 6

# renvoie résultat

function calculReturn {
    param ($chiffre1, $chiffre2)
    $total = $chiffre1 + $chiffre2

    return $total
}

$resultat = calculReturn -chiffre1 2 -chiffre2 6

# actions sur une variable globale

$global:res = 0

function calculGlob {
    param ($chiffre1, $chiffre2)
    
    $global:res = $chiffre1 + $chiffre2 # !!! la variable global res doit être appelée $global:res lorqu'elle est utilisée
    $total = $chiffre1 + $chiffre2
}

calculGlob -chiffre1 2 -chiffre2 6

$global:res

# fonction plus travaillée, 
### AIDE :
# https://docs.microsoft.com/fr-fr/powershell/module/microsoft.powershell.core/about/about_comment_based_help?view=powershell-7.1
# https://docs.microsoft.com/fr-fr/powershell/module/microsoft.powershell.core/about/about_functions_advanced_parameters?view=powershell-7.1

Function CalculComplete {
    
    param (
        [Parameter(Mandatory=$true)]
        [int]$chiffre1,

        [Parameter(Mandatory=$true)]
        [int]$chiffre2,
        
        [Parameter(Mandatory=$true,
        ParameterSetName="Action")]
        [ValidateSet("Addition", "multiplication")]
        [string]$Action
        
    )

    switch ($action) {
        "addition" {
            $res = $chiffre1 + $chiffre2
        }
        "Multiplication" {
            $res = $chiffre1 * $chiffre2
        }
    }

    return $res

    <#
        .SYNOPSIS
        Renvoie le résultat d'une addition ou d'une multiplication entre 2 nombres.

        .DESCRIPTION
        Donnez en paramètre le nombre numéro 1 ainsi que le nombre numéro 2 et enfin l'action souhaitée (addition ou multiplication) pour obtenir un résultat.

        .PARAMETER chiffre1
        Spécifiez le chiffre 1 

        .PARAMETER chiffre2
        Spécifiez le chiffre 2

        .PARAMETER action
        Spécifiez l'action

        .EXAMPLE
        PS> CalculComplete -chiffre1 2 -chiffre2 5 -Action multiplication 
    #>
}

CalculComplete -chiffre1 2 -chiffre2 5 -Action multiplication 
CalculComplete -chiffre1 2 -chiffre2 5 -Action Addition 
```

## 9-Appel de script

L'appel de scripts se fait sous la forme:

```powershell
& .\Script.ps1 -chiffre1 10 -chiffre2 1 -Action multiplication 
```

ou encore:
```powershell
$res2 = Start-Process powershell.exe -ArgumentList "-file .\script2.ps1 -chiffre1 10 -chiffre2 1 -Action multiplication" -PassThru 
$res2.ExitCode
```

## 10-Modules

```powershell
### Module de fonction
#
# pour la création d'un manifest voir :
# https://docs.microsoft.com/fr-fr/powershell/scripting/developer/module/how-to-write-a-powershell-module-manifest?view=powershell-7.1

Function writelog {
    param ($message, $filename)

    add-content $filename -Value "$(get-date -Format "dd/MM/yyyy hh:mm:ss") --- $message"
}
```

## 11-Pipeline et branches de contrôle

```powershell
### Pipeline + try / catch
# Aide :
# https://docs.microsoft.com/fr-fr/powershell/module/microsoft.powershell.core/about/about_try_catch_finally?view=powershell-7.1
# https://docs.microsoft.com/fr-fr/powershell/module/microsoft.powershell.core/about/about_pipelines?view=powershell-7.1

Get-ChildItem -Path $env:USERPROFILE\desktop\TestPowerShell.txt

try {
    Get-ChildItem -Path $env:USERPROFILE\desktop\TestPowerShell.txt -ErrorAction Stop
    Write-host "Le fichier a été trouvé"
} catch {
    write-host "le fichier n'a pas été trouvé"
    write-host "L'erreur est la suivante : $($_.Exception.Message)"
} 

new-item $env:USERPROFILE\desktop -Name TestPowerShell.txt -ItemType File -Value "ok"

# rejouer le try / catch

try {
    Get-ChildItem -Path $env:USERPROFILE\desktop\TestPowerShell.txt | Remove-Item -Force -ErrorAction Stop # le pipeline ("|") renvoie le contenu de la première commande à la seconde pour traitement chainé
    Write-host "Le fichier a été supprimé"
} catch {
    write-host "le fichier n'a pas été supprimé"
    write-host "L'erreur est la suivante : $($_.Exception.Message)"
} 

# rejouer le try / catch et constater qu'il n'agit pas comme attendu

try {
    Get-ChildItem -Path $env:USERPROFILE\desktop\TestPowerShell.txt -ErrorAction Stop | Remove-Item -Force -ErrorAction Stop
    Write-host "Le fichier a été supprimé"
} catch {
    write-host "le fichier n'a pas été supprimé"
    write-host "L'erreur est la suivante : $($_.Exception.Message)"
} 

### IF
# Aide :
# https://docs.microsoft.com/fr-fr/powershell/module/microsoft.powershell.core/about/about_operators?view=powershell-7.1
# https://docs.microsoft.com/fr-fr/powershell/module/microsoft.powershell.core/about/about_logical_operators?view=powershell-7.1
# https://docs.microsoft.com/fr-fr/powershell/module/microsoft.powershell.core/about/about_regular_expressions?view=powershell-7.1

if ($(Get-Service -Name EventLog).Status -match "Stopped")
{
    write-host "Le service EventLog est arrêté"
}
else
{
    write-host "Le service EventLog ne semble arrêté"
    write-host "Voici l'état: $($(Get-Service -Name EventLog).Status)"
}

### for

for ($i = 0; $i -le 100; $i++) # de $i = 0 à $i = 100 par pas de 1
{
    if ($i % 5 -eq 0)
    {
        write-host "Miltiple de 5 trouvé : $i"
    }
}

for ($i = 0; $i -le 100; $i = $i + 2) # de $i = 0 à $i = 100 par pas de 2
{
    if ($i % 5 -eq 0)
    {
        write-host "Miltiple de 5 trouvé : $i"
    }
}

(1..100) | foreach { 
    if ($_ % 5 -eq 0) # ici "$_" représentent l'occurrence courante renvoyée dans le Pipeline
    {
        write-host "Miltiple de 5 trouvé : $_"
    }
}

# 2 écritures possibles d'un foreach

# première :

foreach ($item in (Get-ChildItem C:\Windows -Filter *.exe))
{
    write-host $item.fullname
}

# seconde :

Get-ChildItem C:\Windows -Filter *.exe | foreach { # s'écrit aussi " | % {}"
    write-host $_.fullname
}

# on peut avoir recours aux 2 lorsque l'on imbrique plusieurs boucles for :

foreach ($service in (Get-Service))
{
    write-host "--- Service $($service.Name)"
    
    if ($service.RequiredServices)
    {
        Write-host "--- A pour prérequis":

        $service.RequiredServices | % {
            Write-host "------ $($_.DisplayName)"
        }
    }
}

### while

$cpt = 0

cls # clear screen

while ($cpt -lt 10)
{
    $cpt++
    write-host $cpt
    start-sleep -Seconds 1
}

while (!(test-path "$env:USERPROFILE\desktop\pointeur.txt"))
{
    write-host ...
    start-sleep -Seconds 1
}
```

## 12-Tableaux

```powershell
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
```

## 13-Gestion des fichiers

```powershell
### gestion fichiers

new-item -Path C:\temp -Name Fichier.txt -ItemType File -Value "Demonstration Powershell`r`n"

rename-item -Path "C:\temp\Fichier.txt" -NewName "Fichier2.txt"

add-content "C:\temp\Fichier2.txt" -Value "..."

Copy-item -Path "C:\temp\Fichier2.txt" -Destination "C:\temp\Fichier.txt"

remove-item -Path "C:\temp\Fichier2.txt"

### gestion ACL

$SID = $([wmi] "win32_userAccount.Domain='EU',Name='ng58e90'").sid
 
$acl = get-acl "C:\temp\Fichier.txt"

$acl.SetAccessRuleProtection($True, $True)

$colRights = [System.Security.AccessControl.FileSystemRights]"Fullcontrol" 
$objType =[System.Security.AccessControl.AccessControlType]::Allow 
$Userapp = (New-Object System.Security.Principal.SecurityIdentifier($SID))
$ace = new-object security.accesscontrol.filesystemaccessrule($userapp, $colRights, $objType)
$acl.addaccessrule($ace)

Set-Acl -Path "C:\temp\Fichier.txt" -AclObject $acl

$currentacl = get-acl "C:\temp\Fichier.txt"
$objUser = $Userapp.Translate( [System.Security.Principal.NTAccount])

$acldelete = $null

foreach ($item in $currentacl.access) {
    if ($item.IdentityReference -like $objUser.value) {
        $acldelete = $item
    }
}

if ($acldelete -ne $null)
{
    $currentacl.removeaccessrule($acldelete)

    if ($?) {
        $deletion = $true
    }
    else
    {
        $deletion = $false
    }
    set-acl "C:\temp\Fichier.txt" $currentacl
}
```

## 14-Gestion des clés de registre

```powershell
### clé de registre

get-item HKLM:\SOFTWARE\AirbusBDM ### affiche la clé de registre et ses valeurs

New-PSDrive -Name HKCU -PSProvider Registry -Root HKEY_CURRENT_USER

get-item HKCU:\Software\7-Zip ### ne renvoie pas un tableau exploitable

New-ItemProperty HKCU:\Software\7-Zip -Name "test" -Value 0 -PropertyType DWORD

Remove-ItemProperty -Path HKCU:\Software\7-Zip -Name "test" -Force

Get-ChildItem -Path HKCU:\Software\7-Zip ### affiche les clés de registre enfant et leur propriétés

Get-ChildItem -Path HKCU:\Software\7-Zip -Recurse ### même chose mais récursive

Get-ItemPropertyValue HKCU:\Software\7-Zip -Name Lang ### permet d'obtenir la valeur d'une propriété bien précise

$(get-itemproperty HKCU:\Software\7-Zip)."$($(get-itemproperty HKCU:\Software\7-Zip | Get-Member | ?{$_.name -match "^Lang$"}).name)"

### USB 

get-childitem registry::hkey_local_machine\SYSTEM\CurrentControlSet\Enum\USB -Recurse | % {
    $value = $(Get-ItemPropertyValue -Path "registry::$($_.name)" -Name DeviceDesc -ErrorAction SilentlyContinue).tostring()
}
```

## 15-Win Events

```powershell
### command events

# Get-EventLog, facile a utiliser sur les journaux classiques et permet de filtrer rapidement (EntryType, Source). Limité malgré tout

Get-EventLog -LogName System -Newest 10


# Get-WinEvent plus compliquée à utiliser mais bien plus complète

Get-WinEvent -LogName security | where {$_.Id -eq 4634} # pas de filtre, tout est envoyé dans le pipe ==> traitement très long

Get-WinEvent -FilterHashtable @{logname='Security'; id=4634} # requête filtrée mais basique.
# pour savoir sur quels autres critères que "ID" on peut effectuer un filtre :

$event = Get-WinEvent -FilterHashtable @{logname='Security'; id=4634} | select -First 1 # on récupère un event
$event | Get-Member -MemberType Property # on accède ici à toutes les propriétés avec lesquelles nous pourrons intéragir 

# Filtre beaucoup plus compliqué à mettre en place mais bien plus précis et rapide 

[xml]$filter = @"
<QueryList>
  <Query Id="0" Path="Microsoft-Windows-WMI-Activity/Operational">
    <Select Path="Microsoft-Windows-WMI-Activity/Operational">*[System[(EventID=5857)]] and *[UserData[Operation_StartedOperational[ProviderPath="%SystemRoot%\system32\tscfgwmi.dll"]]]</Select>
  </Query>
</QueryList>
"@
 
Get-WinEvent -FilterXml $filter

# la matrice du filtre peut se créer grâce à l'eventviewer et se compléter en se basant sur l'ossature XML d'un type d'event souhaité
```

## 16-Exécution des process

```powershell
### start process

$process = Start-Process -FilePath C:\Windows\System32\cmd.exe -ArgumentList "/c echo test" -Wait -PassThru -RedirectStandardOutput stdout.txt

write-host $process.ExitCode

# en tant qu'administrateur 

$process2 = Start-Process -FilePath C:\Windows\System32\cmd.exe  -ArgumentList "/c echo test" -Wait -PassThru -Verb Runas

# avec le "Call operator" & 

$test = & C:\Windows\System32\cmd.exe /c echo test

### stdout

$pinfo = New-Object System.Diagnostics.ProcessStartInfo
# $pinfo = [System.Diagnostics.ProcessStartInfo]::new()
$pinfo.FileName = "cmd.exe"
$pinfo.RedirectStandardError = $true
$pinfo.RedirectStandardOutput = $true
$pinfo.UseShellExecute = $false
$pinfo.Arguments = "/c ping 4.4.4.4." # remplacer par "pong" pour tester $stderr
$p = New-Object System.Diagnostics.Process
$p.StartInfo = $pinfo
$p.Start() | Out-Null
$stdout = $p.StandardOutput.ReadToEnd()
$stderr = $p.StandardError.ReadToEnd()
$p.WaitForExit()
```

## 17-Gestion des dates

```powershell
### date

get-date

$now = [datetime]::Now

$anniversary = get-date -Date "16/04/1987"

get-date $anniversary -Format "dd/MM/yy"

$anniversary = [datetime]::new("1987","04","16")

$age = $now - $anniversary

$years = [System.Math]::round($age.Days / 365, 2)

$months = [System.Math]::round(12 * $($($years -split "\.")[1] / 100), 2)

write-host "Je suis né il y a $([System.Math]::Truncate($years)) ans et $([System.Math]::Truncate($months)) mois"

# les ticks, très pratiques pour manipuler des dates au format différent ou bien 

$date = get-date
$date.Ticks

# Convertion d'une date issue de WMI :

$ProcessTest = Get-WmiObject -Query "select * from win32_process" | select -First 1 # recupère les informations sur un process en cours d'exécution dans l'instance Win32_Process
$ProcessTest.CreationDate

$dateConverted = [System.Management.ManagementDateTimeConverter]::ToDateTime($ProcessTest.CreationDate)

$date -gt $dateConverted
```

## 18-API et DLL

```powershell
### Intéraction avec les API Windows
# Aide :
# https://en.wikipedia.org/wiki/Microsoft_Windows_library_files#:~:text=DLL,-Further%20information%3A%20Windows&text=information%3A%20Windows%20USER-,USER32.,the%20Windows%20look%20and%20feel.

add-type @"
using System;
using System.Runtime.InteropServices;
namespace FormationPowerShell {
    public class Fonctions {
        [DllImport("user32.dll")]
        private static extern bool ShowWindowAsync(IntPtr hWnd, int nCmdShow);
        public static void ShowWindow(IntPtr hWnd) {
            ShowWindowAsync(hWnd,5);
        }
        public static void HideWindow(IntPtr hWnd) {
            ShowWindowAsync(hWnd,0);
        }
    }
}
"@

$ID = $(Get-Process -Name cmd).MainWindowHandle

[FormationPowerShell.Fonctions]::HideWindow($id)

[FormationPowerShell.Fonctions]::ShowWindow($id)

### Intéraction avec des DLL .NET
# connaitre la liste des functions présentes dans la DLL

$asm = [System.Reflection.Assembly]::LoadFile("C:\Users\cblacher\Desktop\Formation PowerShell\sccmclictr.automation.dll")
$asm.GetTypes() | select Name, Namespace | sort Namespace | ft -groupby Namespace
$asm.GetTypes() | ?{$_.IsPublic} | select Name, Namespace | sort Namespace | ft -groupby Namespace
$asm.GetTypes() | ?{$_.IsPublic} | select @{n=‘Members’;e={$_.GetMembers(‘Public,Instance’)}} | select -expand Members -ea 0 | ? {!$_.IsSpecialName} | measure-object

#utiliser une des fonctions

$asm.Modules.Assembly.GetName().name

#[sccmclictr.automation.functions]
```

## 19-Signature des scripts

```powershell
$pass = Read-Host 'Mot de passe à utiliser?' -AsSecureString
$duree = Read-Host 'Durée en année?'
$subject=Read-Host 'sujet du certificat?'
 
# on se place au niveau machine
Set-Location Cert:\LocalMachine\My
  
#un certificat du même sujet existe ?
$thumbprint =Get-ChildItem | Where-Object {$_.subject -match $subject}  | Select-Object -first 1 | select -ExpandProperty Thumbprint
if($thumbprint -ne $null)
{
    Write-Host "deleting old one "$thumbprint;
    Remove-Item -Path $thumbprint;
}
 
# création d'un nouveau certificat
New-SelfSignedCertificate -NotAfter (Get-Date).AddYears($duree) -TextExtension ('2.5.29.37={text}1.3.6.1.5.5.7.3.3','2.5.29.19={text}Subject Type:End Entity') -Type Custom -Subject $subject -KeyUsage DigitalSignature -FriendlyName "Certificat de signature de code" -CertStoreLocation "Cert:\LocalMachine\My"
 
# récupération du thumbprint du certifcat créé
$thumbprint = Get-ChildItem | Where-Object {$_.subject -match $subject} | Select-Object -first 1 | select -ExpandProperty Thumbprint;
 
#Export du PFX
Export-PfxCertificate -cert $thumbprint -Password $pass -FilePath $env:USERPROFILE\desktop\MON_CERTIFICAT.pfx

# installation du certificat dans "ordinateur local" puis dans le magasin "Autorités de certification racines de confiance"

### signature du script 

$cert = Get-ChildItem Cert:\LocalMachine\root -CodeSigningCert

# exécution du script pour test 1

& "$env:USERPROFILE\Desktop\formation powershell\scripttest.ps1"

Set-ExecutionPolicy -ExecutionPolicy AllSigned # change la politique de sécurité pour n'exécuter QUE les scripts signés

# rejouer le script

& "C:\temp\tableau\scripttest.ps1"

Set-AuthenticodeSignature "C:\temp\tableau\scripttest.ps1"  -Certificate $cert # signature du script

# rejouer le script

& "D:\Formation PowerShell\scripttest.ps1"

# ouvrir mmc.exe en tant qu'administrateur (pour accéder à ordinateur local) et gérer manullement le certificat

# rejouer le script 

& "$env:USERPROFILE\Desktop\formation powershell\scripttest.ps1"

Set-ExecutionPolicy -ExecutionPolicy RemoteSigned

# rejouer le script 

& "$env:USERPROFILE\Desktop\formation powershell\scripttest.ps1"
```

## 20- Création d'utilisateurs locaux et crédentials

```powershell
Get-LocalUser # liste les utilisateurs locaux

Get-LocalGroup # liste les groupes locaux

$PWD = ConvertTo-SecureString -AsPlainText Formation@1234 -Force # convertion du MDP en Secure String

New-LocalUser -AccountNeverExpires -Description "Compte Admin local" -Name AdminLocal -Password $PWD -PasswordNeverExpires

Get-LocalUser -Name Adminlocal # vérification

Add-LocalGroupMember -Group Administrateurs -Member Adminlocal -WhatIf # ajoute le compte créé au groupe Administrateur

Start-Process powershell.exe -ArgumentList "-command `"add-content c:\temp\log.txt -value `$env:username" -Credential (Get-Credential) -WindowStyle Hidden # lancement d'un process avec les droits du compte créé
```

## 21-Gestion des services et gridview

```powershell
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
```

## 22-WMI

```powershell
# Ouvrir WMI-Explorer

$processComplet = Get-WmiObject -Query "Select * from Win32_process where Name LIKE '%Powershell_ISE%'" | select -First 1

$processLight = Get-WmiObject -Query "Select * from Win32_process where Name LIKE '%Powershell_ISE%'" | select -First 1 -Property Name, ProcessID

$processComplet.GetOwner()

$processLight.GetOwner() # n'existe pas

Get-WmiObject -Class "Win32_Process" -List | select Methods -ExpandProperty Methods

#https://docs.microsoft.com/en-us/windows/win32/cimwin32prov/create-method-in-class-win32-process

$process = Invoke-WmiMethod -Class "Win32_Process" -Name Create -ArgumentList ("cmd.exe","C:\windows\system32")

# https://docs.microsoft.com/en-us/windows/win32/cimwin32prov/terminate-method-in-class-win32-process

$cmd = Get-WmiObject -Query "Select * from Win32_process where  ProcessID = '$($process.ProcessId)'" | select -First 1

$cmd.Terminate()
```

## 23-Export/import CLIXML/CSV

```powershell
# Export de la donnée

$process = Get-Process | select Name, ID, CPU

$process | Export-Clixml C:\temp\process.xml

# Import dans une autre session 

$OldProcess = Import-Clixml C:\temp\process.xml

$OldProcess | Export-Csv -Path C:\temp\process.csv -Delimiter ";"
```

## 24-COM Objects

```powershell
### COM Objects
#
# https://docs.microsoft.com/fr-fr/powershell/scripting/samples/creating-.net-and-com-objects--new-object-?view=powershell-7.1

# envoie d'un email grâce au COM Object Outlook

Add-Type -assembly "Microsoft.Office.Interop.Outlook"
add-type -assembly "System.Runtime.Interopservices"
try
{
    $outlook = [Runtime.Interopservices.Marshal]::GetActiveObject('Outlook.Application')
    $outlookWasAlreadyRunning = $true
}
catch
{
    try
    {
        $Outlook = New-Object -comobject Outlook.Application
        $outlookWasAlreadyRunning = $false
    }
    catch
    {
        write-host "You must exit Outlook first."
        exit
    }
}

$Mail = $Outlook.CreateItem(0)
$Mail.To = "christophe.blacher@capgemini.com"
$Mail.Subject = "Mail test Formation PowerShell"
$Mail.Body = "Ceci est un mail de test afin d'essayer l'envoie d'un email via PowerShell en utilisant l'objet COM Outlook"
$Mail.Send()

# Tips, lister tous les objest COM disponibles

Get-ChildItem HKLM:\Software\Classes -ErrorAction SilentlyContinue | Where-Object {
   $_.PSChildName -match '^\w+\.\w+$' -and (Test-Path -Path "$($_.PSPath)\CLSID")
} | Select-Object -ExpandProperty PSChildName
```