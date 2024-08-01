# ~/.config/powershell/Microsoft.PowerShell_profile.ps1: executed by the PowerShell console host on startup.

# Import Terminal related modules
Import-Module -Name posh-git -ErrorAction SilentlyContinue || (Microsoft.PowerShell.PSResourceGet\Install-PSResource -Name posh-git -Repository PSGallery -TrustRepository -Scope CurrentUser && Import-Module -Name posh-git)
Import-Module -Name Terminal-Icons -ErrorAction SilentlyContinue || (Microsoft.PowerShell.PSResourceGet\Install-PSResource -Name Terminal-Icons -Repository PSGallery -TrustRepository -Scope CurrentUser && Import-Module -Name Terminal-Icons)

# Enable oh-my-posh theme
oh-my-posh init pwsh --config "$env:HOME/.cache/oh-my-posh/themes/powerlevel10k_lean.omp.json" | Invoke-Expression
