#include "opcodes.h"

#include <stdio.h>


/* The extra ->code load is the indirection absent from direct.c. */
#define NEXT() goto *(++vm->ip)->opcode->code
#define POP() (*--vm->sp)
#define PUSH(value) (*vm->sp++ = (value))

void indirect_run(IndirectVM *vm)
{
    goto *vm->ip->opcode->code;

GLOBAL_LABEL(forth_indirect_push)
    ++vm->ip;
    PUSH(vm->ip->value);
    NEXT();

GLOBAL_LABEL(forth_indirect_add)
    {
        intptr_t rhs = POP();
        intptr_t lhs = POP();
        PUSH(lhs + rhs);
    }
    NEXT();

GLOBAL_LABEL(forth_indirect_sub)
    {
        intptr_t rhs = POP();
        intptr_t lhs = POP();
        PUSH(lhs - rhs);
    }
    NEXT();

GLOBAL_LABEL(forth_indirect_mul)
    {
        intptr_t rhs = POP();
        intptr_t lhs = POP();
        PUSH(lhs * rhs);
    }
    NEXT();

GLOBAL_LABEL(forth_indirect_dup)
    PUSH(vm->sp[-1]);
    NEXT();

GLOBAL_LABEL(forth_indirect_print)
    printf("%ld\n", (long)POP());
    NEXT();

GLOBAL_LABEL(forth_indirect_call)
    ++vm->ip;
    *vm->rp++ = vm->ip + 1;
    vm->ip = vm->ip->target;
    goto *vm->ip->opcode->code;

GLOBAL_LABEL(forth_indirect_ret)
    vm->ip = *--vm->rp;
    goto *vm->ip->opcode->code;

GLOBAL_LABEL(forth_indirect_halt)
    return;
}
