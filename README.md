# Autonomous AI Agent Engineering Setup

A portable, production-grade autonomous engineering pipeline for AI coding agents (**Antigravity, Claude Code, Cursor, Windsurf, GitHub Copilot, Cline, OpenCode, and Codex**).

Integrates **Addy Osmani's `agent-skills`**, **Dietrich Gebert's `ponytail`**, and **`graphify`** into a cohesive, self-driving development workflow.

---

## Quick Install (From Anywhere)

Run this single command inside any existing project or new folder:

### Windows (PowerShell):
```powershell
irm https://raw.githubusercontent.com/rehanlabs/AI-Setup/main/install.ps1 | iex
```

### macOS / Linux / WSL (Bash):
```bash
curl -fsSL https://raw.githubusercontent.com/rehanlabs/AI-Setup/main/install.sh | bash
```

### From Local Clone:
```powershell
& "path/to/AI-Setup/setup-project.ps1"
```

---

## What Happens When You Run The Installer

In ~5 seconds, the script automatically:
1. Deploys the `.agents/` directory containing all 32 engineering skills and specialist subagents.
2. Creates universal rule bridges (`AGENTS.md`, `CLAUDE.md`, `.cursorrules`, `.windsurfrules`, `.clinerules`, `.github/copilot-instructions.md`, `GEMINI.md`).
3. Initializes Git (if not already a repository).
4. Installs automated `graphify` post-commit Git hooks.
5. Builds the initial knowledge graph baseline in `graphify-out/`.

---

## The Autonomous Engineering Lifecycle

Any AI agent operating in the workspace automatically adheres to this 6-stage pipeline without manual micro-management:

```
[ User Request ]
       │
       ▼
1. DISCOVERY & GROUNDING ───────► Query graphify (knowledge graph) & surface assumptions (interview-me)
       │
       ▼
2. SPEC & SIMPLICITY GUARD ─────► Write minimal spec (spec-driven-development) & apply YAGNI (ponytail)
       │
       ▼
3. TASK BREAKDOWN ──────────────► Split into small atomic slices (planning-and-task-breakdown)
       │
       ▼
4. TEST-DRIVEN IMPLEMENTATION ──► Red-Green-Refactor loop (test-driven-development & incremental-implementation)
       │
       ▼
5. VERIFICATION & AUDIT ────────► 5-axis review (code-review-and-quality / code-reviewer subagent)
       │
       ▼
6. KNOWLEDGE GRAPH SYNC ────────► Update AST/graph automatically via Git hook (graphify update .)
```

---

## Universal Agent Compatibility

| Agent | Configuration File | Behavior |
| :--- | :--- | :--- |
| **Google Antigravity** | `.agents/`, `AGENTS.md`, `GEMINI.md` | Full native skills, rules, subagents, and knowledge graph |
| **Claude Code** | `CLAUDE.md`, `.agents/` | Automatic 6-stage lifecycle rules |
| **Cursor** | `.cursorrules`, `.cursor/rules/orchestrator.mdc` | Always-on workspace orchestration |
| **Windsurf** | `.windsurfrules` | Project rules and TDD enforcement |
| **GitHub Copilot** | `.github/copilot-instructions.md` | Contextual engineering guidelines |
| **Cline** | `.clinerules` | Strict Red-Green-Refactor enforcement |
| **Codex / OpenCode / Zed** | `AGENTS.md` | Standard multi-agent contract |

---

## Prerequisites (For Knowledge Graph Features)

* **Python 3.10+**
* `pip install graphifyy`
