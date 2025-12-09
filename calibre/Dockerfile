FROM python:3.12-slim-bookworm
ARG KEPUBIFY_ARCH
ARG VERSION
ADD ./build-calibre.sh /build/build-calibre.sh
RUN /build/build-calibre.sh $VERSION $KEPUBIFY_ARCH
RUN rm -rf /build
RUN rm -rf /var/lib/apt/lists/*
