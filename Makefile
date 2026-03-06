CC = x86_64-w64-mingw32-gcc
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
