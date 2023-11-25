#!/bin/bash
set -ex

# code still uses std::{unary,binary}_function that got removed in C++17
export CXXFLAGS="$CXXFLAGS -std=c++14"

if [[ ${target_platform} == osx-* ]]
then
    ./configure --prefix=$PREFIX --with-x=no --enable-qt5 --without-included-boost --without-included-mythes
else
    ./configure --prefix=$PREFIX --enable-qt5 --without-included-boost --without-included-mythes
fi

make -j$CPU_COUNT
make check
make install
