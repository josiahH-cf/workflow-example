# Tasks: F-001-hello-world

**Feature ID:** F-001-hello-world
**Spec:** /specs/F-001-hello-world.md

## Status

- Total: 3
- Complete: 3
- Remaining: 0
- Blocked: 0

## Pre-Implementation Tests

| AC | Test File | Status |
|----|-----------|--------|
| AC-1 | tests/test_hello.sh (compile check) | [x] Passing |
| AC-2 | tests/test_hello.sh (PE validity check) | [x] Passing |
| AC-3 | tests/test_hello.sh (stdout check) | [x] Passing |
| AC-4 | tests/test_hello.sh (exit code check) | [x] Passing |

## Task List

### T-1: Write test script

- **Files:** `tests/test_hello.sh`
- **Test File:** `tests/test_hello.sh` (self — this IS the test artifact)
- **Done when:** Test script exists, is executable, covers all four ACs, and fails cleanly before implementation
- **Criteria covered:** AC-1, AC-2, AC-3, AC-4
- **Model:** copilot
- **Reviewer:** claude
- **Branch:** `copilot/feat-hello-world`
- **Status:** [x] Complete

### T-2: Write C source and Makefile

- **Files:** `src/main.c`, `Makefile`
- **Test File:** `tests/test_hello.sh`
- **Done when:** `make build` succeeds with exit code 0 and produces `build/hello.exe`
- **Criteria covered:** AC-1, AC-2
- **Model:** copilot
- **Reviewer:** claude
- **Branch:** `copilot/feat-hello-world`
- **Status:** [x] Complete

### T-3: Verify end-to-end (all ACs pass)

- **Files:** (no new files — verification only)
- **Test File:** `tests/test_hello.sh`
- **Done when:** `make test` exits 0 with all ACs passing; AC-3 and AC-4 pass if Wine is available, skip gracefully otherwise
- **Criteria covered:** AC-1, AC-2, AC-3, AC-4
- **Model:** copilot
- **Reviewer:** claude
- **Branch:** `copilot/feat-hello-world`
- **Status:** [x] Complete

## Test Strategy

- AC-1: `tests/test_hello.sh` — verifies compiler exits 0 and `build/hello.exe` exists
- AC-2: `tests/test_hello.sh` — verifies `file build/hello.exe` output contains "PE32+"
- AC-3: `tests/test_hello.sh` — verifies `wine build/hello.exe` stdout equals `Hello, world!\n` exactly (skips if Wine absent)
- AC-4: `tests/test_hello.sh` — verifies Wine exit code is 0 (skips if Wine absent)

## Evidence Log

- **T-1:** `2a529e5` — tests/test_hello.sh created, all 4 ACs covered, fails cleanly pre-impl
- **T-2:** `472d8c9` — src/main.c + Makefile, `make build` produces PE32+ exe
- **T-3:** `ae04258` — All 4 ACs pass (AC-1 compile, AC-2 PE format, AC-3 stdout, AC-4 exit code)

## Session Log

- **2026-03-06:** Completed T-1, T-2, T-3. All ACs passing. No blockers.
