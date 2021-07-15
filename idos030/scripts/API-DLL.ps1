### Intéraction avec les API Windows
# Aide :
# https://en.wikipedia.org/wiki/Microsoft_Windows_library_files#:~:text=DLL,-Further%20information%3A%20Windows&text=information%3A%20Windows%20USER-,USER32.,the%20Windows%20look%20and%20feel.

add-type @"
using System;
using System.Runtime.InteropServices;
namespace FormationPowerShell {
    public class Fonctions {
        [DllImport("user32.dll")]
        private static extern bool ShowWindowAsync(IntPtr hWnd, int nCmdShow);
        public static void ShowWindow(IntPtr hWnd) {
            ShowWindowAsync(hWnd,5);
        }
        public static void HideWindow(IntPtr hWnd) {
            ShowWindowAsync(hWnd,0);
        }
    }
}
"@

$ID = $(Get-Process -Name cmd).MainWindowHandle

[FormationPowerShell.Fonctions]::HideWindow($id)

[FormationPowerShell.Fonctions]::ShowWindow($id)

### Intéraction avec des DLL .NET
# connaitre la liste des functions présentes dans la DLL

$asm = [System.Reflection.Assembly]::LoadFile("C:\Users\cblacher\Desktop\Formation PowerShell\sccmclictr.automation.dll")
$asm.GetTypes() | select Name, Namespace | sort Namespace | ft -groupby Namespace
$asm.GetTypes() | ?{$_.IsPublic} | select Name, Namespace | sort Namespace | ft -groupby Namespace
$asm.GetTypes() | ?{$_.IsPublic} | select @{n=‘Members’;e={$_.GetMembers(‘Public,Instance’)}} | select -expand Members -ea 0 | ? {!$_.IsSpecialName} | measure-object

#utiliser une des fonctions

$asm.Modules.Assembly.GetName().name

#[sccmclictr.automation.functions]