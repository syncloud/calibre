#!/bin/bash -e
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd .. && pwd )
LIBS=${DIR}/usr/lib
${DIR}/lib/ld-*.so* --library-path $LIBS ${DIR}/usr/sbin/nginx "$@"
