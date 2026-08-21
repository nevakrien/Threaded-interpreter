#include "opcodes.h"

int main(void)
{
    const IndirectOpcode push = {INDIRECT_GLOBAL_CODE(push)};
    const IndirectOpcode add = {INDIRECT_GLOBAL_CODE(add)};
    const IndirectOpcode sub = {INDIRECT_GLOBAL_CODE(sub)};
    const IndirectOpcode mul = {INDIRECT_GLOBAL_CODE(mul)};
    const IndirectOpcode dup = {INDIRECT_GLOBAL_CODE(dup)};
    const IndirectOpcode print = {INDIRECT_GLOBAL_CODE(print)};
    const IndirectOpcode call = {INDIRECT_GLOBAL_CODE(call)};
    const IndirectOpcode ret = {INDIRECT_GLOBAL_CODE(ret)};
    const IndirectOpcode halt = {INDIRECT_GLOBAL_CODE(halt)};
    const IndirectCell double_value[] = {
        {.opcode = &dup},
        {.opcode = &add},
        {.opcode = &ret},
    };
    const IndirectCell quadruple_value[] = {
        {.opcode = &call}, {.target = double_value},
        {.opcode = &call}, {.target = double_value},
        {.opcode = &ret},
    };
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
        {.opcode = &push}, {.value = 3},
        {.opcode = &call}, {.target = quadruple_value},
        {.opcode = &print},
        {.opcode = &halt},
    };
    IndirectVM vm = {
        .ip = program,
        .sp = vm.stack,
        .rp = vm.return_stack,
    };

    indirect_global_run(&vm);
    return 0;
}
