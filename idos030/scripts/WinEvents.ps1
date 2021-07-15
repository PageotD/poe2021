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