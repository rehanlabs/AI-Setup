# Graph Report - AI Setup  (2026-10-22)

## Corpus Check
- cluster-only mode — file stats not available

## Summary
- 1200 nodes · 2093 edges · 87 communities (72 shown, 15 thin omitted)
- Extraction: 95% EXTRACTED · 5% INFERRED · 0% AMBIGUOUS · INFERRED: 105 edges (avg confidence: 0.85)
- Token cost: 0 input · 0 output

## Graph Freshness
- Built from commit: `178661f2`
- Run `git rev-parse HEAD` and compare to check if the graph is stale.
- Run `graphify update .` after code changes (no API cost).

## Community Hubs (Navigation)
- Community 0
- Community 1
- Community 2
- Community 3
- Community 4
- Community 5
- Community 6
- Community 7
- Community 8
- Community 9
- Community 10
- Community 11
- Community 12
- Community 13
- Community 14
- Community 15
- Community 16
- Community 17
- Community 18
- Community 19
- Community 20
- Community 21
- Community 22
- Community 23
- Community 24
- Community 25
- Community 26
- Community 27
- Community 28
- Community 29
- Community 30
- Community 31
- Community 32
- Community 33
- Community 34
- Community 35
- Community 36
- Community 37
- Community 38
- Community 39
- Community 40
- Community 41
- Community 42
- Community 43
- Community 44
- Community 45
- Community 46
- Community 47
- Community 48
- Community 49
- Community 50
- Community 51
- Community 52
- Community 53
- Community 54
- Community 55
- Community 56
- Community 57
- Community 58
- Community 59
- Community 60
- Community 61
- Community 62
- Community 63
- Community 64
- Community 65
- Community 66
- Community 67
- Community 68
- Community 69
- Community 70
- Community 71
- Community 72
- Community 73
- Community 74
- Community 75
- Community 78
- Community 79
- Community 80
- Community 81
- Community 82
- Community 83
- Community 84

## God Nodes (most connected - your core abstractions)
1. `register()` - 29 edges
2. `getPonytailInstructions()` - 17 edges
3. `ponytailExtension()` - 14 edges
4. `_fail()` - 14 edges
5. `_ok()` - 14 edges
6. `judge_call()` - 13 edges
7. `getDefaultMode()` - 13 edges
8. `main()` - 13 edges
9. `run_cell()` - 13 edges
10. `normalizeMode()` - 12 edges

## Surprising Connections (you probably didn't know these)
- `createPiHarness()` --calls--> `ponytailExtension()`  [EXTRACTED]
  .agents/plugins/ponytail/pi-extension/test/extension.test.js → .agents/plugins/ponytail/pi-extension/index.js
- `writeBoard()` --indirect_call--> `tasksFrom()`  [INFERRED]
  .agents/plugins/ponytail/hooks/band/register.tsx → .agents/plugins/ponytail/hooks/band/board.ts
- `main()` --calls--> `load_key()`  [EXTRACTED]
  .agents/plugins/ponytail/benchmarks/agentic/complete.py → .agents/plugins/ponytail/benchmarks/agentic/judge.py
- `judge_reply()` --calls--> `judge_call()`  [EXTRACTED]
  .agents/plugins/ponytail/benchmarks/agentic/answer.py → .agents/plugins/ponytail/benchmarks/agentic/judge.py
- `_pair_call()` --calls--> `judge_call()`  [EXTRACTED]
  .agents/plugins/ponytail/benchmarks/agentic/answer.py → .agents/plugins/ponytail/benchmarks/agentic/judge.py

## Import Cycles
- None detected.

## Communities (87 total, 15 thin omitted)

### Community 0 - "Community 0"
Cohesion: 0.06
Nodes (77): boardHtml(), day(), duration(), elapsed(), esc(), fmtTokens(), json(), PALETTE (+69 more)

### Community 1 - "Community 1"
Cohesion: 0.03
Nodes (62): assert, bandFlag, claudeEnv, codebuddyConfigDir, codebuddyEnv, codebuddyHome, codebuddyState, codexData (+54 more)

### Community 2 - "Community 2"
Cohesion: 0.05
Nodes (53): csvRow(), field(), fs, { getClaudeDir }, HAIKU_55_LONG, human(), ledgerDir(), mergeRows() (+45 more)

### Community 3 - "Community 3"
Cohesion: 0.06
Nodes (48): DESCRIPTION_TRIGGER_NEGATE_ALL, extractSkillReferences(), frontmatterYamlErrors(), fs, isEffectivelyEmpty(), lintPersona(), lintPersonaContent(), lintSkill() (+40 more)

