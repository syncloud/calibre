#!/bin/bash -e

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd .. && pwd )
cd ${DIR}/calibre/web
DATA_DIR=/var/snap/calibre/current
export CALIBRE_UNIX_SOCKET=$DATA_DIR/calibre.sock
export FLASK_DEBUG=true
export CALIBRE_DBPATH=$DATA_DIR
exec ${DIR}/calibre/bin/python cps.py -p $DATA_DIR/app.db
