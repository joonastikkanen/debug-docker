FROM ubuntu:20.04
ENV TZ=Europe/Helsinki
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt update && \
    apt install  -y openssh-client inetutils-ping curl wget sudo bind9-dnsutils inetutils-telnet mysql-client nano vim postgresql-client mongo-tools && \
    apt autoremove --yes && rm -rf /var/lib/{apt,dpkg,cache,log} 

RUN groupadd -g 1001 tiki && useradd -m -g 1001 tiki && echo "%tiki ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers 
USER tiki
WORKDIR /home/tiki
CMD ["tail", "-f", "/dev/null"]

