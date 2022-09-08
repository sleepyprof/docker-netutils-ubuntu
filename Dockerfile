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

ENV WEBSOCAT_BASE_VERSION v1.9.0
ENV WEBSOCAT_SHA1 df105ab3cdd477acb6aac43fb564c743eb42d868

RUN cd $HOME && \
    curl -LO https://github.com/vi/websocat/releases/download/${WEBSOCAT_BASE_VERSION}/websocat_linux64 && \
    sha1sum websocat_linux64 | grep $WEBSOCAT_SHA1 && \
    chmod 755 websocat_linux64 && \
    mv websocat_linux64 /usr/bin/websocat

