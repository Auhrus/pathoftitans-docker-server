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

HEALTHCHECK --interval=30s --timeout=3s --retries=2 CMD nc -zuvw2 127.0.0.1 7777 || exit 1

RUN apt update && apt install libcurl4 netcat-openbsd openssl wget -y && apt clean

COPY ./serverstart.sh /opt/data/serverstart.sh
COPY ./pot_restart_function.sh /opt/data/pot_restart_function.sh

RUN useradd potserver && chmod +x /opt/data/ -R

WORKDIR /opt/data
CMD ["./serverstart.sh"]