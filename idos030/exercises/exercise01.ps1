# EXERCICE 01
Function getSysEvents{
    param(
        # ID to search
        [parameter(Mandatory = $true)]
        [int]$searchId,
        # Number of days for which the ID search must be done
        [parameter(Mandatory = $true)]
        [int]$ndays
    )

    # Get the starting date
    $date = (Get-Date).Adddays(-1*$ndays)

    # Search for events with ID=$searchId after $date and write output in c:\Temp\exercise01_start.txt
    Get-WinEvent System | Where-Object {$_.id -eq 6005 -and $_.TimeCreated -ge $Date} > C:\Temp\exercise01_start.txt
}

# Call getSysEvents with parameters searchID (i.e. 6005) and the number of days (i.e. 21)
getSysEvents -searchID 6005 -ndays 21