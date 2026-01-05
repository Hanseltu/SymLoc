#!/bin/bash

rm -rf klee-*

# recompile first
clang -g -emit-llvm -c case.c

# change .bc to readable .ll
llvm-dis case.bc

# execute klee
../../../build-symloc/bin/symloc -libc=uclibc  case.bc
#klee --write-kqueries --write-smt2s --write-cvcs --write-paths --write-sym-paths --write-cov --write-test-info \
    #-libc=uclibc -posix-runtime -max-time=30s  case.bc
