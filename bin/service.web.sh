#!/bin/bash -e

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd .. && pwd )
cd ${DIR}/calibre/web
export CALIBRE_UNIX_SOCKET=/var/snap/calibre/current/calibre.sock
exec ${DIR}/calibre/bin/python3 cps.py
