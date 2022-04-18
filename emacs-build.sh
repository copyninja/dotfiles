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

./configure $BUILD_OPTIONS
make -j$(nproc)
sudo make install
