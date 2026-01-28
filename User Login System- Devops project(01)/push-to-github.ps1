# Push entire project to GitHub
# Configure credentials (one-time setup)
git config --global credential.helper wincred

# Stage all changes
git add .

# Commit if there are changes
$status = git status --porcelain
if ($status) {
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    git commit -m "DevOps Project Update - $timestamp"
}

# Push to GitHub
Write-Host "Pushing to GitHub..." -ForegroundColor Green
git push -u origin $(git rev-parse --abbrev-ref HEAD)

if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ Push successful!" -ForegroundColor Green
    Write-Host "View your repository: https://github.com/Abhishekkharode/Java-Login-Application---First-Devops-Project" -ForegroundColor Cyan
} else {
    Write-Host "✗ Push failed. Check your GitHub credentials." -ForegroundColor Red
}

# Keep terminal open
Read-Host "Press Enter to close"
