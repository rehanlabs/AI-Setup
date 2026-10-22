<#
.SYNOPSIS
    Remote One-Liner Installer for Autonomous Engineering Pipeline.
.DESCRIPTION
    Runs from anywhere via:
    irm https://raw.githubusercontent.com/khanRehan-04/ai-setup/main/install.ps1 | iex
#>

$ErrorActionPreference = "Stop"

# Set default repo owner and name (can be overridden via env or args)
$RepoOwner = if ($env:AI_SETUP_OWNER) { $env:AI_SETUP_OWNER } else { "khanRehan-04" }
$RepoName  = if ($env:AI_SETUP_REPO)  { $env:AI_SETUP_REPO }  else { "ai-setup" }
$Branch    = "main"

$TargetDir = (Get-Location).Path

Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "   Downloading & Initializing Autonomous AI Setup" -ForegroundColor Cyan
Write-Host "   Target: $TargetDir" -ForegroundColor Yellow
Write-Host "   Source: github.com/$RepoOwner/$RepoName" -ForegroundColor Gray
Write-Host "==========================================================" -ForegroundColor Cyan

$tempZip = Join-Path $env:TEMP "ai-setup-$([Guid]::NewGuid().ToString('N')).zip"
$tempExtract = Join-Path $env:TEMP "ai-setup-extract-$([Guid]::NewGuid().ToString('N'))"

try {
    Write-Host "`n[1/5] Downloading latest setup bundle from GitHub..." -ForegroundColor Green
    $zipUrl = "https://github.com/$RepoOwner/$RepoName/archive/refs/heads/$Branch.zip"
    
    # Download with progress
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    Invoke-WebRequest -Uri $zipUrl -OutFile $tempZip -UseBasicParsing

    Write-Host "[2/5] Extracting setup files..." -ForegroundColor Green
    Expand-Archive -Path $tempZip -DestinationPath $tempExtract -Force
    $sourceRoot = Join-Path $tempExtract "$RepoName-$Branch"

    # Copy .agents
    Write-Host "[3/5] Installing .agents skills and plugins..." -ForegroundColor Green
    $destAgents = Join-Path $TargetDir ".agents"
    New-Item -ItemType Directory -Force -Path $destAgents | Out-Null
    Copy-Item -Recurse -Force (Join-Path $sourceRoot ".agents\*") $destAgents

    # Copy Universal Agent Bridges
    Write-Host "[4/5] Deploying Universal Agent Bridges..." -ForegroundColor Green
    $bridgeFiles = @(
        "AGENTS.md",
        "CLAUDE.md",
        ".cursorrules",
        ".windsurfrules",
        ".clinerules",
        "GEMINI.md",
        ".gitignore",
        "setup-project.ps1",
        "setup-project.sh"
    )

    foreach ($file in $bridgeFiles) {
        $srcFile = Join-Path $sourceRoot $file
        if (Test-Path $srcFile) {
            Copy-Item -Force $srcFile (Join-Path $TargetDir $file)
        }
    }

    # Cursor modern rule
    $destCursorRules = Join-Path $TargetDir ".cursor\rules"
    New-Item -ItemType Directory -Force -Path $destCursorRules | Out-Null
    if (Test-Path (Join-Path $sourceRoot ".cursor\rules\orchestrator.mdc")) {
        Copy-Item -Force (Join-Path $sourceRoot ".cursor\rules\orchestrator.mdc") (Join-Path $destCursorRules "orchestrator.mdc")
    }

    # GitHub Copilot instructions
    $destGithub = Join-Path $TargetDir ".github"
    New-Item -ItemType Directory -Force -Path $destGithub | Out-Null
    if (Test-Path (Join-Path $sourceRoot ".github\copilot-instructions.md")) {
        Copy-Item -Force (Join-Path $sourceRoot ".github\copilot-instructions.md") (Join-Path $destGithub "copilot-instructions.md")
    }

    # 5. Git & Graphify
    Write-Host "[5/5] Configuring Git & Knowledge Graph..." -ForegroundColor Green
    if (Get-Command git -ErrorAction SilentlyContinue) {
        $hasGit = Test-Path (Join-Path $TargetDir ".git")
        if (-not $hasGit) {
            cmd /c "git init 2>nul" | Out-Null
        }
    }

    if (Get-Command graphify -ErrorAction SilentlyContinue) {
        cmd /c "graphify hook install 2>nul" | Out-Null
        cmd /c "graphify . --code-only 2>nul" | Out-Null
        cmd /c "graphify cluster-only . --no-label 2>nul" | Out-Null
    }

    Write-Host "`n==========================================================" -ForegroundColor Cyan
    Write-Host " SUCCESS: AI Setup is imported and active!" -ForegroundColor Green
    Write-Host " Ready for Antigravity, Claude Code, Cursor, Copilot, & more." -ForegroundColor White
    Write-Host "==========================================================" -ForegroundColor Cyan
}
catch {
    Write-Host "`nError during remote installation: $_" -ForegroundColor Red
}
finally {
    if (Test-Path $tempZip) { Remove-Item -Force $tempZip -ErrorAction SilentlyContinue }
    if (Test-Path $tempExtract) { Remove-Item -Recurse -Force $tempExtract -ErrorAction SilentlyContinue }
}
