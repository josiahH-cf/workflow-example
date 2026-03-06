#!/usr/bin/env bash
set -euo pipefail

PASS=0
FAIL=0
SKIP=0

pass() { echo "  PASS: $1"; PASS=$((PASS + 1)); }
fail() { echo "  FAIL: $1"; FAIL=$((FAIL + 1)); }
skip() { echo "  SKIP: $1"; SKIP=$((SKIP + 1)); }

# Resolve project root (one level up from tests/)
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
EXE="$ROOT/build/hello.exe"

echo "=== F-001-hello-world: Test Suite ==="

# --- AC-1: Compilation succeeds and produces .exe ---
echo ""
echo "--- AC-1: Compilation ---"
if make -C "$ROOT" build > /dev/null 2>&1; then
    if [[ -f "$EXE" ]]; then
        pass "AC-1: Compiler exits 0 and build/hello.exe exists"
    else
        fail "AC-1: Compiler exited 0 but build/hello.exe not found"
    fi
else
    fail "AC-1: Compilation failed (non-zero exit code)"
fi

# --- AC-2: PE format validation ---
echo ""
echo "--- AC-2: PE format ---"
if [[ -f "$EXE" ]]; then
    FILE_OUTPUT="$(file "$EXE")"
    if echo "$FILE_OUTPUT" | grep -q "PE32+"; then
        pass "AC-2: file identifies hello.exe as PE32+"
    else
        fail "AC-2: file output does not contain PE32+ — got: $FILE_OUTPUT"
    fi
else
    fail "AC-2: build/hello.exe does not exist; cannot check PE format"
fi

# --- AC-3 & AC-4: Runtime tests (require Wine) ---
echo ""
echo "--- AC-3 / AC-4: Runtime (Wine) ---"
if command -v wine > /dev/null 2>&1; then
    if [[ -f "$EXE" ]]; then
        ACTUAL_OUTPUT="$(wine "$EXE" 2>/dev/null)" || WINE_EXIT=$?
        WINE_EXIT="${WINE_EXIT:-0}"

        # AC-3: stdout check
        EXPECTED="Hello, world!"
        if [[ "$ACTUAL_OUTPUT" == "$EXPECTED" ]]; then
            pass "AC-3: stdout is exactly 'Hello, world!'"
        else
            fail "AC-3: stdout mismatch — expected '$EXPECTED', got '$ACTUAL_OUTPUT'"
        fi

        # AC-4: exit code check
        if [[ "$WINE_EXIT" -eq 0 ]]; then
            pass "AC-4: Wine exit code is 0"
        else
            fail "AC-4: Wine exit code is $WINE_EXIT (expected 0)"
        fi
    else
        fail "AC-3: build/hello.exe does not exist; cannot run"
        fail "AC-4: build/hello.exe does not exist; cannot run"
    fi
else
    skip "AC-3: Wine not installed — skipping stdout check"
    skip "AC-4: Wine not installed — skipping exit code check"
fi

# --- Summary ---
echo ""
echo "=== Results: $PASS passed, $FAIL failed, $SKIP skipped ==="

if [[ "$FAIL" -gt 0 ]]; then
    exit 1
fi
exit 0
