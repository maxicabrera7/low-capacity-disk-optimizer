# Requires Administrator privileges
Write-Host "Starting System Cleanup..." -ForegroundColor Cyan

# 1. Clear Temp Folders
$TempFolders = @(
    "C:\Windows\Temp\*",
    "$env:LOCALAPPDATA\Temp\*"
)
Remove-Item -Path $TempFolders -Recurse -Force -ErrorAction SilentlyContinue

# 2. DISM Component Cleanup
Write-Host "Cleaning up Windows Component Store (WinSxS)..." -ForegroundColor Yellow
dism.exe /Online /Cleanup-Image /StartComponentCleanup /ResetBase

Write-Host "Cleanup Complete." -ForegroundColor Green
