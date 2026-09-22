<#
.SYNOPSIS
    🔄 PERSONAL-DEVELOP AUTO-SYNC DAEMON (POWERSHELL / WINDOWS)
    Tự động hóa kiểm tra, commit, pull và push định kỳ 15-30 phút khi có thay đổi.

.DESCRIPTION
    Quản lý tiến trình ngầm tự động bảo vệ dữ liệu và đồng bộ tiến trình phát triển bản thân
    giữa các máy tính qua GitHub mà không cần can thiệp thủ công.

.PARAMETER Action
    start, stop, restart, status, run-once.

.PARAMETER IntervalMinutes
    Chu kỳ kiểm tra tính bằng phút (mặc định 20 phút).

.EXAMPLE
    .\Scripts\auto-sync.ps1 -Action start -IntervalMinutes 20
    .\Scripts\auto-sync.ps1 -Action status
    .\Scripts\auto-sync.ps1 -Action stop
    .\Scripts\auto-sync.ps1 -Action run-once
#>

param(
    [ValidateSet('start', 'stop', 'restart', 'status', 'run-once')]
    [string]$Action = 'status',

    [int]$IntervalMinutes = 20
)

$ErrorActionPreference = 'SilentlyContinue'
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$workspaceRoot = (Get-Item $scriptDir).Parent.FullName
Set-Location $workspaceRoot

$pidFile = Join-Path $scriptDir ".auto-sync-win.pid"
$intervalFile = Join-Path $scriptDir ".auto-sync.interval"
$logFile = Join-Path $scriptDir "auto-sync.log"
$branch = "main"
$remote = "origin"

function Test-IsRunning {
    if (Test-Path $pidFile) {
        $pId = Get-Content $pidFile -ErrorAction SilentlyContinue
        if ($pId) {
            $proc = Get-Process -Id $pId -ErrorAction SilentlyContinue
            if ($proc) {
                return $true
            }
        }
    }
    return $false
}

function Invoke-SyncTick {
    $now = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")
    $env:GIT_TERMINAL_PROMPT = "0"

    # 1. Kéo cập nhật từ remote nếu có
    $remoteUrl = git remote get-url $remote 2>$null
    if ($LASTEXITCODE -eq 0 -and $remoteUrl) {
        $hasStash = $false
        $status = git status --porcelain 2>$null
        if (-not [string]::IsNullOrWhiteSpace($status)) {
            git stash push -u -m "Auto-sync stash $now" | Out-Null
            $hasStash = $true
        }

        git pull --rebase $remote $branch 2>$null | Out-Null
        if ($hasStash) {
            git stash pop 2>$null | Out-Null
        }
    }

    # 2. Kiểm tra xem có file nào thay đổi không
    $statusAfter = git status --porcelain 2>$null
    if ([string]::IsNullOrWhiteSpace($statusAfter)) {
        return
    }

    Add-Content -Path $logFile -Value "[$now] 📝 Phát hiện thay đổi dữ liệu, đang tự động commit & push..."
    git add -A

    $hostname = if ($env:COMPUTERNAME) { $env:COMPUTERNAME } else { "Windows-PC" }
    $commitMsg = "Auto-sync [$hostname] ($((Get-Date).ToString('yyyy-MM-dd HH:mm'))): Tự động đồng bộ tiến trình"

    git commit -m "$commitMsg" 2>$null | Out-Null
    if ($LASTEXITCODE -eq 0) {
        git push $remote $branch 2>$null | Out-Null
        if ($LASTEXITCODE -eq 0) {
            Add-Content -Path $logFile -Value "[$now] ✅ [SUCCESS] Đã tự động đẩy thay đổi lên GitHub thành công!"
        } else {
            Add-Content -Path $logFile -Value "[$now] ⚠️ [PUSH PENDING] Commit thành công cục bộ, nhưng chưa push được lên remote."
        }
    }
}

