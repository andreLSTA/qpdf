FROM alpine:3.14.10

ARG QPDF_SHA512='c584b7443984b0f28eec2fbff054096b9a14a10858dda0c6b370d7a19e34c395ee15a8dc0770d3d85773281cd79944f029fb3bfad55833a2c32ff7e1a751c149'

RUN apk add --no-cache \
    build-base \
    gnupg \
    libstdc++ \
    icu \
    zlib-dev \
    jpeg-dev \
    bash


RUN cd /opt

RUN wget -O qpdf.tar.gz https://sourceforge.net/projects/qpdf/files/qpdf/10.6.3/qpdf-10.6.3.tar.gz/download  \
    && echo "${QPDF_SHA512}  qpdf.tar.gz" | sha512sum -c - \
    && tar -xzf qpdf.tar.gz \
    && cd qpdf-10.6.3 \
    && ./configure \
    && make \
    && make install \
    && cd /

CMD ["tail", "-f", "/dev/null"]