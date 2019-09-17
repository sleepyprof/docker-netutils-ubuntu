FROM ubuntu 

LABEL maintainer="mail@gdietz.de"

RUN apt-get update && \
    apt-get install -y \
      less \
      vim \
      npm \
      iputils-ping \
      wget \
      curl \
      httpie \
      net-tools \
      telnet \
      dnsutils \
      iproute2 \
      nmap \
      tcpdump \
      links && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN npm install -g wscat

