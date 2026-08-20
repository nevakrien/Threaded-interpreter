#include "opcodes.h"

#include <stdio.h>

extern void *clang_hell_shared_label;

static inline __attribute__((always_inline)) const void *clang_hell_label(void)
{
GLOBAL_LABEL(clang_hell_shared_label)
    return &&__c_label_clang_hell_shared_label;
}

static __attribute__((noinline)) const void *static_route_one(void)
{
     asm __volatile__ ("nop");
    return clang_hell_label();
}

static __attribute__((noinline)) const void *static_route_two(void)
{   
    asm __volatile__ ("nop");
    return clang_hell_label();
}

static __attribute__((noinline)) const void *static_route_three(void)
{
    return clang_hell_label();
}

__attribute__((noinline)) const void *clang_hell_global_one(void)
{
    return clang_hell_label();
}

__attribute__((noinline)) const void *clang_hell_global_two(void)
{
    return clang_hell_label();
}

__attribute__((noinline)) const void *clang_hell_global_three(void)
{
    return clang_hell_label();
}

int main(void)
{
    const void *expected = &clang_hell_shared_label;
    const void *labels[] = {
        clang_hell_label(),
        clang_hell_label(),
        static_route_one(),
        static_route_two(),
        static_route_three(),
        clang_hell_global_one(),
        clang_hell_global_two(),
        clang_hell_global_three(),
    };
    int errored = 0;
    for (size_t i = 0; i < sizeof(labels) / sizeof(labels[0]); ++i) {
        if (labels[i] != expected) {
            fprintf(stderr, "route %zu returned %p, expected %p\n", i,
                    labels[i], expected);
        }
    }

    if(errored) return 1;

    printf("all routes returned %p\n", expected);
    return 0;
}
