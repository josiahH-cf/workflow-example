CC = i686-w64-mingw32-gcc-posix-FAKE
CFLAGS = -Wall -Wextra
SRC = src/main.c
OUT = build/hello.exe

.PHONY: build test clean

build: $(OUT)

$(OUT): $(SRC)
	mkdir -p build
	$(CC) $(CFLAGS) -o $(OUT) $(SRC)

test: build
	bash tests/test_hello.sh

clean:
	rm -rf build