### Community 4 - "Community 4"
Cohesion: 0.07
Nodes (44): buildCorpus(), CASES_DIR, clearGradingSlot(), cosine(), duplicateEvalIds(), EVAL_KINDS, { execFileSync }, extractExecutorModel() (+36 more)

### Community 5 - "Community 5"
Cohesion: 0.09
Nodes (22): _contained(), _fail(), _find(), _find_class(), _import(), _import_pkg(), _ok(), score_auth() (+14 more)

### Community 6 - "Community 6"
Cohesion: 0.11
Nodes (18): _cli_call(), aggregate(), _base_cmd(), _claude_version(), _git(), _git_snapshot(), main(), _one() (+10 more)

### Community 7 - "Community 7"
Cohesion: 0.09
Nodes (25): isShellSafe(), fs, hooksPath(), install(), isPonytailHook(), { isShellSafe }, os, path (+17 more)

### Community 8 - "Community 8"
Cohesion: 0.06
Nodes (29): assert, claudeDir, configDir, configPath, cursorDir, cursorFlagPath, cursorHooksPath, env (+21 more)

### Community 9 - "Community 9"
Cohesion: 0.12
Nodes (24): activate(), claudeDir, {
  clearMode,
  cursorRuleNotice,
  cursorRulePath,
  isCodeBuddy,
  isCodex,
  isCopilot,
  isCursor,
  readMode,
  setMode,
  writeHookOutput,
}, { execFileSync }, finish(), fs, { getDefaultMode, getClaudeDir, isShellSafe }, { getPonytailInstructions } (+16 more)

### Community 10 - "Community 10"
Cohesion: 0.16
Nodes (14): main(), parse_complete(), _rank_ok(), run(), one(), selftest(), selftest_offline(), submission() (+6 more)

### Community 11 - "Community 11"
Cohesion: 0.08
Nodes (25): author, name, url, bugs, url, description, exports, ./plugin (+17 more)

### Community 12 - "Community 12"
Cohesion: 0.16
Nodes (15): _cells(), _fixed_diff(), _gate_ok(), judge_reply(), main(), _pair_call(), pairwise(), one() (+7 more)

### Community 13 - "Community 13"
Cohesion: 0.18
Nodes (15): build_injected_context(), _config_dir(), _default_mode(), _fallback_instructions(), _filter_skill_body_for_mode(), _handle_mode_command(), _make_skill_command_handler(), handler() (+7 more)

### Community 14 - "Community 14"
Cohesion: 0.13
Nodes (17): fs, getConfigDir(), getConfigPath(), getHideStatus(), getQoderDir(), getQuietStartup(), normalizeConfigMode(), os (+9 more)

### Community 15 - "Community 15"
Cohesion: 0.19
Nodes (17): getDefaultMode(), normalizeMode(), writeDefaultMode(), __dirname, { getDefaultMode, normalizeMode, writeDefaultMode }, { getPonytailInstructions }, { parseCommandFile, parseSkillFile }, persistMode() (+9 more)

### Community 16 - "Community 16"
Cohesion: 0.18
Nodes (11): normalizePersistedMode(), completePonytailArgs(), {
  DEFAULT_MODE,
  RUNTIME_MODES,
  getDefaultMode,
  getQuietStartup,
  getHideStatus,
  normalizeMode,
  normalizePersistedMode,
  isDeactivationCommand,
  writeDefaultMode,
}, { getPonytailInstructions, filterSkillBodyForMode }, parsePonytailCommand(), ponytailExtension(), readDefaultMode, readQuietStartup (+3 more)

### Community 17 - "Community 17"
Cohesion: 0.15
Nodes (14): { DEFAULT_MODE, normalizeMode, normalizePersistedMode }, filterSkillBodyForMode(), fs, getFallbackInstructions(), getPonytailInstructions(), INDEPENDENT_MODES, path, SKILL_PATH (+6 more)

### Community 18 - "Community 18"
Cohesion: 0.14
Nodes (13): { after, before, test }, assert, cases, commitFile(), CONSTRAINTS, fs, git(), makeRepo() (+5 more)

### Community 19 - "Community 19"
Cohesion: 0.16
Nodes (13): { afterEach, test }, assert, fs, os, path, sandboxes, SKILL_LINT, { spawnSync } (+5 more)

### Community 20 - "Community 20"
Cohesion: 0.18
Nodes (8): chat_code_loc(), code_stats(), _count(), git_diff_stats(), gz(), _is_test(), score_workspace(), _selfcheck_split()

