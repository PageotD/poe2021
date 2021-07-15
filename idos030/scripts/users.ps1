Get-LocalUser # liste les utilisateurs locaux

Get-LocalGroup # liste les groupes locaux

$PWD = ConvertTo-SecureString -AsPlainText Formation@1234 -Force # convertion du MDP en Secure String

New-LocalUser -AccountNeverExpires -Description "Compte Admin local" -Name AdminLocal -Password $PWD -PasswordNeverExpires

Get-LocalUser -Name Adminlocal # vérification

Add-LocalGroupMember -Group Administrateurs -Member Adminlocal -WhatIf # ajoute le compte créé au groupe Administrateur

Start-Process powershell.exe -ArgumentList "-command `"add-content c:\temp\log.txt -value `$env:username" -Credential (Get-Credential) -WindowStyle Hidden # lancement d'un process avec les droits du compte créé