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