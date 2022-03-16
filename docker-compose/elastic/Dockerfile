FROM ubuntu:20.04

ARG PASSWORD=Test@1234
ARG VERSION=7.17.1

RUN export DEBIAN_FRONTEND=noninteractive  &&  apt update && \
    apt install -y  wget curl nano

RUN mkdir /usr/share/elasticsearch

WORKDIR /usr/share/elasticsearch

RUN wget -O /tmp/elasticsearch.tar.gz  https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-$VERSION-linux-x86_64.tar.gz

RUN tar -xzf /tmp/elasticsearch.tar.gz --strip-components=1

RUN echo $(grep $(hostname) /etc/hosts | cut -f1) node-1 >> /etc/hosts 

WORKDIR /usr/share/elasticsearch

RUN groupadd elasticsearch && \
    useradd elasticsearch -g elasticsearch -p elasticsearch && \
    chown -R elasticsearch:elasticsearch /usr/share/elasticsearch && \
    chmod o+x /usr/share/ /usr/share/elasticsearch/ && \
    chgrp elasticsearch /usr/share/elasticsearch/ && \
    adduser elasticsearch root


#COPY ./elasticsearch.yml  /usr/share/elasticsearch/config
 
USER elasticsearch 

RUN echo $PASSWORD | /usr/share/elasticsearch/bin/elasticsearch-keystore add -xf bootstrap.password

COPY ./elasticsearch.yml  /usr/share/elasticsearch/config

#RUN if [[ -z "$CERT_ADD" ]] ; new cert request is not demanded ; ./bin/elasticsearch-certutil cert --silent --pem --in /tmp/instances.yml -out certs/bundle.zip;; fi
CMD ./bin/elasticsearch

