### clé de registre

get-item HKLM:\SOFTWARE\AirbusBDM ### affiche la clé de registre et ses valeurs

New-PSDrive -Name HKCU -PSProvider Registry -Root HKEY_CURRENT_USER

get-item HKCU:\Software\7-Zip ### ne renvoie pas un tableau exploitable

New-ItemProperty HKCU:\Software\7-Zip -Name "test" -Value 0 -PropertyType DWORD

Remove-ItemProperty -Path HKCU:\Software\7-Zip -Name "test" -Force

Get-ChildItem -Path HKCU:\Software\7-Zip ### affiche les clés de registre enfant et leur propriétés

Get-ChildItem -Path HKCU:\Software\7-Zip -Recurse ### même chose mais récursive

Get-ItemPropertyValue HKCU:\Software\7-Zip -Name Lang ### permet d'obtenir la valeur d'une propriété bien précise

$(get-itemproperty HKCU:\Software\7-Zip)."$($(get-itemproperty HKCU:\Software\7-Zip | Get-Member | ?{$_.name -match "^Lang$"}).name)"

### USB 

get-childitem registry::hkey_local_machine\SYSTEM\CurrentControlSet\Enum\USB -Recurse | % {
    $value = $(Get-ItemPropertyValue -Path "registry::$($_.name)" -Name DeviceDesc -ErrorAction SilentlyContinue).tostring()
}