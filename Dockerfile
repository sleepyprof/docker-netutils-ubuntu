FROM ubuntu 

LABEL maintainer="mail@gdietz.de"

RUN apt-get -y update \
  && apt-get install -y less vim wget curl net-tools telnet dnsutils iproute2 nmap tcpdump links
  
