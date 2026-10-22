#!/usr/bin/env bash
# Universal AI Agent Project Initializer & Importer (Bash)
set -e

TARGET_DIR="${1:-.}"
SOURCE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
mkdir -p "$TARGET_DIR"
TARGET_DIR="$(cd "$TARGET_DIR" && pwd)"

echo "=========================================================="
echo " Migrating Autonomous Engineering Pipeline to:"
echo " $TARGET_DIR"
echo "=========================================================="

echo "[1/5] Copying .agents directory..."
mkdir -p "$TARGET_DIR/.agents"
cp -R "$SOURCE_DIR/.agents/"* "$TARGET_DIR/.agents/"

echo "[2/5] Creating Universal Agent Bridges..."
for f in AGENTS.md CLAUDE.md .cursorrules .windsurfrules .clinerules GEMINI.md .gitignore; do
    if [ -f "$SOURCE_DIR/$f" ]; then
        cp "$SOURCE_DIR/$f" "$TARGET_DIR/$f"
    fi
done

mkdir -p "$TARGET_DIR/.cursor/rules"
cp "$SOURCE_DIR/.cursor/rules/orchestrator.mdc" "$TARGET_DIR/.cursor/rules/orchestrator.mdc"

mkdir -p "$TARGET_DIR/.github"
cp "$SOURCE_DIR/.github/copilot-instructions.md" "$TARGET_DIR/.github/copilot-instructions.md"

cd "$TARGET_DIR"

echo "[3/5] Checking Git repository..."
if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    echo "  Initializing new Git repository..."
    git init >/dev/null
fi

echo "[4/5] Installing automated Graphify Git hooks..."
if command -v graphify >/dev/null 2>&1; then
    graphify hook install >/dev/null 2>&1 || true
fi

echo "[5/5] Building initial Knowledge Graph baseline..."
if command -v graphify >/dev/null 2>&1; then
    graphify . --code-only >/dev/null 2>&1 || true
    graphify cluster-only . --no-label >/dev/null 2>&1 || true
fi

echo "=========================================================="
echo " SUCCESS: Setup is ready and imported!"
echo " All AI agents will now automatically follow the pipeline:"
echo "   - Antigravity / Gemini CLI  (.agents, AGENTS.md, GEMINI.md)"
echo "   - Claude Code               (CLAUDE.md, .agents)"
echo "   - Cursor                    (.cursorrules, .cursor/rules)"
echo "   - Windsurf                  (.windsurfrules)"
echo "   - GitHub Copilot            (.github/copilot-instructions.md)"
echo "   - Cline                     (.clinerules)"
echo "   - OpenCode / Codex / Zed    (AGENTS.md)"
echo "=========================================================="
