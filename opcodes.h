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
    const union DirectCell *target;
} DirectCell;

typedef struct DirectVM {
    const DirectCell *ip;
    intptr_t stack[64];
    intptr_t *sp;
    const DirectCell *return_stack[64];
    const DirectCell **rp;
} DirectVM;

/* An indirect-threaded instruction points here, then follows code. */
typedef struct IndirectOpcode {
    const void *code;
} IndirectOpcode;

typedef union IndirectCell {
    const IndirectOpcode *opcode;
    intptr_t value;
    const union IndirectCell *target;
} IndirectCell;

typedef struct IndirectVM {
    const IndirectCell *ip;
    intptr_t stack[64];
    intptr_t *sp;
    const IndirectCell *return_stack[64];
    const IndirectCell **rp;
} IndirectVM;

typedef struct DirectOpcodes {
    const void *push;
    const void *add;
    const void *sub;
    const void *mul;
    const void *dup;
    const void *print;
    const void *call;
    const void *ret;
    const void *halt;
} DirectOpcodes;

typedef DirectOpcodes IndirectOpcodes;

extern DirectOpcodes forth_direct_opcodes;
extern IndirectOpcodes forth_indirect_opcodes;

#define DIRECT_OPCODE(name) (forth_direct_opcodes.name)
#define INDIRECT_CODE(name) (forth_indirect_opcodes.name)

/* These declarations name code locations, not pointer objects. */
extern const void *const forth_direct_global_push;
extern const void *const forth_direct_global_add;
extern const void *const forth_direct_global_sub;
extern const void *const forth_direct_global_mul;
extern const void *const forth_direct_global_dup;
extern const void *const forth_direct_global_print;
extern const void *const forth_direct_global_call;
extern const void *const forth_direct_global_ret;
extern const void *const forth_direct_global_halt;

#define DIRECT_GLOBAL_OPCODE(name) \
    ((const void *)&forth_direct_global_##name)

extern const void *const forth_indirect_global_push;
extern const void *const forth_indirect_global_add;
extern const void *const forth_indirect_global_sub;
extern const void *const forth_indirect_global_mul;
extern const void *const forth_indirect_global_dup;
extern const void *const forth_indirect_global_print;
extern const void *const forth_indirect_global_call;
extern const void *const forth_indirect_global_ret;
extern const void *const forth_indirect_global_halt;

#define INDIRECT_GLOBAL_CODE(name) \
    ((const void *)&forth_indirect_global_##name)

void direct_init(void);
void direct_run(DirectVM *vm);
void indirect_init(void);
void indirect_run(IndirectVM *vm);
void direct_global_run(DirectVM *vm);
void indirect_global_run(IndirectVM *vm);

#endif
