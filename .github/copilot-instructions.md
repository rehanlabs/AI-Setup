# GitHub Copilot Instructions - Autonomous Engineering Pipeline

This repository is governed by the autonomous engineering pipeline specified in `AGENTS.md`.

When writing, refactoring, or testing code in this repository:
1. Ground architectural context by checking existing contracts and relationships (`graphify query`).
2. Spec-first design: define minimal contracts before implementation.
3. Ponytail YAGNI principles: eliminate boilerplate, premature abstractions, and speculative code.
4. Follow Test-Driven Development (TDD): write failing tests before production code.
5. Review code against security, performance, correctness, and architecture standards.
6. Synchronize the knowledge graph with `graphify update .`.
