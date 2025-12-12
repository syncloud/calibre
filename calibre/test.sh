#!/bin/sh -ex

DIR=$( cd "$( dirname "$0" )" && pwd )
cd ${DIR}

BUILD_DIR=${DIR}/../build/snap/calibre
ls -la ${BUILD_DIR}/
ls -la ${BUILD_DIR}/lib*
${BUILD_DIR}/bin/python --version
