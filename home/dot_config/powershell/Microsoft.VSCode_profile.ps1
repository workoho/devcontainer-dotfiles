# ~/.config/powershell/Microsoft.VSCode_profile.ps1: executed by the VSCode Integrated Console on startup.

using namespace System.Management.Automation
using namespace System.Management.Automation.Language

# 👇 Uncomment if you add commands to this file to indicate they are loaded
Write-Host "Loading profile from $($MyInvocation.MyCommand.Name)" -ForegroundColor Cyan

#region Theme
if ($env:POSH_IMPORT_TERMINAL_ICONS -eq $true) { Import-Module -Name Terminal-Icons -ErrorAction SilentlyContinue || (Microsoft.PowerShell.PSResourceGet\Install-PSResource -Name Terminal-Icons -Repository PSGallery -TrustRepository -Scope CurrentUser && Import-Module -Name Terminal-Icons) }
if (-not $env:POSH_THEMES_PATH) { $env:POSH_THEMES_PATH = "$env:HOME/.cache/oh-my-posh/themes" }
if ($env:POSH_THEME_NAME) {
    & ([ScriptBlock]::Create((oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/$env:POSH_THEME_NAME.omp.json" --print) -join "`n"))
} else {
    & ([ScriptBlock]::Create((oh-my-posh init pwsh --config "$env:HOME/.config/oh-my-posh/themes/devcontainers.minimal.omp.json" --print) -join "`n"))
}
if ($env:POSH_DISABLE_UPGRADE_NOTICE -eq $true) { oh-my-posh disable notice }
oh-my-posh completion powershell | Out-String | Invoke-Expression
#endregion Theme
