# syntax=docker/dockerfile:1.2

FROM ubuntu:22.04

ENV DEBIAN_FRONTEND noninteractive

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked apt update && \
    apt install -y --no-install-recommends wget ttf-mscorefonts-installer perl libfontconfig

WORKDIR /tmp

ARG TEXT_HOME_DIR=/home/texlive

RUN wget https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz && \
    tar xf ./install-tl-unx.tar.gz && \
    rm ./install-tl-unx.tar.gz && \
    cd ./install-tl-* && \
    perl ./install-tl --no-interaction --no-doc-install --no-src-install --texdir=${TEXT_HOME_DIR} && \
    cd - && \
    rm -r ./install-tl-*

ARG PLATRFORM=x86_64-linux

ENV PATH=${TEXT_HOME_DIR}/bin/${PLATRFORM}:$PATH
