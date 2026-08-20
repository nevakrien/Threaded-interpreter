#include "opcodes.h"

int main(void)
{
    /* Code fields live here, separately from their exported code labels. */
    const IndirectOpcode push = {INDIRECT_CODE(push)};
    const IndirectOpcode add = {INDIRECT_CODE(add)};
    const IndirectOpcode sub = {INDIRECT_CODE(sub)};
    const IndirectOpcode mul = {INDIRECT_CODE(mul)};
    const IndirectOpcode dup = {INDIRECT_CODE(dup)};
    const IndirectOpcode print = {INDIRECT_CODE(print)};
    const IndirectOpcode halt = {INDIRECT_CODE(halt)};
    const IndirectCell program[] = {
        {.opcode = &push}, {.value = 2},
        {.opcode = &push}, {.value = 3},
        {.opcode = &add},
        {.opcode = &dup},
        {.opcode = &mul},
        {.opcode = &print},
        {.opcode = &push}, {.value = 10},
        {.opcode = &push}, {.value = 4},
        {.opcode = &sub},
        {.opcode = &print},
        {.opcode = &halt},
    };
    IndirectVM vm = {.ip = program, .sp = vm.stack};

    indirect_run(&vm);
    return 0;
}
