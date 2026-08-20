#include "opcodes.h"

int main(void)
{
    /* Every opcode here is an extern symbol defined in direct.c. */
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
        {.opcode = DIRECT_OPCODE(halt)},
    };
    DirectVM vm = {.ip = program, .sp = vm.stack};

    direct_run(&vm);
    return 0;
}
