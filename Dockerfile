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

RUN npm install -g wscat && \
    npm cache clean

ENV WEBSOCAT_VERSION 1.5.0_ssl1.1
ENV WEBSOCAT_SHA1 495e326e237db63321a001cc25bdeb156b75c345

RUN cd $HOME && \
    curl -LO https://github.com/vi/websocat/releases/download/v1.5.0/websocat_${WEBSOCAT_VERSION}_amd64.deb && \
    sha1sum websocat_${WEBSOCAT_VERSION}_amd64.deb | grep $WEBSOCAT_SHA1 && \
    apt-get install -y $HOME/websocat_${WEBSOCAT_VERSION}_amd64.deb && \
    rm websocat_${WEBSOCAT_VERSION}_amd64.deb && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

