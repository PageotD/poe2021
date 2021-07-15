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
