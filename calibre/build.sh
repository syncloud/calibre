#!/bin/sh -ex

DIR=$( cd "$( dirname "$0" )" && pwd )
cd ${DIR}
BUILD_DIR=${DIR}/../build/snap/calibre
docker build --build-arg VERSION=$1 -t syncloud .
docker create --name=syncloud syncloud
mkdir -p ${BUILD_DIR}
cd ${BUILD_DIR}
docker export syncloud -o syncloud.tar
tar xf syncloud.tar
rm -rf syncloud.tar
cp ${DIR}/python ${BUILD_DIR}/bin/
ls -la ${BUILD_DIR}/bin
rm -rf ${BUILD_DIR}/usr/src
