# Release Notes — v1.0.0

**Date:** 2026-03-06

## Features

### F-001-hello-world

Cross-compiled Windows "Hello, world!" PE executable built from WSL using mingw-w64.

- **Source:** `src/main.c` — prints `Hello, world!\n` and exits with code 0
- **Build:** `Makefile` with `build`, `test`, `clean` targets
- **Tests:** `tests/test_hello.sh` — verifies compilation, PE format, stdout, and exit code
- **Spec:** [specs/F-001-hello-world.md](specs/F-001-hello-world.md)

### Acceptance Criteria — All Passing

| AC | Description | Status |
|----|-------------|--------|
| AC-1 | Compiler exits 0, `.exe` produced | PASS |
| AC-2 | `file` identifies PE32+ executable | PASS |
| AC-3 | stdout is exactly `Hello, world!` | PASS |
| AC-4 | Exit code is 0 | PASS |

## Bugs Fixed

- **BUG-001:** Makefile referenced non-existent compiler (`i686-w64-mingw32-gcc-posix-FAKE`). Restored to `x86_64-w64-mingw32-gcc`.

## Requirements

- WSL or Linux with `mingw-w64` and `make`
- Wine (optional, for runtime AC-3/AC-4 verification)
