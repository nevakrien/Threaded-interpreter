# Threaded Interpreter Experiments

This repositry is showing some example with threaded intetpters. 
It is somewhat of a compiler test to clang as well, specifically to see how it handles escaping labels.

The core idea behind a threaded interpter is we use actual assembly addresses to encode our next step.
Then the interpter does
```asm
jmp rdi
```

as the way to get to the next place. Instead of needing to make some math first, and only then know where to jump.

The result of this is a weird form of outlined assembly that is just connected in the entire process. Every function is a bunch of.

```
[OP0 OP1 OP2 OP3 ...]
```

which then either directly or indirectly point at underlying assembly
```
OP0:[machine_code ...]
OP1:[machine_code ...]
OP2:[machine_code ...]
```
That machine code gets excuted directly, so in effect this is almost a JIT.
In fact this sort of aproch can be very friendly to simple JITs, sine with the indirect threaded version we have.

```
OP0: [ASM_PTR, DATA]
```

which for functions is
```
OP_CALL_F: [CALL, FUNC_START]
```

replacing that pointer to call with a pointer to the compiled function is easy enough.
With relaxed atomics its fairly cheap as well.

The JITed code can now run directly after the interpter.

You could also just take the machine code pointed to by all the diffrent OPs, and inline it. At that point you have made a very basic JIT. So the boundry here is not super clear cut

# Encoding Ops
So because we need that assembly pointer life is a bit tricky. We can just make 1 giant non stoping function that does both the encoding and the runing. For something like forth thats what they do.

We can inlinze some global table somewhere with all our internal labels, this is what erlang does.

If we change how we write this we can rely on TCO, this would add some additional issues around the calling convention.  You would want MUST_TAIL in all your recursions. and then preserve-none to let the compiler use all the registers it can want.

Or... we can do some weird assembly hacks

# Weird Hack

So it would be nice if we could actually access the labels in the function.
This lets us set up opcodes in tables in C and then give them to our interpter. 

The nicest thing is that those tables can now be in global static const arrays. 
Which other aproches dont let us do (except the TCO one).

So... we hack the clang assembler a bit and hope for the best.

```c
#define GLOBAL_LABEL(export_name)                           \
    __c_label_##export_name:                               \
    __asm__ __volatile__(                                  \
        ".globl " #export_name "\n"                      \
        #export_name ":\n"                                \
        :                                                  \
        : "X"(&&__c_label_##export_name));
```

and now we have the label in our object so just declare somewhere

```c
extern const void *const my_label;
```

and we can get the actual thing. 


This does currently work, but I am very unsure if thats intentional behivior. Also fucking it up even a littele bit causes UB. Like the order of the C label and the asm label matters a lot here.

So... you can use that just be responsible about testing it and your specific compiler version.
It probably would keep working for actually runing code, but it may behave weird in the future if its in a bigger TU or something.