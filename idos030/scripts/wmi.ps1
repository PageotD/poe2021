# Ouvrir WMI-Explorer

$processComplet = Get-WmiObject -Query "Select * from Win32_process where Name LIKE '%Powershell_ISE%'" | select -First 1

$processLight = Get-WmiObject -Query "Select * from Win32_process where Name LIKE '%Powershell_ISE%'" | select -First 1 -Property Name, ProcessID

$processComplet.GetOwner()

$processLight.GetOwner() # n'existe pas

Get-WmiObject -Class "Win32_Process" -List | select Methods -ExpandProperty Methods

#https://docs.microsoft.com/en-us/windows/win32/cimwin32prov/create-method-in-class-win32-process

$process = Invoke-WmiMethod -Class "Win32_Process" -Name Create -ArgumentList ("cmd.exe","C:\windows\system32")

# https://docs.microsoft.com/en-us/windows/win32/cimwin32prov/terminate-method-in-class-win32-process

$cmd = Get-WmiObject -Query "Select * from Win32_process where  ProcessID = '$($process.ProcessId)'" | select -First 1

$cmd.Terminate()