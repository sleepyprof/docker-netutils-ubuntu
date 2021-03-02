FROM ubuntu 

LABEL maintainer="mail@gdietz.de"

ENV DEBIAN_FRONTEND=noninteractive

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

ENV WEBSOCAT_BASE_VERSION v1.7.0
ENV WEBSOCAT_VERSION 1.7.0_ssl1.1
ENV WEBSOCAT_SHA1 0cbfd5d93a32a0aa84d776b7572ab1d8084ffed2

RUN cd $HOME && \
    curl -LO https://github.com/vi/websocat/releases/download/${WEBSOCAT_BASE_VERSION}/websocat_${WEBSOCAT_VERSION}_amd64.deb && \
    sha1sum websocat_${WEBSOCAT_VERSION}_amd64.deb | grep $WEBSOCAT_SHA1 && \
    apt-get install -y $HOME/websocat_${WEBSOCAT_VERSION}_amd64.deb && \
    rm websocat_${WEBSOCAT_VERSION}_amd64.deb && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

