#!/bin/bash -e
VERSION=$1

if [[ $(uname -m) == "armv7l" ]]; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh  -s -- -y
  source "$HOME/.cargo/env"
fi

wget https://github.com/janeczku/calibre-web/releases/download/$VERSION/calibre-web-$VERSION.tar.gz
tar xf calibre-web-$VERSION.tar.gz
rm calibre-web-$VERSION.tar.gz
mv calibre-web-$VERSION web
wget https://github.com/janeczku/calibre-web/blob/master/library/metadata.db -O web/metadata.db
wget https://raw.githubusercontent.com/linuxserver/docker-calibre-web/master/root/defaults/app.db -O web/app.db
cd web
pip install -r requirements.txt
pip install -r optional-requirements.txt

if [[ $(uname -m) == "armv7l" ]]; then
  yes | rustup self uninstall
fi
