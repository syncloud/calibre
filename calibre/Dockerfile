FROM python:3.8-buster
ARG VERSION
RUN apt update
RUN apt install -y rustc
RUN wget https://github.com/janeczku/calibre-web/releases/download/$VERSION/calibre-web-$VERSION.tar.gz
RUN tar xf calibre-web-$VERSION.tar.gz
RUN rm calibre-web-$VERSION.tar.gz
RUN mv calibre-web-$VERSION web
RUN wget https://github.com/janeczku/calibre-web/blob/master/library/metadata.db -O web/metadata.db
RUN cd web && pip install -r requirements.txt
RUN apt remove -y rustc
RUN rm -rf /var/lib/apt/lists/*
