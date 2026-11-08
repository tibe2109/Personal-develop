<#
.SYNOPSIS
    🔄 PERSONAL-DEVELOP AUTO-SYNC DAEMON (POWERSHELL / WINDOWS)
    Tự động hóa kiểm tra, commit, pull và push định kỳ 15 phút khi có thay đổi,
    đồng thời hỗ trợ đồng bộ tức thì đầu phiên (session-start) và cuối phiên (session-end).

.DESCRIPTION
    Quản lý tiến trình ngầm tự động bảo vệ dữ liệu và đồng bộ tiến trình phát triển bản thân
    giữa các máy tính qua GitHub mà không cần can thiệp thủ công.

.PARAMETER Action
    session-start, session-end, start, stop, restart, status, run-once.

.PARAMETER IntervalMinutes
    Chu kỳ kiểm tra tính bằng phút (mặc định 15 phút).

.PARAMETER Message
    Nội dung ghi chú commit tùy chọn cho session-end.

.EXAMPLE
    .\Scripts\auto-sync.ps1 -Action session-start
    .\Scripts\auto-sync.ps1 -Action session-end -Message "Hoàn thành Con Ếch A1"
    .\Scripts\auto-sync.ps1 -Action status
    .\Scripts\auto-sync.ps1 -Action start -IntervalMinutes 15
    .\Scripts\auto-sync.ps1 -Action stop
    .\Scripts\auto-sync.ps1 -Action run-once
#>

param(
    [ValidateSet('session-start', 'session-end', 'start', 'stop', 'restart', 'status', 'run-once')]
    [string]$Action = 'status',

    [int]$IntervalMinutes = 15,

    [string]$Message = ''
)

$ErrorActionPreference = 'SilentlyContinue'
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$workspaceRoot = (Get-Item $scriptDir).Parent.FullName
Set-Location $workspaceRoot

$pidFile = Join-Path $scriptDir ".auto-sync-win.pid"
$intervalFile = Join-Path $scriptDir ".auto-sync.interval"
$logFile = Join-Path $scriptDir "auto-sync.log"
$workerScript = Join-Path $scriptDir ".auto-sync-worker.ps1"
$branch = "main"
$remote = "origin"

function Write-SyncLog {
    param([string]$Text)
    $now = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")
    $logLine = "[$now] $Text"
    try {
        if (Test-Path $logFile) {
            $fi = Get-Item $logFile -ErrorAction SilentlyContinue
            if ($fi -and $fi.Length -gt 5242880) {
                $tailLines = Get-Content $logFile -Tail 500 -Encoding UTF8
                [System.IO.File]::WriteAllLines($logFile, $tailLines, [System.Text.Encoding]::UTF8)
            }
        }
        [System.IO.File]::AppendAllLines($logFile, [string[]]@($logLine), [System.Text.Encoding]::UTF8)
    } catch {}
}

function Test-IsRunning {
    if (Test-Path $pidFile) {
        try {
            $rawPid = (Get-Content $pidFile -ErrorAction Stop | Out-String).Trim()
            if ($rawPid -match '^\d+$') {
                $proc = Get-Process -Id [int]$rawPid -ErrorAction SilentlyContinue
                if ($proc -and ($proc.ProcessName -like "*powershell*" -or $proc.ProcessName -like "*pwsh*")) {
                    return $true
                }
            }
        } catch {}
        Remove-Item $pidFile -Force -ErrorAction SilentlyContinue
    }
    return $false
}

