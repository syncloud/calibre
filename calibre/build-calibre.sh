#!/bin/bash -e
VERSION=$1
KEPUBIFY_ARCH=$2
KEPUBIFY_VERSION=4.0.4

if [[ $(uname -m) == "armv7l" ]]; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh  -s -- -y
  source "$HOME/.cargo/env"
fi

apt update
apt install software-properties-common
apt-add-repository non-free
apt-get update
# build
apt-get install -y --no-install-recommends \
  build-essential \
  libldap2-dev \
  libsasl2-dev \
  python3-dev

# runtime
apt-get install -y --no-install-recommends \
  imagemagick \
  ghostscript \
  libnss3 \
  libsasl2-2 \
  libxcomposite1 \
  libxi6 \
  libxrandr2 \
  libxkbfile-dev \
  libxslt1.1 \
  libxtst6 \
  python3-minimal \
  python3-pip \
  python3-pkg-resources \
  unrar

wget https://github.com/janeczku/calibre-web/releases/download/$VERSION/calibre-web-$VERSION.tar.gz
tar xf calibre-web-$VERSION.tar.gz
rm calibre-web-$VERSION.tar.gz
mv calibre-web-$VERSION web
wget https://github.com/janeczku/calibre-web/blob/master/library/metadata.db -O web/metadata.db
wget https://raw.githubusercontent.com/linuxserver/docker-calibre-web/master/root/defaults/app.db -O web/app.db
cd web
pip install -r requirements.txt
pip install -r optional-requirements.txt

curl -o \
  /usr/bin/kepubify -L \
  https://github.com/pgaskin/kepubify/releases/download/${KEPUBIFY_VERSION}/kepubify-linux-${KEPUBIFY_ARCH}

if [[ $(uname -m) == "armv7l" ]]; then
  yes | rustup self uninstall
fi

# cleanup
apt-get -y purge \
  build-essential \
  libldap2-dev \
  libsasl2-dev \
  python3-dev
apt-get -y autoremove
rm -rf \
    /tmp/* \
    /var/lib/apt/lists/* \
    /var/tmp/* \
    /root/.cache