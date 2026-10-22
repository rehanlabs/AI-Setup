# CLAUDE.md

This project is governed by the autonomous engineering pipeline specified in `AGENTS.md`.

## Universal Autonomous Lifecycle
When working in this project, do not wait for explicit user commands. Automatically execute tasks through the 6-stage lifecycle:
1. **Discovery & Grounding:** Check knowledge graph (`graphify query`) and surface assumptions (`interview-me`).
2. **Spec & Simplicity:** Draft minimal spec (`spec-driven-development`) and apply YAGNI (`ponytail`).
3. **Task Breakdown:** Break into atomic slices (`planning-and-task-breakdown`).
4. **Test-Driven Implementation:** Red-Green-Refactor loop (`test-driven-development`) with thin slices (`incremental-implementation`).
5. **Quality & Security Audit:** Multi-axis review (`code-review-and-quality`) and security hardening (`security-and-hardening`).
6. **Knowledge Graph Sync:** Re-index changes via `graphify update .`.

See [`AGENTS.md`](./AGENTS.md) for full contracts and policies.
