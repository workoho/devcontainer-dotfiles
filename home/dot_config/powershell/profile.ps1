# ~/.config/powershell/profile.ps1: executed by all PowerShell hosts on startup.

using namespace System.Management.Automation
using namespace System.Management.Automation.Language

Write-Host "Loading profile from $($MyInvocation.MyCommand.Name)" -ForegroundColor Cyan

#region Environment Variables
if (-not $env:PATH.Contains("$($env:HOME)/.local/bin")) {
    $env:PATH += ":$($env:HOME)/.local/bin"
}
#region Environment Variables

#region PSReadLine
# Options
$PSROptions = @{
    EditMode            = 'Emacs'
    PredictionSource    = 'HistoryAndPlugin'
    PredictionViewStyle = 'ListView'
}
Set-PSReadLineOption @PSROptions

# Searching for commands with up/down arrow is really handy.  The
# option "moves to end" is useful if you want the cursor at the end
# of the line while cycling through history like it does w/o searching,
# without that option, the cursor will remain at the position it was
# when you used up arrow, which can be useful if you forget the exact
# string you started the search on.
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

# The built-in word movement uses character delimiters, but token based word
# movement is also very useful - these are the bindings you'd use if you
# prefer the token based movements bound to the normal emacs word movement
# key bindings.
Set-PSReadLineKeyHandler -Key Alt+d -Function ShellKillWord
Set-PSReadLineKeyHandler -Key Alt+Backspace -Function ShellBackwardKillWord
Set-PSReadLineKeyHandler -Key Alt+b -Function ShellBackwardWord
Set-PSReadLineKeyHandler -Key Alt+f -Function ShellForwardWord
Set-PSReadLineKeyHandler -Key Alt+B -Function SelectShellBackwardWord
Set-PSReadLineKeyHandler -Key Alt+F -Function SelectShellForwardWord

# Import PSReadLine Predictors
Import-Module -Name CompletionPredictor -ErrorAction SilentlyContinue || (Microsoft.PowerShell.PSResourceGet\Install-PSResource -Name CompletionPredictor -Repository PSGallery -TrustRepository -Scope CurrentUser && Import-Module -Name CompletionPredictor)
if (Get-Module -Name Az.Accounts -ListAvailable) {
    Import-Module -Name Az.Tools.Predictor -ErrorAction SilentlyContinue || (Microsoft.PowerShell.PSResourceGet\Install-PSResource -Name Az.Tools.Predictor -Repository PSGallery -TrustRepository -Scope CurrentUser && Import-Module -Name Az.Tools.Predictor)
}
#endregion PSReadLine

# Git shell completion
Import-Module -Name posh-git -ErrorAction SilentlyContinue || (Microsoft.PowerShell.PSResourceGet\Install-PSResource -Name posh-git -Repository PSGallery -TrustRepository -Scope CurrentUser && Import-Module -Name posh-git)

# Chezmoi command completion
chezmoi completion powershell | Out-String | Invoke-Expression
