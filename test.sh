#!/bin/sh
set -eu

expected='25
6
12'

# Before linking, clients must refer to the opcode tables and the VM objects
# must define them as data rather than exporting their local code labels.
nm direct_test.o | grep -q ' U forth_direct_opcodes$'
nm direct.o | grep -q ' B forth_direct_opcodes$'
nm indirect_test.o | grep -q ' U forth_indirect_opcodes$'
nm indirect.o | grep -q ' B forth_indirect_opcodes$'

# The global-label clients refer directly to text symbols exported by the VM.
for op in push add sub mul dup print call ret halt; do
    nm direct_global_test.o | grep -q " U forth_direct_global_${op}$"
    nm direct_global.o | grep -q " T forth_direct_global_${op}$"
    nm indirect_global_test.o | grep -q " U forth_indirect_global_${op}$"
    nm indirect_global.o | grep -q " T forth_indirect_global_${op}$"
done

test "$(./direct)" = "$expected"
test "$(./indirect)" = "$expected"
test "$(./direct-global)" = "$expected"
test "$(./indirect-global)" = "$expected"
./clang-hell
nm clang-hell.o | grep -q ' T clang_hell_shared_label$'
printf 'table and global-label linkage and runtime tests passed\n'
