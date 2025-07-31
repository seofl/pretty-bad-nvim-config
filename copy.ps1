# Paths (customize as needed)
$source = "D:\projects\pretty-bad-nvim-config"
$dest = "$env:USERPROFILE\AppData\Local\nvim"
$backup = "$env:USERPROFILE\AppData\Local\nvim.old"

# Backup old config
if (Test-Path $dest) {
    Write-Host "Backing up old config to $backup"
    Rename-Item -Path $dest -NewName "nvim.old" -Force
}

# Copy new config excluding .git and copy.ps1
Write-Host "Copying new config..."
try {
    robocopy $source $dest /E /XD ".git" /XF "copy.ps1"
    if ($LASTEXITCODE -le 3) {
        Write-Host "Copy succeeded, removing backup"
        Remove-Item $backup -Recurse -Force
    } else {
        throw "Copy failed with code $LASTEXITCODE"
    }
}
catch {
    Write-Host "Error during copy: $_"
    Write-Host "Restoring backup..."
    Remove-Item $dest -Recurse -Force -ErrorAction SilentlyContinue
    Rename-Item -Path $backup -NewName "nvim"
}