### Community 21 - "Community 21"
Cohesion: 0.18
Nodes (9): fs, path, system, fs, path, system, frontmatterField(), parseCommandFile() (+1 more)

### Community 22 - "Community 22"
Cohesion: 0.21
Nodes (12): DESCRIPTIONS, fs, NAMES, outPath(), path, render(), ROOT, sourceBody() (+4 more)

### Community 23 - "Community 23"
Cohesion: 0.17
Nodes (10): { afterEach, test }, assert, fs, hardeningSkill(), os, path, sandboxes, { spawnSync } (+2 more)

### Community 24 - "Community 24"
Cohesion: 0.17
Nodes (12): assert, commands, { filterSkillBodyForMode }, fs, os, path, python(), pythonExe() (+4 more)

### Community 25 - "Community 25"
Cohesion: 0.36
Nodes (11): block_hash(), escape_glob(), expand_file(), file_id(), file_is_whole(), filter_file(), has_placeholders(), hash_cmd() (+3 more)

### Community 26 - "Community 26"
Cohesion: 0.17
Nodes (8): { afterEach, test }, assert, fs, os, path, sandboxes, { spawnSync }, VALIDATOR

### Community 27 - "Community 27"
Cohesion: 0.21
Nodes (11): descriptionFromMd(), descriptionFromToml(), DIRS, { frontmatterYamlErrors, parseFrontmatter }, fs, loadCommands(), main(), NAME_MAP (+3 more)

### Community 28 - "Community 28"
Cohesion: 0.23
Nodes (4): load(), main(), sign_p(), main()

### Community 29 - "Community 29"
Cohesion: 0.20
Nodes (8): CHECKS, correctnessTimeoutMs(), exec(), { execSync }, fs, os, path, python()

### Community 30 - "Community 30"
Cohesion: 0.17
Nodes (9): { createHash }, fs, { getClaudeDir, getQoderDir }, os, path, projectDir, stateDir, statePath (+1 more)

### Community 31 - "Community 31"
Cohesion: 0.17
Nodes (9): agents, canonical, copies, fs, INVARIANTS, path, root, skill (+1 more)

### Community 32 - "Community 32"
Cohesion: 0.18
Nodes (11): assert, fs, loadManifest(), path, read(), REUSED_COMMANDS, REUSED_SKILLS, root (+3 more)

### Community 33 - "Community 33"
Cohesion: 0.17
Nodes (8): assert, fs, os, path, { pathToFileURL }, statePath, test, tmp

### Community 34 - "Community 34"
Cohesion: 0.22
Nodes (9): BUDGET, buildMap(), { execFileSync }, fs, LANG, listFiles(), namesIn(), path (+1 more)

### Community 35 - "Community 35"
Cohesion: 0.18
Nodes (10): assert, commands, debtCopies, debtSamples, fs, path, piSource, root (+2 more)

### Community 36 - "Community 36"
Cohesion: 0.18
Nodes (8): assert, fs, HOST_PLUGIN_MANIFESTS, os, path, root, { spawn, execFileSync }, test

### Community 38 - "Community 38"
Cohesion: 0.33
Nodes (8): assert_eq(), block_hash(), CACHE, file_id(), hash_cmd(), hook_event(), rt_hook_event(), simplify-ignore-test.sh script

### Community 39 - "Community 39"
Cohesion: 0.20
Nodes (7): fs, passthrough, path, root, skillsDir, slugs, { spawnSync }

### Community 40 - "Community 40"
Cohesion: 0.20
Nodes (7): assert, { buildMap }, dir, fs, map, os, path

### Community 41 - "Community 41"
Cohesion: 0.25
Nodes (6): output, { performance }, products, { renderProducts }, start, renderProducts()

### Community 42 - "Community 42"
Cohesion: 0.25
Nodes (5): CHECKS, assert, behavior, check(), test

### Community 43 - "Community 43"
Cohesion: 0.22
Nodes (6): assert, fs, path, root, SKILL_DIRS, test

### Community 44 - "Community 44"
Cohesion: 0.22
Nodes (7): assert, fs, os, path, root, { spawnSync }, test

### Community 45 - "Community 45"
Cohesion: 0.25
Nodes (7): description, name, owner, name, url, plugins, $schema

### Community 46 - "Community 46"
Cohesion: 0.39
Nodes (5): assert_eq(), hash_key(), run_hook(), seed_entry(), sdd-cache-test.sh script

### Community 47 - "Community 47"
Cohesion: 0.29
Nodes (7): ARTIFACT_ALLOWLIST, findViolations(), fs, GUARDED_FILES, main(), path, ROOT

