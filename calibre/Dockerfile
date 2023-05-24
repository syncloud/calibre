FROM python:3.8-buster
ARG VERSION
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh  -s -- -y
RUN source "$HOME/.cargo/env"
RUN wget https://github.com/janeczku/calibre-web/releases/download/$VERSION/calibre-web-$VERSION.tar.gz
RUN tar xf calibre-web-$VERSION.tar.gz
RUN rm calibre-web-$VERSION.tar.gz
RUN mv calibre-web-$VERSION web
RUN wget https://github.com/janeczku/calibre-web/blob/master/library/metadata.db -O web/metadata.db
RUN cd web && pip install -r requirements.txt
RUN yes | rustup self uninstall
RUN rm -rf /var/lib/apt/lists/*
