---
trigger: always_on
description: Autonomous orchestrator that coordinates agent-skills, ponytail, and graphify into a cohesive pipeline.
---

## Autonomous Skill Orchestration

Whenever developing, refactoring, fixing bugs, or implementing features in this workspace, coordinate the active toolkits as an automated pipeline without waiting for manual command invocations:

1. **Before Coding (Ground & Clarify):**
   - Check existing graphify knowledge (`graphify query`) for architecture context.
   - Surface assumptions or ask clarifying questions (`interview-me`) if requirements are underspecified.
2. **Design & Scope (Spec & Simplicity):**
   - Write clear contracts (`spec-driven-development`).
   - Cut bloat and unnecessary abstractions (`ponytail` YAGNI principles).
3. **Execution (Plan & TDD):**
   - Break into atomic tasks (`planning-and-task-breakdown`).
   - Implement via thin slices (`incremental-implementation`) and Red-Green-Refactor (`test-driven-development`).
4. **Verification & Audit:**
   - Review code quality across architecture, correctness, and security (`code-review-and-quality` / `code-reviewer`).
   - Simplify any tangled code (`code-simplification`).
5. **Sync Knowledge Graph:**
   - Run `graphify update .` after code modifications to keep graphify-out up to date.
