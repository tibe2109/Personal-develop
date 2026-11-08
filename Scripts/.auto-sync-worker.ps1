# ==============================================================================
# 🔄 PERSONAL-DEVELOP AUTO-SYNC WORKER (BACKGROUND DAEMON)
# ==============================================================================
param(
    [int]$IntervalMinutes = 15
)

$ErrorActionPreference = 'SilentlyContinue'
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$workspaceRoot = (Get-Item $scriptDir).Parent.FullName
Set-Location $workspaceRoot

$logFile = Join-Path $scriptDir "auto-sync.log"
$branch = "main"
$remote = "origin"

function Write-WorkerLog {
    param([string]$Text)
    $now = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")
    $line = "[$now] $Text"
    try {
        if (Test-Path $logFile) {
            $fi = Get-Item $logFile -ErrorAction SilentlyContinue
            if ($fi -and $fi.Length -gt 5242880) {
                $tail = Get-Content $logFile -Tail 500 -Encoding UTF8
                [System.IO.File]::WriteAllLines($logFile, $tail, [System.Text.Encoding]::UTF8)
            }
        }
        [System.IO.File]::AppendAllLines($logFile, [string[]]@($line), [System.Text.Encoding]::UTF8)
    } catch {}
}

Write-WorkerLog "🚀 Auto-sync daemon Windows đã khởi động (Chu kỳ: $IntervalMinutes phút, PID: $PID)"

$intervalSec = $IntervalMinutes * 60

while ($true) {
    Start-Sleep -Seconds $intervalSec
    $env:GIT_TERMINAL_PROMPT = "0"

    try {
        # 1. Kéo cập nhật từ remote nếu có kết nối
        $remoteUrl = git remote get-url $remote 2>$null
        if ($LASTEXITCODE -eq 0 -and $remoteUrl) {
            $hasStash = $false
            $status = git status --porcelain 2>$null
            if (-not [string]::IsNullOrWhiteSpace($status)) {
                git stash push -u -m "Auto-sync daemon stash" 2>$null | Out-Null
                $hasStash = $true
            }

            git pull --rebase $remote $branch 2>$null | Out-Null
            if ($hasStash) {
                git stash pop 2>$null | Out-Null
            }
        }

        # 2. Kiểm tra thay đổi cục bộ để push
        $changes = git status --porcelain 2>$null
        if (-not [string]::IsNullOrWhiteSpace($changes)) {
            $nowStr = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")
            Write-WorkerLog "📝 Phát hiện thay đổi dữ liệu, đang tự động commit & push..."
            git add -A 2>$null | Out-Null
            $hostname = if ($env:COMPUTERNAME) { $env:COMPUTERNAME } else { "Windows-PC" }
            $t = (Get-Date).ToString("yyyy-MM-dd HH:mm")
            $commitMsg = "Auto-sync [$hostname] ($t): Tự động đồng bộ tiến trình"
            
            git commit -m "$commitMsg" 2>$null | Out-Null
            if ($LASTEXITCODE -eq 0) {
                $pushOut = git push $remote $branch 2>&1
                if ($LASTEXITCODE -eq 0) {
                    Write-WorkerLog "✅ [SUCCESS] Đã tự động đẩy thay đổi lên GitHub thành công!"
                } else {
                    Write-WorkerLog "⚠️ [PUSH PENDING] Commit thành công nhưng push thất bại."
                }
            }
        }
    } catch {
        Write-WorkerLog "⚠️ [ERROR] Ngoại lệ trong vòng lặp sync: $_"
    }
}
