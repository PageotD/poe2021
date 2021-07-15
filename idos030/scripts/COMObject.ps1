### COM Objects
#
# https://docs.microsoft.com/fr-fr/powershell/scripting/samples/creating-.net-and-com-objects--new-object-?view=powershell-7.1

# envoie d'un email grâce au COM Object Outlook

Add-Type -assembly "Microsoft.Office.Interop.Outlook"
add-type -assembly "System.Runtime.Interopservices"
try
{
    $outlook = [Runtime.Interopservices.Marshal]::GetActiveObject('Outlook.Application')
    $outlookWasAlreadyRunning = $true
}
catch
{
    try
    {
        $Outlook = New-Object -comobject Outlook.Application
        $outlookWasAlreadyRunning = $false
    }
    catch
    {
        write-host "You must exit Outlook first."
        exit
    }
}

$Mail = $Outlook.CreateItem(0)
$Mail.To = "christophe.blacher@capgemini.com"
$Mail.Subject = "Mail test Formation PowerShell"
$Mail.Body = "Ceci est un mail de test afin d'essayer l'envoie d'un email via PowerShell en utilisant l'objet COM Outlook"
$Mail.Send()

# Tips, lister tous les objest COM disponibles

Get-ChildItem HKLM:\Software\Classes -ErrorAction SilentlyContinue | Where-Object {
   $_.PSChildName -match '^\w+\.\w+$' -and (Test-Path -Path "$($_.PSPath)\CLSID")
} | Select-Object -ExpandProperty PSChildName