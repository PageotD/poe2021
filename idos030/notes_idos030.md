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
write-host "Résultat: $total"
write-host 'Résultat: $total'
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