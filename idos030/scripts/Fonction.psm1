### Module de fonction
#
# pour la création d'un manifest voir :
# https://docs.microsoft.com/fr-fr/powershell/scripting/developer/module/how-to-write-a-powershell-module-manifest?view=powershell-7.1

Function writelog {
    param ($message, $filename)

    add-content $filename -Value "$(get-date -Format "dd/MM/yyyy hh:mm:ss") --- $message"
}
