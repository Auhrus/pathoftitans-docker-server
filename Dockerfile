FROM ubuntu:latest

MAINTAINER "https://github.com/Auhrus"

LABEL org.opencontainers.image.source https://github.com/auhrus/pathoftitans-docker-server

ENV username=""
ENV password=""
ENV guid=""
ENV authtoken=""
ENV branch="production"
ENV port="7777"
ENV database="Local"
ENV additionalcommands=""

EXPOSE 7777/udp

RUN apt update && apt upgrade -y && apt install wget libcurl4 sudo -y

RUN wget -O libssl.deb http://archive.ubuntu.com/ubuntu/pool/main/o/openssl1.0/libssl1.0.0_1.0.2n-1ubuntu5.13_amd64.deb && dpkg -i libssl.deb && rm libssl.deb

COPY ./serverstart.sh /opt/data/serverstart.sh

RUN useradd potserver && chmod +x /opt/data/ -R && sed -i '17d' /etc/ssl/openssl.cnf

WORKDIR /opt/data
CMD ["./serverstart.sh"]