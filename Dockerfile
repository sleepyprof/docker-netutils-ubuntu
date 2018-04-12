FROM ubuntu 

RUN apt-get -y update \
  && apt-get install -y vim wget net-tools telnet dnsutils iproute nmap tcpdump links
  
