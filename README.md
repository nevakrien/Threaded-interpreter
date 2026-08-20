# Threaded Forth Experiments

Two deliberately small Forth-like VMs demonstrate Clang's computed-goto
extension and runtime-initialized opcode tables. Both execute arithmetic
followed by a nested function call:

```forth
2 3 + dup * .  10 4 - .  3 quadruple .
```

and print `25`, `6`, and `12`. `quadruple` calls a separate `double_value`
function twice, exercising the VMs' return stacks.

## Variants

- `direct.c`: `direct_init()` fills the global direct opcode table with local
  handler addresses. Dispatch is `goto *ip->opcode`.
- `direct_test.c`: initializes that table and places its entries directly in
  the instruction stream.
- `indirect.c`: `indirect_init()` fills a corresponding indirect opcode table.
  Dispatch is `goto *ip->opcode->code`.
- `indirect_test.c`: separately allocated code fields contain entries copied
  from that table, and its instruction stream points to those fields.
- `opcodes.h`: defines the typed opcode tables and their initialization API.
- `clang-hell.c`: a standalone experiment showing why exported or escaped local
  labels are not used by the VMs. It is intentionally outside the default
  build and test path.

Clients must call `direct_init()` or `indirect_init()` before reading the
corresponding global table. Initialization is idempotent. Handler addresses are
obtained with Clang's `&&label` extension and are only dispatched inside the
function containing those labels; no code location is declared as a C object.

`call` is followed by a cell containing the callee's first instruction. `ret`
resumes at the instruction after that operand cell. Functions share the data
stack with their callers and use a separate return stack.

These are execution-core examples rather than complete Forth systems: source
parsing, a dictionary, stack checks, and source-level colon definitions are
intentionally left out.

## Build and test

Clang is required by this experiment's current compiler guard. The VM opcode
tables themselves are populated with Clang's computed-goto extension and do not
use inline assembly.

```sh
make
./direct
./indirect
make test
```

`make test` also uses `nm` to prove that each client refers to its global opcode
table and that the corresponding VM object defines it, before running the
linked executables. `make clang-hell` builds the separate assembler-label
experiment, whose behavior is not part of the VM's guarantees.
