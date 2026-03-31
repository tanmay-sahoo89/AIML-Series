# Auto-commit watcher script for Jupyter notebooks
# Usage: Run this script to enable auto-commit on file saves

$repoPath = "c:\Tanmay\Code\AIML Series"
$commitInterval = 10  # Commit every 10 seconds if changes exist

Push-Location $repoPath

Write-Host "Starting auto-commit watcher... (Press Ctrl+C to stop)" -ForegroundColor Green

$watcher = New-Object System.IO.FileSystemWatcher
$watcher.Path = $repoPath
$watcher.Filter = "*.*"
$watcher.IncludeSubdirectories = $true
$watcher.NotifyFilter = [System.IO.NotifyFilters]::LastWriteTime -bor [System.IO.NotifyFilters]::FileName -bor [System.IO.NotifyFilters]::DirectoryName

$global:lastCommitTime = [datetime]::MinValue

$action = {
    $currentTime = [datetime]::Now
    if (($currentTime - $global:lastCommitTime).TotalSeconds -gt $commitInterval) {
        Push-Location $repoPath
        $status = git status --short
        if ($status) {
            git add -A
            $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
            git commit -m "Auto-commit: $timestamp" --no-verify 2>&1 | Out-Null
            Write-Host "[$(Get-Date -Format 'HH:mm:ss')] Auto-committed changes" -ForegroundColor Cyan
            $global:lastCommitTime = [datetime]::Now
        }
        Pop-Location
    }
}

Register-ObjectEvent -InputObject $watcher -EventName "Changed" -Action $action | Out-Null
Register-ObjectEvent -InputObject $watcher -EventName "Created" -Action $action | Out-Null

try {
    while ($true) { Start-Sleep -Milliseconds 500 }
} finally {
    $watcher.Dispose()
    Pop-Location
    Write-Host "Auto-commit watcher stopped" -ForegroundColor Yellow
}
