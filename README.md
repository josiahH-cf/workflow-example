# hello-verify

A minimal C "Hello, world!" program cross-compiled from WSL into a Windows PE executable using mingw-w64. This project exists to validate the [Agent Workflow](AGENTS.md) system end-to-end.

## What It Does

- Cross-compiles a single C source file into a Windows `.exe` using `x86_64-w64-mingw32-gcc`
- The binary prints exactly `Hello, world!\n` to stdout
- Exits with status code `0`
- The output is a valid PE32+ executable

## Prerequisites

- **WSL** (Windows Subsystem for Linux) or a Linux environment
- **mingw-w64** cross-compiler:
  ```bash
  sudo apt-get update && sudo apt-get install -y mingw-w64
  ```
- **Wine** (optional, for runtime verification of AC-3/AC-4):
  ```bash
  sudo apt-get install -y wine
  ```
- **make**:
  ```bash
  sudo apt-get install -y make
  ```

## Build

```bash
make build
```

Produces `build/hello.exe`.

## Test

```bash
make test
```

Runs `tests/test_hello.sh`, which verifies:

| AC | Check | Requires Wine? |
|----|-------|---------------|
| AC-1 | Compiler exits 0, `build/hello.exe` exists | No |
| AC-2 | `file` identifies PE32+ executable | No |
| AC-3 | stdout is exactly `Hello, world!` | Yes (skips if absent) |
| AC-4 | Exit code is 0 | Yes (skips if absent) |

## Clean

```bash
make clean
```

## Project Structure

```
src/main.c              ← single source file
Makefile                ← build/test/clean targets
tests/test_hello.sh     ← acceptance criteria tests
specs/                  ← feature specifications
tasks/                  ← task tracking
bugs/LOG.md             ← bug log
workflow/               ← workflow orchestration
.specify/constitution.md ← project identity
```

## Workflow

This project follows the Agent Workflow system defined in [AGENTS.md](AGENTS.md). See [CONTRIBUTING.md](CONTRIBUTING.md) for contribution guidelines.

## License

This is a verification project — no license applies to the artifact itself.
