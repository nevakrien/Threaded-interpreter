#include "opcodes.h"

int main(void)
{
    const DirectCell double_value[] = {
        {.opcode = DIRECT_GLOBAL_OPCODE(dup)},
        {.opcode = DIRECT_GLOBAL_OPCODE(add)},
        {.opcode = DIRECT_GLOBAL_OPCODE(ret)},
    };
    const DirectCell quadruple_value[] = {
        {.opcode = DIRECT_GLOBAL_OPCODE(call)}, {.target = double_value},
        {.opcode = DIRECT_GLOBAL_OPCODE(call)}, {.target = double_value},
        {.opcode = DIRECT_GLOBAL_OPCODE(ret)},
    };
    const DirectCell program[] = {
        {.opcode = DIRECT_GLOBAL_OPCODE(push)}, {.value = 2},
        {.opcode = DIRECT_GLOBAL_OPCODE(push)}, {.value = 3},
        {.opcode = DIRECT_GLOBAL_OPCODE(add)},
        {.opcode = DIRECT_GLOBAL_OPCODE(dup)},
        {.opcode = DIRECT_GLOBAL_OPCODE(mul)},
        {.opcode = DIRECT_GLOBAL_OPCODE(print)},
        {.opcode = DIRECT_GLOBAL_OPCODE(push)}, {.value = 10},
        {.opcode = DIRECT_GLOBAL_OPCODE(push)}, {.value = 4},
        {.opcode = DIRECT_GLOBAL_OPCODE(sub)},
        {.opcode = DIRECT_GLOBAL_OPCODE(print)},
        {.opcode = DIRECT_GLOBAL_OPCODE(push)}, {.value = 3},
        {.opcode = DIRECT_GLOBAL_OPCODE(call)}, {.target = quadruple_value},
        {.opcode = DIRECT_GLOBAL_OPCODE(print)},
        {.opcode = DIRECT_GLOBAL_OPCODE(halt)},
    };
    DirectVM vm = {
        .ip = program,
        .sp = vm.stack,
        .rp = vm.return_stack,
    };

    direct_global_run(&vm);
    return 0;
}
