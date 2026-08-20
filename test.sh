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

test "$(./direct)" = "$expected"
test "$(./indirect)" = "$expected"
printf 'opcode table linkage and runtime tests passed\n'
