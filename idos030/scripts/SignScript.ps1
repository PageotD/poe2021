$pass = Read-Host 'Mot de passe à utiliser?' -AsSecureString
$duree = Read-Host 'Durée en année?'
$subject=Read-Host 'sujet du certificat?'
 
# on se place au niveau machine
Set-Location Cert:\LocalMachine\My
  
#un certificat du même sujet existe ?
$thumbprint =Get-ChildItem | Where-Object {$_.subject -match $subject}  | Select-Object -first 1 | select -ExpandProperty Thumbprint
if($thumbprint -ne $null)
{
    Write-Host "deleting old one "$thumbprint;
    Remove-Item -Path $thumbprint;
}
 
# création d'un nouveau certificat
New-SelfSignedCertificate -NotAfter (Get-Date).AddYears($duree) -TextExtension ('2.5.29.37={text}1.3.6.1.5.5.7.3.3','2.5.29.19={text}Subject Type:End Entity') -Type Custom -Subject $subject -KeyUsage DigitalSignature -FriendlyName "Certificat de signature de code" -CertStoreLocation "Cert:\LocalMachine\My"
 
# récupération du thumbprint du certifcat créé
$thumbprint = Get-ChildItem | Where-Object {$_.subject -match $subject} | Select-Object -first 1 | select -ExpandProperty Thumbprint;
 
#Export du PFX
Export-PfxCertificate -cert $thumbprint -Password $pass -FilePath $env:USERPROFILE\desktop\MON_CERTIFICAT.pfx

# installation du certificat dans "ordinateur local" puis dans le magasin "Autorités de certification racines de confiance"

### signature du script 

$cert = Get-ChildItem Cert:\LocalMachine\root -CodeSigningCert

# exécution du script pour test 1

& "$env:USERPROFILE\Desktop\formation powershell\scripttest.ps1"

Set-ExecutionPolicy -ExecutionPolicy AllSigned # change la politique de sécurité pour n'exécuter QUE les scripts signés

# rejouer le script

& "C:\temp\tableau\scripttest.ps1"

Set-AuthenticodeSignature "C:\temp\tableau\scripttest.ps1"  -Certificate $cert # signature du script

# rejouer le script

& "D:\Formation PowerShell\scripttest.ps1"

# ouvrir mmc.exe en tant qu'administrateur (pour accéder à ordinateur local) et gérer manullement le certificat

# rejouer le script 

& "$env:USERPROFILE\Desktop\formation powershell\scripttest.ps1"

Set-ExecutionPolicy -ExecutionPolicy RemoteSigned

# rejouer le script 

& "$env:USERPROFILE\Desktop\formation powershell\scripttest.ps1"