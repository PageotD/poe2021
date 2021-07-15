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