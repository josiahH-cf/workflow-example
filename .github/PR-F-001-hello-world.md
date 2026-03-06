# Pull Request

## What

Add a cross-compiled Windows "Hello, world!" PE executable built from WSL using mingw-w64.

## Feature Linkage

- Feature ID: F-001-hello-world
- Spec: /specs/F-001-hello-world.md
- Tasks: /tasks/F-001-hello-world.md
- Decisions: /decisions/0001-shell-script-tests.md

## Why

Implements the sole feature defined in [/specs/F-001-hello-world.md](/specs/F-001-hello-world.md), covering all three constitution Core Capabilities: cross-compilation, exact stdout output, and clean exit.

## Changes

**Build system:**
- `Makefile` — `build`, `test`, `clean` targets using `x86_64-w64-mingw32-gcc`

**Source:**
- `src/main.c` — `printf("Hello, world!\n"); return 0;`

**Tests:**
- `tests/test_hello.sh` — shell test covering AC-1 through AC-4 with Wine skip logic

**Workflow artifacts:**
- `tasks/F-001-hello-world.md` — task tracker (3/3 complete)
- `bugs/LOG.md` — BUG-001 logged and fixed (bad compiler reference)
- `workflow/STATE.json` — phase advanced to 7b-review

## Testing

- [x] All acceptance criteria from the spec have corresponding tests
- [x] All tests pass locally
- [x] No existing tests were modified to accommodate new behavior
- [ ] Linting and formatting checks pass — N/A (single-file C project, no linter configured)

## Criteria Coverage

- AC-1 → `tests/test_hello.sh` (compile check): PASS
- AC-2 → `tests/test_hello.sh` (PE validity check): PASS
- AC-3 → `tests/test_hello.sh` (stdout check via Wine): PASS
- AC-4 → `tests/test_hello.sh` (exit code check via Wine): PASS

## Non-Code Checks

- [x] Spec acceptance criteria are all addressed
- [x] Diff is under 300 lines (205 lines)
- [x] No files changed outside the declared scope
- [x] Commit messages reference the spec or task file
- [x] No TODOs or placeholder text in the diff
- [x] No new dependencies added without justification
- [x] Rollback path is documented below

## Verification

- Commands run:
  - `make clean && make test`
- Evidence summary:
  - 4 passed, 0 failed, 0 skipped
  - `file build/hello.exe` → `PE32+ executable (console) x86-64, for MS Windows`

## Rollback

Standard revert.

---

## Spec Reference

- Constitution alignment: Core Capabilities #1 (cross-compile), #2 (exact stdout), #3 (clean exit)
- Feature spec: `/specs/F-001-hello-world.md`
- Task breakdown: `/tasks/F-001-hello-world.md`

## AC Evidence

| AC ID | Description | Test | Result |
|-------|-------------|------|--------|
| AC-1 | Compiler exits 0, .exe produced | tests/test_hello.sh (compile check) | PASS |
| AC-2 | file identifies PE32+ | tests/test_hello.sh (PE validity check) | PASS |
| AC-3 | stdout is exactly `Hello, world!\n` | tests/test_hello.sh (stdout check) | PASS |
| AC-4 | Exit code is 0 | tests/test_hello.sh (exit code check) | PASS |

## Model & Branch

- Implementing model: copilot
- Branch: copilot/feat-hello-world

## Review Notes

- Self-reviewed only. Cross-review by a different agent is recommended before merge.
- BUG-001 discovered and fixed during Phase 7 testing (bad compiler reference in Makefile).
