FROM texlive/texlive:latest-with-cache

ENV DEBIAN_FRONTEND noninteractive

RUN apt update && \
    apt install -y software-properties-common && \
    DEBIAN_CODENAME=$(lsb_release -c | cut -f2) && \
    apt-add-repository "deb http://ftp.de.debian.org/debian $DEBIAN_CODENAME main contrib" && \
    apt update && \
    apt install -y ttf-mscorefonts-installer

WORKDIR /home/