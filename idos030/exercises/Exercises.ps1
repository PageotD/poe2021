# On importe le module contenant les fonctions 
# que l'on veut executer pour les différents exercices
Import-Module .\module_td.ps1 

# --------------------------------------------------------------------------------
# Exercice 01
# --------------------------------------------------------------------------------
# On démarre la transcription
Start-Transcript C:\Temp\transcript_exercise01.txt

# Call getSysEvents with parameters searchID (i.e. 6005) and the number of days (i.e. 21)
getSysEventsExo1 -searchID 6005 -ndays 21

# On stoppe la transcription
Stop-Transcript

# --------------------------------------------------------------------------------
# Exercice 02
# --------------------------------------------------------------------------------
# On démarre la transcription
Start-Transcript C:\Temp\transcript_exercise02.txt

# Create 76 files formatted "monfichierXXX.txt" in a Folder named TestFinal
createFilesExo2 -fileName "monfichier" -nfile 76 -folderPath "C:\Temp\TestFinal\"

# On stoppe la transcription
Stop-Transcript

# --------------------------------------------------------------------------------
# Exercice 03
# --------------------------------------------------------------------------------
# On démarre la transcription
Start-Transcript C:\Temp\transcript_exercise03.txt

# Open "running" Win32_Service in GridView and stop selected services
getServicesExo3 -searchServices "Win32_Service"

# On stoppe la transcription
Stop-Transcript