function Invoke-SyncPull {
    $env:GIT_TERMINAL_PROMPT = "0"
    $remoteUrl = git remote get-url $remote 2>$null
    if ($LASTEXITCODE -ne 0 -or -not $remoteUrl) {
        Write-Host "⚠️ Cảnh báo: Chưa cấu hình Git remote '$remote'." -ForegroundColor Yellow
        Write-SyncLog "⚠️ [FETCH/PULL] Chưa cấu hình Git remote '$remote'."
        return $false
    }

    $hasStash = $false
    $status = git status --porcelain 2>$null
    if (-not [string]::IsNullOrWhiteSpace($status)) {
        git stash push -u -m "Auto-sync stash $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')" 2>$null | Out-Null
        $hasStash = $true
    }

    $pullOut = git pull --rebase $remote $branch 2>&1
    if ($LASTEXITCODE -eq 0) {
        if ($hasStash) {
            git stash pop 2>$null | Out-Null
        }
        Write-SyncLog "📥 [PULL] Kéo dữ liệu mới nhất từ GitHub ($remote/$branch) thành công."
        return $true
    } else {
        if ($hasStash) {
            git stash pop 2>$null | Out-Null
        }
        Write-SyncLog "⚠️ [PULL FAILED] Lỗi kéo cập nhật: $pullOut"
        return $false
    }
}

function Invoke-SyncPush {
    param([string]$CustomMsg = '')
    $env:GIT_TERMINAL_PROMPT = "0"
    
    $status = git status --porcelain 2>$null
    if ([string]::IsNullOrWhiteSpace($status)) {
        Write-SyncLog "✨ Không có thay đổi dữ liệu nào cần push."
        return $true
    }

    git add -A 2>$null | Out-Null

    $hostname = if ($env:COMPUTERNAME) { $env:COMPUTERNAME } else { "Windows-PC" }
    $timestamp = (Get-Date).ToString("yyyy-MM-dd HH:mm")
    
    if (-not [string]::IsNullOrWhiteSpace($CustomMsg)) {
        $commitMsg = "Sync [$hostname] ($timestamp): $CustomMsg"
    } else {
        $commitMsg = "Auto-sync [$hostname] ($timestamp): Tự động đồng bộ tiến trình"
    }

    git commit -m "$commitMsg" 2>$null | Out-Null
    if ($LASTEXITCODE -eq 0) {
        $pushOut = git push $remote $branch 2>&1
        if ($LASTEXITCODE -eq 0) {
            Write-SyncLog "✅ [SUCCESS] Đã đẩy các thay đổi lên GitHub thành công! Commit: '$commitMsg'"
            return $true
        } else {
            Write-SyncLog "⚠️ [PUSH PENDING] Commit thành công nhưng push thất bại: $pushOut"
            return $false
        }
    } else {
        Write-SyncLog "⚠️ [COMMIT FAILED] Không thể commit thay đổi (kiểm tra xung đột file)."
        return $false
    }
}

function Invoke-SyncTick {
    Invoke-SyncPull | Out-Null
    Invoke-SyncPush | Out-Null
}

