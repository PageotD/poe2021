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