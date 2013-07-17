#!/bin/bash
VERSION_erppeek=1.4.5
DEPS_erppeek=(python erppeek unittest2)
URL_erppeek=http://pypi.python.org/packages/source/E/ERPpeek/ERPpeek-1.4.5.tar.gz
MD5_erppeek=bec4da87f1de66c2621b00e2f760cb74
BUILD_erppeek=$BUILD_PATH/erppeek/$(get_directory $URL_erppeek)
RECIPE_erppeek=$RECIPES_PATH/erppeek

function prebuild_erppeek() {
        true
}

function build_erppeek() {

        cd $BUILD_erppeek

        push_arm

        export LDFLAGS="$LDFLAGS -L$LIBS_PATH"
        export LDSHARED="$LIBLINK"
        export PYTHONPATH=$BUILD_hostpython/Lib/site-packages

        try $BUILD_hostpython/hostpython setup.py install -O2 --root=$BUILD_PATH/python-install --install-lib=lib/python2.7/site-packages

        unset LDSHARED

        pop_arm
}

function postbuild_erppeek() {
        true
}
