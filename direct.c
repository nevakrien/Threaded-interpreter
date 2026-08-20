#include "opcodes.h"

#include <stdio.h>



#define NEXT() goto *(++vm->ip)->opcode
#define POP() (*--vm->sp)
#define PUSH(value) (*vm->sp++ = (value))

DirectOpcodes forth_direct_opcodes;

static int direct_initialized;

void direct_init(void)
{
    if (!direct_initialized)
        direct_run(NULL);
}

void direct_run(DirectVM *vm)
{
    if (!direct_initialized) {
        forth_direct_opcodes = (DirectOpcodes){
            .push = &&forth_direct_push,
            .add = &&forth_direct_add,
            .sub = &&forth_direct_sub,
            .mul = &&forth_direct_mul,
            .dup = &&forth_direct_dup,
            .print = &&forth_direct_print,
            .call = &&forth_direct_call,
            .ret = &&forth_direct_ret,
            .halt = &&forth_direct_halt,
        };
        direct_initialized = 1;
    }
    if (vm == NULL)
        return;

    goto *vm->ip->opcode;

forth_direct_push:
    ++vm->ip;
    PUSH(vm->ip->value);
    NEXT();

forth_direct_add:
    {
        intptr_t rhs = POP();
        intptr_t lhs = POP();
        PUSH(lhs + rhs);
    }
    NEXT();

forth_direct_sub:
    {
        intptr_t rhs = POP();
        intptr_t lhs = POP();
        PUSH(lhs - rhs);
    }
    NEXT();

forth_direct_mul:
    {
        intptr_t rhs = POP();
        intptr_t lhs = POP();
        PUSH(lhs * rhs);
    }
    NEXT();

forth_direct_dup:
    PUSH(vm->sp[-1]);
    NEXT();

forth_direct_print:
    printf("%ld\n", (long)POP());
    NEXT();

forth_direct_call:
    ++vm->ip;
    *vm->rp++ = vm->ip + 1;
    vm->ip = vm->ip->target;
    goto *vm->ip->opcode;

forth_direct_ret:
    vm->ip = *--vm->rp;
    goto *vm->ip->opcode;

forth_direct_halt:
    return;
}
