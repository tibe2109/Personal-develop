<#
.SYNOPSIS
    🔄 PERSONAL-DEVELOP SYNC ENGINE (POWERSHELL / WINDOWS)
    Tự động hóa kéo (pull), đẩy (push) và đồng bộ (sync) tiến trình phát triển cá nhân.

.DESCRIPTION
    Hỗ trợ đồng bộ an toàn giữa máy tính Windows và GitHub repository, tích hợp với
    hệ thống Ký ức Liên Phiên (Current-State.md & Sessions/) của Coach Anh.

.PARAMETER Action
    Hành động cần thực hiện: 'sync' (mặc định), 'pull', 'push', hoặc 'status'.

.PARAMETER Message
    Nội dung ghi chú commit tùy chọn khi thực hiện push.

.EXAMPLE
    .\Scripts\sync.ps1
    .\Scripts\sync.ps1 -Action pull
    .\Scripts\sync.ps1 -Action push -Message "Hoàn thành Con Ếch A1"
    .\Scripts\sync.ps1 -Action status
#>

param(
    [ValidateSet('sync', 'pull', 'push', 'status')]
    [string]$Action = 'sync',

    [string]$Message = ''
)

$ErrorActionPreference = 'Stop'
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$workspaceRoot = (Get-Item $scriptDir).Parent.FullName
Set-Location $workspaceRoot

$branch = "main"
$remote = "origin"

Write-Host "======================================================" -ForegroundColor Cyan
Write-Host " 🚀 COACH ANH — PERSONAL-DEVELOP SYNC ENGINE (v1.0)   " -ForegroundColor Cyan
Write-Host "======================================================" -ForegroundColor Cyan
Write-Host "Thư mục làm việc: $workspaceRoot" -ForegroundColor Yellow

# Kiểm tra git repository
try {
    $isGit = git rev-parse --is-inside-work-tree 2>$null
    if ($LASTEXITCODE -ne 0) {
        Write-Host "❌ Lỗi: Thư mục hiện tại không phải là Git repository!" -ForegroundColor Red
        exit 1
    }
} catch {
    Write-Host "❌ Lỗi: Không thể thực thi lệnh git. Hãy đảm bảo Git đã được cài đặt và thêm vào PATH!" -ForegroundColor Red
    exit 1
}

# Kiểm tra remote
$remoteUrl = git remote get-url $remote 2>$null
if ($LASTEXITCODE -ne 0 -or -not $remoteUrl) {
    Write-Host "⚠️ Cảnh báo: Chưa cấu hình Git remote '$remote'. Vui lòng kiểm tra lại!" -ForegroundColor Yellow
    exit 1
}

function Invoke-GitPull {
    Write-Host "`n📥 [PULL] Đang kiểm tra và tải cập nhật từ GitHub ($remote/$branch)..." -ForegroundColor Blue
    
    $status = git status --porcelain
    $hasLocalChanges = -not [string]::IsNullOrWhiteSpace($status)

    if ($hasLocalChanges) {
        Write-Host "⚠️ Phát hiện thay đổi chưa commit cục bộ. Đang tạm cất vào Git Stash an toàn..." -ForegroundColor Yellow
        $stashMsg = "Auto-stash before sync $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
        git stash push -u -m "$stashMsg" | Out-Null
    }

    git pull --rebase $remote $branch
    if ($LASTEXITCODE -eq 0) {
        Write-Host "✅ Kéo dữ liệu mới nhất thành công!" -ForegroundColor Green
        if ($hasLocalChanges) {
            Write-Host "📦 Đang khôi phục các thay đổi cục bộ từ Git Stash..." -ForegroundColor Blue
            git stash pop | Out-Null
            if ($LASTEXITCODE -eq 0) {
                Write-Host "✅ Khôi phục thay đổi cục bộ thành công, không có xung đột!" -ForegroundColor Green
            } else {
                Write-Host "⚠️ Có xung đột khi pop stash. Vui lòng kiểm tra 'git status' để xử lý!" -ForegroundColor Red
            }
        }
        return $true
    } else {
        Write-Host "❌ Lỗi: Không thể kéo dữ liệu từ remote. Vui lòng kiểm tra kết nối mạng hoặc SSH/PAT!" -ForegroundColor Red
        if ($hasLocalChanges) {
            git stash pop | Out-Null
        }
        return $false
    }
}

function Invoke-GitPush {
    Write-Host "`n📤 [PUSH] Đang chuẩn bị đẩy dữ liệu lên GitHub ($remote/$branch)..." -ForegroundColor Blue
    
    $status = git status --porcelain
    if ([string]::IsNullOrWhiteSpace($status)) {
        Write-Host "✨ Không có thay đổi mới nào cần commit & push!" -ForegroundColor Green
        return $true
    }

    Write-Host "📝 Danh sách các file thay đổi:" -ForegroundColor Yellow
    git status -s

    git add -A

    $hostname = if ($env:COMPUTERNAME) { $env:COMPUTERNAME } else { "Windows-PC" }
    $timestamp = (Get-Date).ToString("yyyy-MM-dd HH:mm")
    
    if (-not [string]::IsNullOrWhiteSpace($Message)) {
        $commitMsg = "Sync [$hostname] ($timestamp): $Message"
    } else {
        $commitMsg = "Sync [$hostname] ($timestamp): Cập nhật tiến trình phát triển bản thân"
    }

    Write-Host "✍️ Đang commit với nội dung: `"$commitMsg`"" -ForegroundColor Blue
    git commit -m "$commitMsg"

    git push $remote $branch
    if ($LASTEXITCODE -eq 0) {
        Write-Host "✅ Đã đẩy toàn bộ tiến trình lên GitHub thành công!" -ForegroundColor Green
        return $true
    } else {
        Write-Host "❌ Lỗi: Không thể push lên remote. Vui lòng kiểm tra quyền truy cập hoặc chạy 'pull' trước!" -ForegroundColor Red
        return $false
    }
}

function Invoke-GitStatus {
    Write-Host "`n📊 [STATUS] Trạng thái Git hiện tại:" -ForegroundColor Blue
    git branch -vv
    Write-Host ""
    git status -s
    Write-Host "`n🕒 3 Commit gần nhất:" -ForegroundColor Blue
    git log -n 3 --oneline --graph --decorate
}

switch ($Action) {
    'pull' {
        Invoke-GitPull | Out-Null
    }
    'push' {
        Invoke-GitPush | Out-Null
    }
    'sync' {
        $pullSuccess = Invoke-GitPull
        if ($pullSuccess) {
            Invoke-GitPush | Out-Null
        }
    }
    'status' {
        Invoke-GitStatus
    }
}

Write-Host "`n🎉 Hoàn tất tác vụ '$Action'! Sẵn sàng làm việc cùng Coach Anh.`n" -ForegroundColor Cyan
