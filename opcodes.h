#ifndef FORTH_OPCODES_H
#define FORTH_OPCODES_H

#ifndef __clang__
#error "We relly on the fact clang takes exported refrences very seriously "
/*(specifcally stated those BBs never get cloned)*/
/*https://github.com/llvm/llvm-project/issues/41834?utm_source=chatgpt.com*/
#endif

/* Give a computed-goto label a stable, link-visible assembler name. */
#define GLOBAL_LABEL(export_name)                           \
    __c_label_##export_name:                               \
    __asm__ __volatile__(                                  \
        ".globl " #export_name "\n"                      \
        #export_name ":\n"                                \
        :                                                  \
        : "X"(&&__c_label_##export_name));

#include <stdint.h>

/* A direct-threaded cell contains either a handler address or an operand. */
typedef union DirectCell {
    const void *opcode;
    intptr_t value;
} DirectCell;

typedef struct DirectVM {
    const DirectCell *ip;
    intptr_t stack[64];
    intptr_t *sp;
} DirectVM;

/* An indirect-threaded instruction points here, then follows code. */
typedef struct IndirectOpcode {
    const void *code;
} IndirectOpcode;

typedef union IndirectCell {
    const IndirectOpcode *opcode;
    intptr_t value;
} IndirectCell;

typedef struct IndirectVM {
    const IndirectCell *ip;
    intptr_t stack[64];
    intptr_t *sp;
} IndirectVM;

/*
 * These names are linker-visible code labels, not pointer objects. Always use
 * &forth_* to obtain an opcode; evaluating forth_* would read code as data.
 */
extern const void *const forth_direct_push;
extern const void *const forth_direct_add;
extern const void *const forth_direct_sub;
extern const void *const forth_direct_mul;
extern const void *const forth_direct_dup;
extern const void *const forth_direct_print;
extern const void *const forth_direct_halt;

#define DIRECT_OPCODE(name) ((const void *)&forth_direct_##name)

extern const void *const forth_indirect_push;
extern const void *const forth_indirect_add;
extern const void *const forth_indirect_sub;
extern const void *const forth_indirect_mul;
extern const void *const forth_indirect_dup;
extern const void *const forth_indirect_print;
extern const void *const forth_indirect_halt;

#define INDIRECT_CODE(name) ((const void *)&forth_indirect_##name)

void direct_run(DirectVM *vm);
void indirect_run(IndirectVM *vm);

#endif
