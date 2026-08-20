#!/bin/sh
set -eu

expected='25
6
12'

# Before linking, clients must have unresolved opcode-label references and the
# VM objects must export definitions for the linker to resolve.
for op in push add sub mul dup print call ret halt; do
    nm direct_test.o | grep -q " U forth_direct_${op}$"
    nm direct.o | grep -q " T forth_direct_${op}$"
    nm indirect_test.o | grep -q " U forth_indirect_${op}$"
    nm indirect.o | grep -q " T forth_indirect_${op}$"
done

test "$(./direct)" = "$expected"
test "$(./indirect)" = "$expected"
./clang-hell
nm clang-hell.o | grep -q " T clang_hell_shared_label$"
for route in one two three; do
    nm clang-hell.o | grep -q " T clang_hell_global_${route}$"
done
printf 'external linkage, inline-label, and runtime tests passed\n'
