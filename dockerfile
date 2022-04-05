FROM ubuntu:latest
MAINTAINER "https://github.com/Auhruz"
LABEL org.opencontainers.image.source https://github.com/auhruz/pathoftitans-docker-server
EXPOSE 7777/udp
RUN apt update && apt install wget libcurl4 sudo -y
RUN wget http://archive.ubuntu.com/ubuntu/pool/main/o/openssl1.0/libssl1.0.0_1.0.2n-1ubuntu5.8_amd64.deb && dpkg -i libssl1.0.0_1.0.2n-1ubuntu5.8_amd64.deb && rm libssl1.0.0_1.0.2n-1ubuntu5.8_amd64.deb
WORKDIR /opt/data
ENV username=""
ENV password=""
ENV guid=""
ENV branch="demo"
ENV port="7777"
ENV database="Local"
COPY ./startup.sh /opt/data/startup.sh
COPY ./potstart.sh /opt/data/potstart.sh
RUN useradd potserver && chmod +x /opt/data/ -R
CMD ["./startup.sh"]
