# Autonomous Agent Orchestrator & Engineering Pipeline

This workspace is governed by an automated, multi-skill engineering pipeline. The agent does NOT require the user to manually trigger individual skills; instead, the agent automatically coordinates the installed toolkits (`agent-skills`, `ponytail`, `graphify`, and specialist subagents) through a structured lifecycle.

---

## The Autonomous Engineering Lifecycle

Whenever a task, feature request, refactor, or bug fix is received, the agent must autonomously execute through these stages:

```
[ User Request ]
       │
       ▼
1. DISCOVERY & GROUNDING ───────► Query graphify (knowledge graph) & check assumptions (interview-me)
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
6. KNOWLEDGE GRAPH SYNC ────────► Update AST/graph automatically (graphify update .)
```

---

## Stage Policies & Skill Mapping

### 1. Discovery & Grounding
* **Knowledge Check:** If `graphify-out/graph.json` exists, always query it (`graphify query "<topic>"`) to map dependencies and affected call flows before writing code.
* **Surface Assumptions:** If requirements have ambiguities, invoke [`interview-me`](.agents/plugins/agent-skills/skills/interview-me/SKILL.md) or list assumptions explicitly before writing code. Never make silent architectural guesses.

### 2. Specification & Simplicity Guardrails
* **Spec First:** For any new feature or substantial architectural change, follow [`spec-driven-development`](.agents/plugins/agent-skills/skills/spec-driven-development/SKILL.md) to define contracts, behaviors, and edge cases.
* **Ponytail Simplicity Bar:** Enforce [`ponytail`](.agents/plugins/ponytail/skills/ponytail/SKILL.md) principles. Eliminate bloat, boilerplate, premature abstractions, and speculative generality. Solve the task with the smallest, most robust change.

### 3. Task Planning
* Break the work down using [`planning-and-task-breakdown`](.agents/plugins/agent-skills/skills/planning-and-task-breakdown/SKILL.md).
* Organize tasks into thin, sequentially verifiable slices.

### 4. Implementation (TDD & Incremental Delivery)
* Follow [`test-driven-development`](.agents/plugins/agent-skills/skills/test-driven-development/SKILL.md):
  1. **Red**: Write a focused, failing test that defines the expected behavior.
  2. **Green**: Write the minimal production code needed to pass the test.
  3. **Refactor**: Clean up the code while keeping tests green.
* Deliver code in verifiable increments using [`incremental-implementation`](.agents/plugins/agent-skills/skills/incremental-implementation/SKILL.md).

### 5. Multi-Axis Review & Quality Gate
* Before declaring any non-trivial change complete, run [`code-review-and-quality`](.agents/plugins/agent-skills/skills/code-review-and-quality/SKILL.md) or delegate to the `code-reviewer` subagent.
* Verify security boundaries using [`security-and-hardening`](.agents/plugins/agent-skills/skills/security-and-hardening/SKILL.md).
* If code looks over-complicated, invoke [`code-simplification`](.agents/plugins/agent-skills/skills/code-simplification/SKILL.md).

### 6. Knowledge Graph Maintenance
* After creating or modifying source code, run `graphify update .` to keep the project's knowledge graph and AST synchronized.
