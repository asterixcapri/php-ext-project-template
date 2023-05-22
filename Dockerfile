ARG DEBIAN_FRONTEND=noninteractive
ARG APTGET_ARGS="--no-install-recommends -y"

FROM debian:bullseye-slim
ARG DEBIAN_FRONTEND
ARG APTGET_ARGS

RUN apt-get update && apt-get $APTGET_ARGS install \
        build-essential \
        autoconf \
        automake \
        bison \
        flex \
        re2c \
        gdb \
        libtool \
        make \
        pkgconf \
        valgrind \
        git \
        libxml2-dev \
        libsqlite3-dev \
    && apt-get $APTGET_ARGS clean

RUN apt-get update && apt-get $APTGET_ARGS install \
        ca-certificates \
        procps \
        net-tools \
        dialog \
        sudo \
        telnet \
        ssh \
        wget \
        curl \
        bzip2 \
        unzip \
        vim \
        less \
        pv \
        diffutils \
        diffstat \
        patch \
    && apt-get $APTGET_ARGS clean

RUN useradd -u 1000 -G sudo -s /bin/bash -m dev \
    && echo root:dev | chpasswd \
    && echo dev:dev | chpasswd