function Start-AutoSync {
    param([int]$Interval)

    if (Test-IsRunning) {
        $existingPid = (Get-Content $pidFile | Out-String).Trim()
        Write-Host "✅ Auto-Sync Daemon ĐANG CHẠY với PID: $existingPid" -ForegroundColor Green
        return
    }

    # Chạy 1 chu kỳ ngay lập tức (Tick 0)
    Write-Host "🔄 Đang thực thi đồng bộ ban đầu (Tick 0)..." -ForegroundColor Blue
    Invoke-SyncTick

    if (-not (Test-Path $workerScript)) {
        Write-Host "❌ Lỗi: Không tìm thấy file worker daemon: $workerScript" -ForegroundColor Red
        return
    }

    $argList = @("-NoProfile", "-WindowStyle", "Hidden", "-ExecutionPolicy", "Bypass", "-File", "`"$workerScript`"", "-IntervalMinutes", "$Interval")
    $process = Start-Process powershell -ArgumentList $argList -PassThru

    if ($process -and $process.Id) {
        $process.Id | Set-Content $pidFile -Encoding UTF8
        $Interval | Set-Content $intervalFile -Encoding UTF8
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
        $pId = (Get-Content $pidFile | Out-String).Trim()
        Stop-Process -Id [int]$pId -Force -ErrorAction SilentlyContinue
        Remove-Item $pidFile -Force -ErrorAction SilentlyContinue
        Write-SyncLog "🛑 Auto-sync daemon Windows đã dừng (PID: $pId)"
        Write-Host "🛑 Đã dừng Auto-Sync Daemon thành công (PID: $pId)." -ForegroundColor Green
    } else {
        Remove-Item $pidFile -Force -ErrorAction SilentlyContinue
        Write-Host "⚠️ Auto-Sync Daemon hiện không hoạt động." -ForegroundColor Yellow
    }
}

function Get-AutoSyncStatus {
    if (Test-IsRunning) {
        $pId = (Get-Content $pidFile | Out-String).Trim()
        $intVal = if (Test-Path $intervalFile) { (Get-Content $intervalFile | Out-String).Trim() } else { "15" }
        Write-Host "🟢 [ACTIVE] Auto-Sync Daemon ĐANG CHẠY" -ForegroundColor Green
        Write-Host "   - PID: $pId" -ForegroundColor Cyan
        Write-Host "   - Chu kỳ: $intVal phút/lần" -ForegroundColor Yellow
        if (Test-Path $logFile) {
            Write-Host "`n📜 5 dòng log gần nhất:" -ForegroundColor Blue
            Get-Content $logFile -Tail 5 -Encoding UTF8
        }
        return $true
    } else {
        Write-Host "🔴 [STOPPED] Auto-Sync Daemon ĐANG TẮT" -ForegroundColor Red
        if (Test-Path $logFile) {
            Write-Host "`n📜 3 dòng log gần nhất:" -ForegroundColor Blue
            Get-Content $logFile -Tail 3 -Encoding UTF8
        }
        return $false
    }
}

switch ($Action) {
    'session-start' {
        Write-Host "📥 [SESSION-START] Đang kích hoạt giao thức đồng bộ đầu phiên..." -ForegroundColor Cyan
        $pullOk = Invoke-SyncPull
        if ($pullOk) {
            Write-Host "✅ Đã kéo nội dung mới nhất từ GitHub về máy thành công!" -ForegroundColor Green
        } else {
            Write-Host "⚠️ Kéo nội dung từ GitHub chưa thành công (tiếp tục kiểm tra Daemon)." -ForegroundColor Yellow
        }
        if (-not (Test-IsRunning)) {
            Write-Host "⚡ Daemon đang tắt. Đang tự động kích hoạt Daemon ngầm (chu kỳ $IntervalMinutes phút)..." -ForegroundColor Yellow
            Start-AutoSync -Interval $IntervalMinutes
        } else {
            $pId = (Get-Content $pidFile | Out-String).Trim()
            Write-Host "🛡️ Auto-Sync Daemon đã hoạt động ổn định (PID: $pId)." -ForegroundColor Green
        }
        $tagMsg = "[🛡️ Auto-Sync: Active ($IntervalMinutes m) | 📥 Synced: origin/$branch]"
        Write-Host "`n$tagMsg`n" -ForegroundColor Green
    }
    'session-end' {
        Write-Host "📤 [SESSION-END] Đang kích hoạt giao thức đồng bộ kết thúc phiên..." -ForegroundColor Cyan
        $pushOk = Invoke-SyncPush -CustomMsg $Message
        if ($pushOk) {
            Write-Host "✅ Toàn bộ nội dung trao đổi và nhật ký đã được đẩy lên GitHub an toàn!" -ForegroundColor Green
        } else {
            Write-Host "⚠️ Có lỗi khi đẩy dữ liệu lên GitHub. Vui lòng kiểm tra log!" -ForegroundColor Red
        }
    }
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
        $isRunning = Get-AutoSyncStatus
        if (-not $isRunning) { exit 1 }
    }
    'run-once' {
        Write-Host "🔄 Đang thực thi 1 chu kỳ kiểm tra và đồng bộ ngay lập tức..." -ForegroundColor Blue
        Invoke-SyncTick
        Write-Host "✅ Hoàn tất chu kỳ đồng bộ!" -ForegroundColor Green
        if (Test-Path $logFile) {
            Get-Content $logFile -Tail 3 -Encoding UTF8
        }
    }
}
