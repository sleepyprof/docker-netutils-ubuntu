FROM ubuntu 

LABEL maintainer="mail@gdietz.de"

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
      less \
      vim \
      jq \
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
      links \
      ldap-utils && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN npm install -g wscat

ENV WEBSOCAT_BASE_VERSION=v1.13.0
ENV WEBSOCAT_SHA1=44b69e35bf0adc361768ad3bb237f220c3a9be01

RUN cd $HOME && \
    curl -LO https://github.com/vi/websocat/releases/download/${WEBSOCAT_BASE_VERSION}/websocat.x86_64-unknown-linux-musl && \
    mv websocat.x86_64-unknown-linux-musl websocat && \
    sha1sum websocat | grep $WEBSOCAT_SHA1 && \
    chmod 755 websocat && \
    mv websocat /usr/bin/

