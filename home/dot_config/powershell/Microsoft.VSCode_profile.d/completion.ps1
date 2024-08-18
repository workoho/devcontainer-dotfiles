if ([System.Environment]::GetEnvironmentVariable('PSPROFILE_VSCODE_TERMINAL_COMPLETION_CHEZMOI') -eq $true) { chezmoi completion powershell | Out-String | Invoke-Expression }
