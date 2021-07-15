### start process

$process = Start-Process -FilePath C:\Windows\System32\cmd.exe -ArgumentList "/c echo test" -Wait -PassThru -RedirectStandardOutput stdout.txt

write-host $process.ExitCode

# en tant qu'administrateur 

$process2 = Start-Process -FilePath C:\Windows\System32\cmd.exe  -ArgumentList "/c echo test" -Wait -PassThru -Verb Runas

# avec le "Call operator" & 

$test = & C:\Windows\System32\cmd.exe /c echo test

### stdout

$pinfo = New-Object System.Diagnostics.ProcessStartInfo
# $pinfo = [System.Diagnostics.ProcessStartInfo]::new()
$pinfo.FileName = "cmd.exe"
$pinfo.RedirectStandardError = $true
$pinfo.RedirectStandardOutput = $true
$pinfo.UseShellExecute = $false
$pinfo.Arguments = "/c ping 4.4.4.4." # remplacer par "pong" pour tester $stderr
$p = New-Object System.Diagnostics.Process
$p.StartInfo = $pinfo
$p.Start() | Out-Null
$stdout = $p.StandardOutput.ReadToEnd()
$stderr = $p.StandardError.ReadToEnd()
$p.WaitForExit()