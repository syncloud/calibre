#!/bin/sh -ex

DIR=$( cd "$( dirname "$0" )" && pwd )
cd ${DIR}

BUILD_DIR=${DIR}/../build/snap/calibre
ls -la ${BUILD_DIR}/
ls -la ${BUILD_DIR}/lib*
ldd ${BUILD_DIR}/usr/local/bin/python3
${BUILD_DIR}/bin/python --version
${BUILD_DIR}/bin/python -c 'from wand.image import Image'
${BUILD_DIR}/bin/python -c 'import magic'
ls -la $BUILD_DIR/opt
#ls -la $BUILD_DIR/opt/calibre
ls -la $BUILD_DIR/bin
$BUILD_DIR/bin/unrar -version
$BUILD_DIR/usr/bin/kepubify --version
$BUILD_DIR/bin/ebook-convert --help