### Community 48 - "Community 48"
Cohesion: 0.25
Nodes (7): description, name, owner, name, url, plugins, $schema

### Community 49 - "Community 49"
Cohesion: 0.29
Nodes (7): distinct, fs, path, readVersion(), root, VERSION_FILES, versions

### Community 50 - "Community 50"
Cohesion: 0.25
Nodes (6): assert, fs, path, REQUIRED_COMMAND_FILES, root, test

### Community 51 - "Community 51"
Cohesion: 0.33
Nodes (4): parseConfig(), assert, { parseConfig }, test

### Community 52 - "Community 52"
Cohesion: 0.29
Nodes (6): description, name, private, scripts, test, version

### Community 53 - "Community 53"
Cohesion: 0.33
Nodes (5): assert, cases, loc, score(), test

### Community 54 - "Community 54"
Cohesion: 0.33
Nodes (3): fs, http, path

### Community 55 - "Community 55"
Cohesion: 0.33
Nodes (5): name, private, scripts, lint, test

### Community 56 - "Community 56"
Cohesion: 0.40
Nodes (4): slugify(), assert, { slugify }, test

### Community 57 - "Community 57"
Cohesion: 0.40
Nodes (4): paginate(), assert, { paginate }, test

### Community 58 - "Community 58"
Cohesion: 0.40
Nodes (4): assert, test, { total }, total()

### Community 59 - "Community 59"
Cohesion: 0.40
Nodes (4): assert, test, { visibleReports }, visibleReports()

### Community 60 - "Community 60"
Cohesion: 0.40
Nodes (4): previewWebhook(), assert, { previewWebhook }, test

### Community 61 - "Community 61"
Cohesion: 0.40
Nodes (4): splitCents(), assert, { splitCents }, test

### Community 62 - "Community 62"
Cohesion: 0.33
Nodes (3): expectedVersion, manifestPaths, { readFileSync }

### Community 63 - "Community 63"
Cohesion: 0.33
Nodes (4): assert, manifestPaths, { readFileSync }, test

### Community 64 - "Community 64"
Cohesion: 0.33
Nodes (5): Band, claude-code, PluginState, Tests, Tokens

### Community 65 - "Community 65"
Cohesion: 0.33
Nodes (5): name, private, scripts, test, type

### Community 67 - "Community 67"
Cohesion: 0.33
Nodes (5): assert, fs, path, root, test

### Community 68 - "Community 68"
Cohesion: 0.33
Nodes (5): assert, fs, path, root, test

### Community 69 - "Community 69"
Cohesion: 0.33
Nodes (5): assert, fs, path, root, test

### Community 70 - "Community 70"
Cohesion: 0.33
Nodes (5): assert, fs, path, root, test

### Community 72 - "Community 72"
Cohesion: 0.70
Nodes (4): dbg(), extract_header(), hash_key(), sdd-cache-post.sh script

### Community 73 - "Community 73"
Cohesion: 0.50
Nodes (4): assert, check(), correctness, test

### Community 74 - "Community 74"
Cohesion: 0.83
Nodes (3): dbg(), hash_key(), sdd-cache-pre.sh script

## Knowledge Gaps
- **2 isolated node(s):** `RFC-4180`, `CACHE`
  These have ≤1 connection - possible missing edges. (Counts symbols only; 679 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **15 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `getPonytailInstructions()` connect `Community 17` to `Community 16`, `Community 9`, `Community 1`, `Community 15`?**
  _High betweenness centrality (0.006) - this node is a cross-community bridge._
- **What connects `RFC-4180`, `CACHE` to the rest of the system?**
  _2 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `Community 0` be split into smaller, more focused modules?**
  _Cohesion score 0.06374829001367989 - nodes in this community are weakly interconnected._
- **Why does `getDefaultMode()` connect `Community 15` to `Community 16`, `Community 9`, `Community 14`, `Community 1`?**
  _High betweenness centrality (0.004) - this node is a cross-community bridge._
- **Should `Community 1` be split into smaller, more focused modules?**
  _Cohesion score 0.03125 - nodes in this community are weakly interconnected._
- **Why does `writeDefaultMode()` connect `Community 15` to `Community 16`, `Community 9`, `Community 14`, `Community 1`?**
  _High betweenness centrality (0.003) - this node is a cross-community bridge._
- **Should `Community 2` be split into smaller, more focused modules?**
  _Cohesion score 0.05084745762711865 - nodes in this community are weakly interconnected._