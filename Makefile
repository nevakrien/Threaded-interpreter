CC := clang
CFLAGS := -std=gnu11 -O2 -Wall -Wextra -Wpedantic -Wno-gnu-label-as-value

.PHONY: all test clean

all: direct indirect

direct: direct.o direct_test.o
	$(CC) $^ -o $@

indirect: indirect.o indirect_test.o
	$(CC) $^ -o $@

clang-hell: clang-hell.o
	$(CC) $^ -o $@

direct.o: direct.c opcodes.h
	$(CC) $(CFLAGS) -c direct.c -o $@

direct_test.o: direct_test.c opcodes.h
	$(CC) $(CFLAGS) -c direct_test.c -o $@

indirect.o: indirect.c opcodes.h
	$(CC) $(CFLAGS) -c indirect.c -o $@

indirect_test.o: indirect_test.c opcodes.h
	$(CC) $(CFLAGS) -c indirect_test.c -o $@

clang-hell.o: clang-hell.c opcodes.h
	$(CC) $(CFLAGS) -c clang-hell.c -o $@

test: all
	sh test.sh

clean:
	rm -f direct indirect clang-hell *.o
