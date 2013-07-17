#!/bin/bash
VERSION_mock=1.0.1
DEPS_mock=(pycrypto hostpython python)
URL_mock=http://pypi.python.org/packages/source/m/mock/mock-$VERSION_mock.tar.gz
MD5_mock=c3971991738caa55ec7c356bbc154ee2
BUILD_mock=$BUILD_PATH/mock/$(get_directory $URL_mock)
RECIPE_mock=$RECIPES_PATH/mock

function prebuild_mock() {
        true
}

function build_mock() {

        cd $BUILD_mock

        push_arm

        export LDFLAGS="$LDFLAGS -L$LIBS_PATH"
        export LDSHARED="$LIBLINK"
        export PYTHONPATH=$BUILD_hostpython/Lib/site-packages

        try $BUILD_hostpython/hostpython setup.py install -O2 --root=$BUILD_PATH/python-install --install-lib=lib/python2.7/site-packages

        unset LDSHARED

        pop_arm
}

function postbuild_mock() {
        true
}
