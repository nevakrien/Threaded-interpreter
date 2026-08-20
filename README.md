# Threaded Forth Experiments

Two deliberately small Forth-like VMs demonstrate Clang's computed-goto
extension and globally exported C labels. Both execute:

```forth
2 3 + dup * .  10 4 - .
```

and print `25` followed by `6`.

## Variants

- `direct.c`: the VM core exports each handler label. Dispatch is
  `goto *ip->opcode`.
- `direct_test.c`: a separate translation unit links against those labels and
  places their addresses directly in its instruction stream.
- `indirect.c`: another VM core exports its handler labels. Dispatch is
  `goto *ip->opcode->code`.
- `indirect_test.c`: separately linked code fields contain the exported label
  addresses, and its instruction stream points to those fields.
- `opcodes.h`: declares the exported label symbols as `extern void *`.
- `clang-hell.c`: always-inlines one exported-label helper into repeated direct,
  static-function, and externally visible function call paths, then verifies
  that every path returns the exact same address.

An exported name denotes a location in executable code, not a real C pointer
object. Client code therefore uses `&forth_direct_push`, never the value of
`forth_direct_push`. The address expression creates a normal linker relocation
which is resolved against the global assembler label in the VM object file.

These are execution-core examples rather than complete Forth systems: source
parsing, a dictionary, stack checks, and colon definitions are intentionally
left out.

## Build and test

Clang is required because the label addresses escape through inline assembly.

```sh
make
./direct
./indirect
./clang-hell
make test
```

`make test` also uses `nm` to prove that each client object has an undefined
opcode reference and that the corresponding VM object exports a text symbol,
before running the linked executables.
