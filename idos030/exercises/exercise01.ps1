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

    # Get the starting time in ms format ndays*24*3600*1000
    $startTime = $ndays*24*3600*1000
    # Print the request date for confirmation
    write-host (Get-Date).Adddays(-1*$ndays)

    $customFilterXML = "
        <QueryList>
            <Query Id='0' Path='System'>
                <Select Path='System'>*[System[(EventID=$searchID) and TimeCreated[timediff(@SystemTime) &lt;= $startTime]]] 
                </Select>
            </Query>
        </QueryList>
    "

    # Search for events with ID=$searchId after $startDate and write output in c:\Temp\exercise01_start.txt
    Get-WinEvent -FilterXml $customFilterXML | Out-File -FilePath C:\Temp\exercise01_start.txt
    # Search for events with ID=$searchId after $startDate and write output in c:\Temp\exercise01_start.txt
    #Get-WinEvent System | Where-Object {$_.id -eq 6005 -and $_.TimeCreated -ge $startDate} > C:\Temp\exercise01_start.txt
    #Get-WinEvent System | Where-Object {$_.id -eq 6005 -and $_.TimeCreated -ge $startDate}  | Export-Clixml C:\Temp\export.xml
}

# Call getSysEvents with parameters searchID (i.e. 6005) and the number of days (i.e. 21)
getSysEvents -searchID 6005 -ndays 21