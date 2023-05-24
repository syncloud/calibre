FROM python:3.8-buster
ARG VERSION
ADD ./build-calibre.sh /build/build-calibre.sh
RUN /build/build-calibre.sh $VERSION
RUN rm -rf /build
RUN rm -rf /var/lib/apt/lists/*
