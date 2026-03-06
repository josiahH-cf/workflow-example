# Contributing

This project follows the Agent Workflow system. All contributions route through the workflow phases defined in [AGENTS.md](AGENTS.md).

## Branch Naming

Format: `model/type-short-description`

- **model:** `claude`, `copilot`, or `codex`
- **type:** `feat`, `bug`, `refactor`, `chore`, `docs`
- **short-description:** 2–4 word kebab-case summary

Examples: `copilot/feat-hello-world`, `claude/bug-compile-fix`

## Commit Format

- One task per commit
- Reference the spec or task file in the commit message
- Prefix with task ID when applicable (e.g., `T-1: Add test script`)

## Pull Request Requirements

- Fill out the PR template at `.github/pull_request_template.md`
- All acceptance criteria from the linked spec must have corresponding tests
- All tests must pass locally before opening a PR
- Diff should be under 300 lines; split if larger
- Include AC evidence table mapping each criterion to its test and result

## Build & Test

```bash
# Install toolchain
sudo apt-get update && sudo apt-get install -y mingw-w64 make

# Build
make build

# Test
make test

# Clean
make clean
```

## Code Conventions

- **Language:** C (C99 or later)
- **Compiler:** `x86_64-w64-mingw32-gcc` with `-Wall -Wextra`
- **Source layout:** Single file at `src/main.c`
- **Output:** `build/hello.exe`
- **Naming:** snake_case for files; standard C conventions for code
- **Tests:** Shell script in `tests/test_hello.sh`; exits 0 on pass, non-zero on fail

## Boundaries

### Always

- Read the spec before implementation
- Run tests before committing
- Include acceptance criteria evidence in every PR

### Never

- Commit secrets or `.env` files
- Modify files outside the assigned scope
- Auto-merge without human approval
- Skip tests

## Bug Reporting

Log bugs in `bugs/LOG.md` using the format in [workflow/BOUNDARIES.md](workflow/BOUNDARIES.md).
