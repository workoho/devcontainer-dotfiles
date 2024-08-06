# ~/.config/powershell/Microsoft.PowerShell_profile.ps1: executed by the PowerShell console host on startup.

using namespace System.Management.Automation
using namespace System.Management.Automation.Language

# 👇 Uncomment if you add commands to this file to indicate they are loaded
Write-Host "Loading profile from $($MyInvocation.MyCommand.Name)" -ForegroundColor Cyan

#region Theme
# Import Terminal related modules
Import-Module -Name posh-git -ErrorAction SilentlyContinue || (Microsoft.PowerShell.PSResourceGet\Install-PSResource -Name posh-git -Repository PSGallery -TrustRepository -Scope CurrentUser && Import-Module -Name posh-git)
Import-Module -Name Terminal-Icons -ErrorAction SilentlyContinue || (Microsoft.PowerShell.PSResourceGet\Install-PSResource -Name Terminal-Icons -Repository PSGallery -TrustRepository -Scope CurrentUser && Import-Module -Name Terminal-Icons)

# Enable Terminal Theme
if ($env:CODESPACES_BROWSER) {
    oh-my-posh init pwsh --config "$env:HOME/.cache/oh-my-posh/themes/powerlevel10k_lean.omp.json" | Invoke-Expression
}
else {
    oh-my-posh init pwsh --config "$env:HOME/.cache/oh-my-posh/themes/powerlevel10k_modern.omp.json" | Invoke-Expression
}
#endregion Theme
