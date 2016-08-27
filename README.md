   Welcome to Russians Lab for the Cats Preparation

This is git repository (respect to Linus Torvalds) contains
a number of code examples for research of input/output
subsystem in the different computer languages (compilers
and interpreters).

Because the tested code examples are very small, it is
fairly correct to compare compilers and interpreters
in the single test set.

Currently, we explore, how to works native I/O operations
for every computation system on re-implementation of the
utility GNU `cat`.

In behalf of performance, if it possible, we use a functions,
which work with a big blocks of data.

Utility `strace` or her analogs can be used to explore system
calls of executed programms.

For analyze the computation systems, based on virtual machines
with bytecode execution (e.g. JVM, BEAM, Parrot), a command
`strace` can be called with the flag `-f`.
