<#
.SYNOPSIS
    Quét file Report mới nhất, tìm task chua hoan thanh de carry-forward.
.USAGE
    .\Scripts\Check-Incomplete-Tasks.ps1
    .\Scripts\Check-Incomplete-Tasks.ps1 -Date "2026-07-19"
#>
param([string]$Date = (Get-Date -Format "yyyy-MM-dd"))

$month     = (Get-Date $Date).ToString("MM")
$year      = (Get-Date $Date).ToString("yyyy")
$monthDir  = Join-Path $PSScriptRoot "..\Report\$month-$year"

$reportFiles = Get-ChildItem $monthDir -Filter "*Report*" -ErrorAction SilentlyContinue |
               Sort-Object Name -Descending

if (-not $reportFiles) {
    Write-Host "Khong tim thay file Report trong: $monthDir" -ForegroundColor Yellow
    exit 0
}

$latest  = $reportFiles[0]
$content = Get-Content $latest.FullName -Encoding UTF8

Write-Host ""
Write-Host "=== DOC FILE REPORT: $($latest.Name) ===" -ForegroundColor Cyan

$incompleteLines = @()
$completedLines  = @()

foreach ($line in $content) {
    if ($line -match '\[\s\]\s*(Xong|Hoan thanh)') {
        $task = ($line -replace '\|','').Trim()
        if ($task) { $incompleteLines += $task }
    }
    if ($line -match 'Streak.*\*\*(\d+)\*\*') {
        Write-Host "  Streak hien tai: $($Matches[0])" -ForegroundColor Magenta
    }
}

Write-Host ""
Write-Host "TASK CHUA XONG (se carry-forward):" -ForegroundColor Red
if ($incompleteLines.Count -eq 0) {
    Write-Host "  Tat ca da hoan thanh! Khong can carry-forward." -ForegroundColor Green
} else {
    $incompleteLines | ForEach-Object { Write-Host "  -> $_" -ForegroundColor Yellow }
}

# Kiem tra 3 dieu tot
$habit1 = $content | Where-Object { $_ -match '^\d\.\s+\S' -and $_ -notmatch '____' } | Select-Object -First 3
Write-Host ""
if ($habit1.Count -ge 3) {
    Write-Host "Thoi quen #1 (3 dieu tot): DA LAM" -ForegroundColor Green
} else {
    Write-Host "CANH BAO: Thoi quen #1 chua dien! Nho dieu nay vao Plan ngay mai." -ForegroundColor Red
}
Write-Host ""
