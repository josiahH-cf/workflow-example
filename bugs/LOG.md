# Bug Log

## BUG-001: Makefile references non-existent compiler

- **Description:** Makefile `CC` variable changed from `x86_64-w64-mingw32-gcc` to `i686-w64-mingw32-gcc-posix-FAKE`, a compiler that does not exist. All builds fail.
- **Location:** Makefile:1
- **Phase found:** 7-test (post-implementation)
- **Severity:** blocking
- **Expected:** `make build` compiles `src/main.c` into `build/hello.exe` using `x86_64-w64-mingw32-gcc`
- **Actual:** `make build` fails — compiler binary not found
- **ACs affected:** AC-1, AC-2, AC-3, AC-4 (all fail)
- **Fix-as-you-go:** yes — restore correct compiler name
- **Status:** fixed — restored `x86_64-w64-mingw32-gcc` in Makefile
