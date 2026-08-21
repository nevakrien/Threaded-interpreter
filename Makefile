CC := clang
CFLAGS := -std=gnu11 -O2 -Wall -Wextra -Wpedantic -Wno-gnu-label-as-value

.PHONY: all test clean

all: direct indirect direct-global indirect-global

direct: direct.o direct_test.o
	$(CC) $^ -o $@

indirect: indirect.o indirect_test.o
	$(CC) $^ -o $@

direct-global: direct_global.o direct_global_test.o
	$(CC) $^ -o $@

indirect-global: indirect_global.o indirect_global_test.o
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

direct_global.o: direct_global.c opcodes.h
	$(CC) $(CFLAGS) -c direct_global.c -o $@

direct_global_test.o: direct_global_test.c opcodes.h
	$(CC) $(CFLAGS) -c direct_global_test.c -o $@

indirect_global.o: indirect_global.c opcodes.h
	$(CC) $(CFLAGS) -c indirect_global.c -o $@

indirect_global_test.o: indirect_global_test.c opcodes.h
	$(CC) $(CFLAGS) -c indirect_global_test.c -o $@

clang-hell.o: clang-hell.c opcodes.h
	$(CC) $(CFLAGS) -Wno-return-stack-address -c clang-hell.c -o $@

test: all clang-hell
	sh test.sh

clean:
	rm -f direct indirect direct-global indirect-global clang-hell *.o
