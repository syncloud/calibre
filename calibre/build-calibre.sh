#!/bin/bash -e
DIR=$( cd "$( dirname "$0" )" && pwd )
cd ${DIR}

VERSION=$1
KEPUBIFY_ARCH=$2
KEPUBIFY_VERSION=4.0.4
BUILD_DIR=${DIR}/../build/snap/calibre

apt update
apt install -y curl wget
if [[ $(uname -m) == "armv7l" ]]; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh  -s -- -y
  source "$HOME/.cargo/env"
fi

sed -i 's/^Components: main$/& contrib non-free non-free-firmware/' /etc/apt/sources.list.d/debian.sources
apt update

# build
apt-get install -y --no-install-recommends \
  build-essential \
  libldap2-dev \
  libsasl2-dev \
  libxml2-dev \
  libxslt-dev \
  python3-dev \
  libssl-dev \
  cmake \
  ninja-build

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
  unrar \
  libmagickwand-dev \
  libmagic-dev

#mv /usr/lib/*-linux*/ImageMagick-*/modules-*/coders /usr/lib/ImageMagickCoders
mkdir /ImageMagick
cd /ImageMagick
ln -s ../usr/lib/*-linux-gnu* lib

#wget https://github.com/janeczku/calibre-web/releases/download/$VERSION/calibre-web-$VERSION.tar.gz
#tar xf calibre-web-$VERSION.tar.gz
#rm calibre-web-$VERSION.tar.gz
#mv calibre-web-$VERSION web

cd /
VERSION=master
wget https://github.com/cyberb/calibre-web/archive/refs/heads/$VERSION.tar.gz
tar xf $VERSION.tar.gz
rm $VERSION.tar.gz
mv calibre-web-$VERSION web

wget https://raw.githubusercontent.com/janeczku/calibre-web/master/library/metadata.db -O web/metadata.db
cd web
pip install -r requirements.txt
if [[ $(uname -m) == "armv7l" ]]; then
  sed -i '/python-Levenshtein.*/d' optional-requirements.txt
fi
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
  python3-dev \
  cmake \
  ninja-build
apt-get -y autoremove
rm -rf \
    /tmp/* \
    /var/lib/apt/lists/* \
    /var/tmp/* \
    /root/.cache

mkdir -p ${BUILD_DIR}
cp -r /bin ${BUILD_DIR}
cp -r /usr ${BUILD_DIR}
cp -r /lib* ${BUILD_DIR}
cp -r /web ${BUILD_DIR}
cp -r /ImageMagick ${BUILD_DIR}
cp ${DIR}/python ${BUILD_DIR}/bin/
rm -rf ${BUILD_DIR}/usr/src
