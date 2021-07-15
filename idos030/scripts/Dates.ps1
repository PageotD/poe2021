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