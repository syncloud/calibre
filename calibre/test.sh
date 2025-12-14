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

$BUILD_DIR/calibre/opt/calibre/ebook-converter --help
$BUILD_DIR/calibre/usr/bin/unrar --help
$BUILD_DIR/calibre/usr/bin/kepubify --help
