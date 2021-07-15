### gestion fichiers

new-item -Path C:\temp -Name Fichier.txt -ItemType File -Value "Demonstration Powershell`r`n"

rename-item -Path "C:\temp\Fichier.txt" -NewName "Fichier2.txt"

add-content "C:\temp\Fichier2.txt" -Value "..."

Copy-item -Path "C:\temp\Fichier2.txt" -Destination "C:\temp\Fichier.txt"

remove-item -Path "C:\temp\Fichier2.txt"

### gestion ACL

$SID = $([wmi] "win32_userAccount.Domain='EU',Name='ng58e90'").sid
 
$acl = get-acl "C:\temp\Fichier.txt"

$acl.SetAccessRuleProtection($True, $True)

$colRights = [System.Security.AccessControl.FileSystemRights]"Fullcontrol" 
$objType =[System.Security.AccessControl.AccessControlType]::Allow 
$Userapp = (New-Object System.Security.Principal.SecurityIdentifier($SID))
$ace = new-object security.accesscontrol.filesystemaccessrule($userapp, $colRights, $objType)
$acl.addaccessrule($ace)

Set-Acl -Path "C:\temp\Fichier.txt" -AclObject $acl

$currentacl = get-acl "C:\temp\Fichier.txt"
$objUser = $Userapp.Translate( [System.Security.Principal.NTAccount])

$acldelete = $null

foreach ($item in $currentacl.access) {
    if ($item.IdentityReference -like $objUser.value) {
        $acldelete = $item
    }
}

if ($acldelete -ne $null)
{
    $currentacl.removeaccessrule($acldelete)

    if ($?) {
        $deletion = $true
    }
    else
    {
        $deletion = $false
    }
    set-acl "C:\temp\Fichier.txt" $currentacl
}