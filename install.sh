#!/usr/bin/env bash
# Remote One-Liner Installer for Autonomous Engineering Pipeline (Bash)
# Usage: curl -fsSL https://raw.githubusercontent.com/rehanlabs/AI-Setup/main/install.sh | bash

set -e

REPO_OWNER="${AI_SETUP_OWNER:-rehanlabs}"
REPO_NAME="${AI_SETUP_REPO:-AI-Setup}"
BRANCH="main"
TARGET_DIR="$(pwd)"

echo "=========================================================="
echo "   Downloading & Initializing Autonomous AI Setup"
echo "   Target: $TARGET_DIR"
echo "   Source: github.com/$REPO_OWNER/$REPO_NAME"
echo "=========================================================="

TEMP_DIR="$(mktemp -d)"
ZIP_FILE="$TEMP_DIR/bundle.zip"

cleanup() {
    rm -rf "$TEMP_DIR"
}
trap cleanup EXIT

echo "[1/4] Downloading repository bundle from GitHub..."
curl -fsSL "https://github.com/$REPO_OWNER/$REPO_NAME/archive/refs/heads/$BRANCH.zip" -o "$ZIP_FILE"

echo "[2/4] Extracting setup bundle..."
unzip -q "$ZIP_FILE" -d "$TEMP_DIR"
SOURCE_ROOT="$TEMP_DIR/$REPO_NAME-$BRANCH"

echo "[3/4] Deploying .agents and universal agent bridges..."
mkdir -p "$TARGET_DIR/.agents"
cp -R "$SOURCE_ROOT/.agents/"* "$TARGET_DIR/.agents/"

for f in AGENTS.md CLAUDE.md .cursorrules .windsurfrules .clinerules GEMINI.md .gitignore setup-project.ps1 setup-project.sh; do
    if [ -f "$SOURCE_ROOT/$f" ]; then
        cp "$SOURCE_ROOT/$f" "$TARGET_DIR/$f"
    fi
done

mkdir -p "$TARGET_DIR/.cursor/rules"
if [ -f "$SOURCE_ROOT/.cursor/rules/orchestrator.mdc" ]; then
    cp "$SOURCE_ROOT/.cursor/rules/orchestrator.mdc" "$TARGET_DIR/.cursor/rules/orchestrator.mdc"
fi

mkdir -p "$TARGET_DIR/.github"
if [ -f "$SOURCE_ROOT/.github/copilot-instructions.md" ]; then
    cp "$SOURCE_ROOT/.github/copilot-instructions.md" "$TARGET_DIR/.github/copilot-instructions.md"
fi

echo "[4/4] Configuring Git & Knowledge Graph..."
if command -v git >/dev/null 2>&1; then
    if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        git init >/dev/null 2>&1 || true
    fi
fi

if command -v graphify >/dev/null 2>&1; then
    graphify hook install >/dev/null 2>&1 || true
    graphify . --code-only >/dev/null 2>&1 || true
    graphify cluster-only . --no-label >/dev/null 2>&1 || true
fi

echo "=========================================================="
echo " SUCCESS: AI Setup is imported and active!"
echo " Ready for Antigravity, Claude Code, Cursor, Copilot, & more."
echo "=========================================================="
