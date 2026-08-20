#include "opcodes.h"

int main(void)
{
    direct_init();

    const DirectCell double_value[] = {
        {.opcode = DIRECT_OPCODE(dup)},
        {.opcode = DIRECT_OPCODE(add)},
        {.opcode = DIRECT_OPCODE(ret)},
    };
    const DirectCell quadruple_value[] = {
        {.opcode = DIRECT_OPCODE(call)}, {.target = double_value},
        {.opcode = DIRECT_OPCODE(call)}, {.target = double_value},
        {.opcode = DIRECT_OPCODE(ret)},
    };
    /* Every opcode here comes from the table initialized by direct_init(). */
    const DirectCell program[] = {
        {.opcode = DIRECT_OPCODE(push)}, {.value = 2},
        {.opcode = DIRECT_OPCODE(push)}, {.value = 3},
        {.opcode = DIRECT_OPCODE(add)},
        {.opcode = DIRECT_OPCODE(dup)},
        {.opcode = DIRECT_OPCODE(mul)},
        {.opcode = DIRECT_OPCODE(print)},
        {.opcode = DIRECT_OPCODE(push)}, {.value = 10},
        {.opcode = DIRECT_OPCODE(push)}, {.value = 4},
        {.opcode = DIRECT_OPCODE(sub)},
        {.opcode = DIRECT_OPCODE(print)},
        {.opcode = DIRECT_OPCODE(push)}, {.value = 3},
        {.opcode = DIRECT_OPCODE(call)}, {.target = quadruple_value},
        {.opcode = DIRECT_OPCODE(print)},
        {.opcode = DIRECT_OPCODE(halt)},
    };
    DirectVM vm = {
        .ip = program,
        .sp = vm.stack,
        .rp = vm.return_stack,
    };

    direct_run(&vm);
    return 0;
}
