# Export de la donnée

$process = Get-Process | select Name, ID, CPU

$process | Export-Clixml C:\temp\process.xml

# Import dans une autre session 

$OldProcess = Import-Clixml C:\temp\process.xml

$OldProcess | Export-Csv -Path C:\temp\process.csv -Delimiter ";"