function Start-AutoSync {
    param([int]$Interval)

    if (Test-IsRunning) {
        $existingPid = Get-Content $pidFile
        Write-Host "✅ Auto-Sync Daemon ĐANG CHẠY với PID: $existingPid" -ForegroundColor Green
        return
    }

    $workerCode = @"
Set-Location '$workspaceRoot'
`$intervalSec = $Interval * 60
`$now = (Get-Date).ToString('yyyy-MM-dd HH:mm:ss')
Add-Content -Path '$logFile' -Value "[`$now] 🚀 Auto-sync daemon Windows đã khởi động (Chu kỳ: $Interval phút, PID: `$PID)"

while (`$true) {
    Start-Sleep -Seconds `$intervalSec
    `$env:GIT_TERMINAL_PROMPT = '0'
    `$status = git status --porcelain 2>`$null
    if (-not [string]::IsNullOrWhiteSpace(`$status)) {
        `$t = (Get-Date).ToString('yyyy-MM-dd HH:mm:ss')
        Add-Content -Path '$logFile' -Value "[`$t] 📝 Phát hiện thay đổi dữ liệu, đang tự động commit & push..."
        git add -A 2>`$null | Out-Null
        `$h = if (`$env:COMPUTERNAME) { `$env:COMPUTERNAME } else { 'Windows-PC' }
        git commit -m "Auto-sync [`$h] (`$((Get-Date).ToString('yyyy-MM-dd HH:mm'))): Tự động đồng bộ tiến trình" 2>`$null | Out-Null
        git push origin main 2>`$null | Out-Null
    }
}
"@

    $encodedCode = [Convert]::ToBase64String([Text.Encoding]::Unicode.GetBytes($workerCode))
    $process = Start-Process powershell -ArgumentList "-NoProfile", "-WindowStyle", "Hidden", "-EncodedCommand", $encodedCode -PassThru

    if ($process -and $process.Id) {
        $process.Id | Set-Content $pidFile
        $Interval | Set-Content $intervalFile
        Write-Host "🚀 Đã kích hoạt Auto-Sync Daemon Windows thành công!" -ForegroundColor Green
        Write-Host "   - PID: $($process.Id)" -ForegroundColor Cyan
        Write-Host "   - Chu kỳ: $Interval phút/lần" -ForegroundColor Yellow
        Write-Host "   - File nhật ký: $logFile" -ForegroundColor Blue
    } else {
        Write-Host "❌ Lỗi: Không thể khởi động tiến trình ngầm trên Windows." -ForegroundColor Red
    }
}

function Stop-AutoSync {
    if (Test-IsRunning) {
        $pId = Get-Content $pidFile
        Stop-Process -Id $pId -Force -ErrorAction SilentlyContinue
        Remove-Item $pidFile -Force -ErrorAction SilentlyContinue
        $now = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")
        Add-Content -Path $logFile -Value "[$now] 🛑 Auto-sync daemon Windows đã dừng (PID: $pId)"
        Write-Host "🛑 Đã dừng Auto-Sync Daemon thành công (PID: $pId)." -ForegroundColor Green
    } else {
        Remove-Item $pidFile -Force -ErrorAction SilentlyContinue
        Write-Host "⚠️ Auto-Sync Daemon hiện không hoạt động." -ForegroundColor Yellow
    }
}

function Get-AutoSyncStatus {
    if (Test-IsRunning) {
        $pId = Get-Content $pidFile
        $intVal = if (Test-Path $intervalFile) { Get-Content $intervalFile } else { "20" }
        Write-Host "🟢 [ACTIVE] Auto-Sync Daemon ĐANG CHẠY" -ForegroundColor Green
        Write-Host "   - PID: $pId" -ForegroundColor Cyan
        Write-Host "   - Chu kỳ: $intVal phút/lần" -ForegroundColor Yellow
        if (Test-Path $logFile) {
            Write-Host "`n📜 5 dòng log gần nhất:" -ForegroundColor Blue
            Get-Content $logFile -Tail 5
        }
        exit 0
    } else {
        Write-Host "🔴 [STOPPED] Auto-Sync Daemon ĐANG TẮT" -ForegroundColor Red
        exit 1
    }
}

switch ($Action) {
    'start' {
        Start-AutoSync -Interval $IntervalMinutes
    }
    'stop' {
        Stop-AutoSync
    }
    'restart' {
        Stop-AutoSync
        Start-Sleep -Seconds 1
        Start-AutoSync -Interval $IntervalMinutes
    }
    'status' {
        Get-AutoSyncStatus
    }
    'run-once' {
        Write-Host "🔄 Đang thực thi 1 chu kỳ kiểm tra và đồng bộ ngay lập tức..." -ForegroundColor Blue
        Invoke-SyncTick
        Write-Host "✅ Hoàn tất chu kỳ đồng bộ!" -ForegroundColor Green
        if (Test-Path $logFile) {
            Get-Content $logFile -Tail 3
        }
    }
}
