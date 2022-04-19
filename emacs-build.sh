#!/bin/bash

set -e
set -u

if [ $# -ne 1 ]; then
    echo "$(basename $0) <emacs-source-dir>"
    exit 2
fi

runtime_ver () {
    grep AC_INIT configure.ac | awk -F, '{print $2}' | tr -d ' '
}

pushd "$1"

local_lpath=/etc/emacs
local_lpath=${local_lpath}:/usr/local/share/emacs/$(runtime_ver)/site-lisp
local_lpath=${local_lpath}:/usr/share/emacs/site-lisp
local_lpath=${local_lpath}:/usr/share/emacs/$(runtime_ver)/site-lisp
local_lpath=${local_lpath}:/usr/share/emacs/site-lisp

# For supporting wayland
BUILD_OPTIONS="--with-pgtk --without-xaw3d --enable-locallisppath=${local_lpath} --with-mailutils --with-libsystemd"
BUILD_OPTIONS="${BUILD_OPTIONS} --with-native-compilation"

if [ "$CLANG" == "yes" ]; then
    export CC="/usr/bin/clang"
    export CXX="/usr/bin/clang++"
    export CPP="/usr/bin/clang -E"
    export LD="/usr/bin/lld"
    export AR="/usr/bin/llvm-ar"
    export AS="/usr/bin/llvm-as"
    export CCFLAGS="-fuse-ld=lld"
    export CXXFLAGS="-fuse-ld=lld"

    BUILD_OPTIONS="${BUILD_OPTIONS} --enable-autodepend"
fi

./configure $BUILD_OPTIONS
make -j$(nproc)
sudo make install
