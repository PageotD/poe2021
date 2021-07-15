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
