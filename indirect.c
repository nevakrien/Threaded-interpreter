#include "opcodes.h"

#include <stdio.h>


/* The extra ->code load is the indirection absent from direct.c. */
#define NEXT() goto *(++vm->ip)->opcode->code
#define POP() (*--vm->sp)
#define PUSH(value) (*vm->sp++ = (value))

IndirectOpcodes forth_indirect_opcodes;

static int indirect_initialized;

void indirect_init(void)
{
    if (!indirect_initialized)
        indirect_run(NULL);
}

void indirect_run(IndirectVM *vm)
{
    if (!indirect_initialized) {
        forth_indirect_opcodes = (IndirectOpcodes){
            .push = &&forth_indirect_push,
            .add = &&forth_indirect_add,
            .sub = &&forth_indirect_sub,
            .mul = &&forth_indirect_mul,
            .dup = &&forth_indirect_dup,
            .print = &&forth_indirect_print,
            .call = &&forth_indirect_call,
            .ret = &&forth_indirect_ret,
            .halt = &&forth_indirect_halt,
        };
        indirect_initialized = 1;
    }
    if (vm == NULL)
        return;

    goto *vm->ip->opcode->code;

forth_indirect_push:
    ++vm->ip;
    PUSH(vm->ip->value);
    NEXT();

forth_indirect_add:
    {
        intptr_t rhs = POP();
        intptr_t lhs = POP();
        PUSH(lhs + rhs);
    }
    NEXT();

forth_indirect_sub:
    {
        intptr_t rhs = POP();
        intptr_t lhs = POP();
        PUSH(lhs - rhs);
    }
    NEXT();

forth_indirect_mul:
    {
        intptr_t rhs = POP();
        intptr_t lhs = POP();
        PUSH(lhs * rhs);
    }
    NEXT();

forth_indirect_dup:
    PUSH(vm->sp[-1]);
    NEXT();

forth_indirect_print:
    printf("%ld\n", (long)POP());
    NEXT();

forth_indirect_call:
    ++vm->ip;
    *vm->rp++ = vm->ip + 1;
    vm->ip = vm->ip->target;
    goto *vm->ip->opcode->code;

forth_indirect_ret:
    vm->ip = *--vm->rp;
    goto *vm->ip->opcode->code;

forth_indirect_halt:
    return;
}
