#!/bin/bash

VERSION_unittest2=0.5.1
URL_unittest2=https://pypi.python.org/packages/source/u/unittest2/unittest2-$VERSION_unittest2.tar.gz
DEPS_unittest2=(python)
MD5_unittest2=a0af5cac92bbbfa0c3b0e99571390e0f
BUILD_unittest2=$BUILD_PATH/unittest2/$(get_directory $URL_unittest2)
RECIPE_unittest2=$RECIPES_PATH/unittest2

function prebuild_unittest2() {
        true
}

function build_unittest2() {

        cd $BUILD_unittest2

        push_arm

        export LDFLAGS="$LDFLAGS -L$LIBS_PATH"
        export LDSHARED="$LIBLINK"
        export PYTHONPATH=$BUILD_hostpython/Lib/site-packages

        try $BUILD_hostpython/hostpython setup.py install -O2 --root=$BUILD_PATH/python-install --install-lib=lib/python2.7/site-packages

        unset LDSHARED

        pop_arm
}

function postbuild_unittest2() {
        true
}


