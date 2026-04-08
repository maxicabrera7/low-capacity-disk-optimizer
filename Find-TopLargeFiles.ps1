# Scans the C: drive for the top 20 largest files
Get-ChildItem -Path C:\ -Recurse -File -ErrorAction SilentlyContinue | 
Sort-Object Length -Descending | 
Select-Object -First 20 Name, @{Name="Size(GB)";Expression={[Math]::Round($_.Length / 1GB, 2)}}, FullName |
Format-Table -AutoSize