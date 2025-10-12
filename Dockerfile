FROM ubuntu:latest

LABEL maintainer="https://github.com/Auhrus"
LABEL org.opencontainers.image.source="https://github.com/auhrus/pathoftitans-docker-server"

ENV username=""
ENV password=""
ENV guid=""
ENV authtoken=""
ENV branch="production"
ENV port="7777"
ENV database="Local"
ENV additionalcommands=""

EXPOSE 7778 7780/tcp
EXPOSE 7777/udp

RUN apt update && apt install libcurl4 openssl wget -y && apt clean

COPY ./serverstart.sh /opt/data/serverstart.sh

RUN useradd potserver && chmod +x /opt/data/ -R

WORKDIR /opt/data
CMD ["./serverstart.sh"]