rm -rf ../build-symloc
mkdir ../build-symloc
cd ../build-symloc
export CC=clang
export CXX=clang++
cmake \
    -DENABLE_SOLVER_STP=ON \
    -DENABLE_POSIX_RUNTIME=ON \
    -DENABLE_KLEE_UCLIBC=ON \
    -DKLEE_UCLIBC_PATH=/home/haoxin/research/klee-se/klee-uclibc \
    -DLLVM_CONFIG_BINARY=/home/haoxin/research/packages/llvm-13/build-clang-13/bin/llvm-config \
    -DLLVMCC=/home/haoxin/research/packages/llvm-13/build-clang-13/bin/clang \
    -DLLVMCXX=/home/haoxin/research/packages/llvm-13/build-clang-13/bin/clang++ ../SymLoc
make -j4
