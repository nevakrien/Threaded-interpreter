#include "opcodes.h"

#include <stdio.h>



#define NEXT() goto *(++vm->ip)->opcode
#define POP() (*--vm->sp)
#define PUSH(value) (*vm->sp++ = (value))

void direct_run(DirectVM *vm)
{
    goto *vm->ip->opcode;

GLOBAL_LABEL(forth_direct_push)
    ++vm->ip;
    PUSH(vm->ip->value);
    NEXT();

GLOBAL_LABEL(forth_direct_add)
    {
        intptr_t rhs = POP();
        intptr_t lhs = POP();
        PUSH(lhs + rhs);
    }
    NEXT();

GLOBAL_LABEL(forth_direct_sub)
    {
        intptr_t rhs = POP();
        intptr_t lhs = POP();
        PUSH(lhs - rhs);
    }
    NEXT();

GLOBAL_LABEL(forth_direct_mul)
    {
        intptr_t rhs = POP();
        intptr_t lhs = POP();
        PUSH(lhs * rhs);
    }
    NEXT();

GLOBAL_LABEL(forth_direct_dup)
    PUSH(vm->sp[-1]);
    NEXT();

GLOBAL_LABEL(forth_direct_print)
    printf("%ld\n", (long)POP());
    NEXT();

GLOBAL_LABEL(forth_direct_call)
    ++vm->ip;
    *vm->rp++ = vm->ip + 1;
    vm->ip = vm->ip->target;
    goto *vm->ip->opcode;

GLOBAL_LABEL(forth_direct_ret)
    vm->ip = *--vm->rp;
    goto *vm->ip->opcode;

GLOBAL_LABEL(forth_direct_halt)
    return;
}
