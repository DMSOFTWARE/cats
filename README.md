   Welcome to Russians Lab for the Cats Preparation

This is git repository (respect to Linus Torvalds) containing
a number of code examples for researching input/output
subsystem implementations in different computer languages (compilers
and interpreters).

Due to very small size of the tested code examples, it is
quite fair to compare compilers and interpreters
in the single test set.

Currently, we explore how native I/O operations work
for each system under examination on re-implementation of the
GNU `cat` utility.

For the sake of performance, if it's possible, we use functions
which operate on big blocks of data.

Utility `strace` or its analogs can be used to explore system
calls of executing programs.

To analyze computation systems based on virtual machines
with bytecode execution (e.g. JVM, BEAM, Parrot), a command
`strace` can be called with the `-f` flag.
