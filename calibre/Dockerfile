FROM python:3.8-buster
ARG VERSION
RUN wget https://github.com/janeczku/calibre-web/releases/download/$VERSION/calibre-web-$VERSION.tar.gz
RUN tar xf calibre-web-$VERSION.tar.gz
RUN rm calibre-web-$VERSION.tar.gz
RUN mv calibre-web-$VERSION web
RUN wget https://github.com/janeczku/calibre-web/blob/master/library/metadata.db web/metadata.db
RUN cd web && pip install -r requirements.txt
RUN rm -rf /var/lib/apt/lists/*
