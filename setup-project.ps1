<#
.SYNOPSIS
    Universal AI Agent Project Initializer & Importer.
.DESCRIPTION
    Instantly migrates and sets up the Autonomous Engineering Pipeline in any target project.
    Configures Antigravity, Claude Code, Cursor, Windsurf, Copilot, Cline, OpenCode, and Codex.
.EXAMPLE
    .\setup-project.ps1 "D:\My Projects\NewApp"
    .\setup-project.ps1 .
#>

param (
    [Parameter(Position = 0, Mandatory = $false)]
    [string]$TargetDir = "."
)

$SourceDir = (Get-Item $PSScriptRoot).FullName

# Resolve full path of target directory
$resolvedTarget = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($TargetDir)
if (-not (Test-Path $resolvedTarget)) {
    New-Item -ItemType Directory -Force -Path $resolvedTarget | Out-Null
}
$TargetDir = (Get-Item $resolvedTarget).FullName

if ($SourceDir -eq $TargetDir) {
    Write-Host "Error: Target directory cannot be the AI Setup source directory itself." -ForegroundColor Red
    exit 1
}

Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "   Migrating Autonomous Engineering Pipeline to:" -ForegroundColor Cyan
Write-Host "   $TargetDir" -ForegroundColor Yellow
Write-Host "==========================================================" -ForegroundColor Cyan

# 1. Copy .agents structure
Write-Host "`n[1/5] Copying .agents directory..." -ForegroundColor Green
$destAgents = Join-Path $TargetDir ".agents"
New-Item -ItemType Directory -Force -Path $destAgents | Out-Null
Copy-Item -Recurse -Force (Join-Path $SourceDir ".agents\*") $destAgents

# 2. Copy Universal Agent Bridges
Write-Host "[2/5] Creating Universal Agent Bridges..." -ForegroundColor Green
$bridgeFiles = @(
    "AGENTS.md",
    "CLAUDE.md",
    ".cursorrules",
    ".windsurfrules",
    ".clinerules",
    "GEMINI.md",
    ".gitignore"
)

foreach ($file in $bridgeFiles) {
    $srcFile = Join-Path $SourceDir $file
    if (Test-Path $srcFile) {
        Copy-Item -Force $srcFile (Join-Path $TargetDir $file)
    }
}

# Copy Cursor modern rule
$destCursorRules = Join-Path $TargetDir ".cursor\rules"
New-Item -ItemType Directory -Force -Path $destCursorRules | Out-Null
Copy-Item -Force (Join-Path $SourceDir ".cursor\rules\orchestrator.mdc") (Join-Path $destCursorRules "orchestrator.mdc")

# Copy GitHub Copilot instructions
$destGithub = Join-Path $TargetDir ".github"
New-Item -ItemType Directory -Force -Path $destGithub | Out-Null
Copy-Item -Force (Join-Path $SourceDir ".github\copilot-instructions.md") (Join-Path $destGithub "copilot-instructions.md")

# 3. Ensure Git is initialized
Write-Host "[3/5] Checking Git repository..." -ForegroundColor Green
Push-Location $TargetDir
try {
    $hasGit = Test-Path (Join-Path $TargetDir ".git")
    if (-not $hasGit) {
        Write-Host "  Initializing new Git repository..." -ForegroundColor Gray
        git init | Out-Null
    }

    # 4. Install Graphify Git hooks
    Write-Host "[4/5] Installing automated Graphify Git hooks..." -ForegroundColor Green
    if (Get-Command graphify -ErrorAction SilentlyContinue) {
        cmd /c "graphify hook install 2>nul" | Out-Null
        Write-Host "  Git hooks installed." -ForegroundColor Gray
    } else {
        Write-Host "  (Warning: graphify CLI not found in PATH; skipping hook installation)" -ForegroundColor DarkYellow
    }

    # 5. Build Initial Knowledge Graph
    Write-Host "[5/5] Building initial Knowledge Graph baseline..." -ForegroundColor Green
    if (Get-Command graphify -ErrorAction SilentlyContinue) {
        cmd /c "graphify . --code-only 2>nul" | Out-Null
        cmd /c "graphify cluster-only . --no-label 2>nul" | Out-Null
        if (Test-Path "graphify-out\graph.json") {
            Write-Host "  Knowledge Graph generated at graphify-out/" -ForegroundColor Gray
        } else {
            Write-Host "  (Ready for code files; graph will build on first commit)" -ForegroundColor Gray
        }
    }
}
finally {
    Pop-Location
}

Write-Host "`n==========================================================" -ForegroundColor Cyan
Write-Host " SUCCESS: Setup is ready and imported!" -ForegroundColor Green
Write-Host " All AI agents will now automatically follow the pipeline:" -ForegroundColor Cyan
Write-Host "   - Antigravity / Gemini CLI  (.agents, AGENTS.md, GEMINI.md)" -ForegroundColor White
Write-Host "   - Claude Code               (CLAUDE.md, .agents)" -ForegroundColor White
Write-Host "   - Cursor                    (.cursorrules, .cursor/rules)" -ForegroundColor White
Write-Host "   - Windsurf                  (.windsurfrules)" -ForegroundColor White
Write-Host "   - GitHub Copilot            (.github/copilot-instructions.md)" -ForegroundColor White
Write-Host "   - Cline                     (.clinerules)" -ForegroundColor White
Write-Host "   - OpenCode / Codex / Zed    (AGENTS.md)" -ForegroundColor White
Write-Host "==========================================================" -ForegroundColor Cyan
