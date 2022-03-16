FROM ubuntu:20.04

ARG CERT_ADD
ARG NODE

RUN export DEBIAN_FRONTEND=noninteractive  &&  apt update && \
    apt install -y  wget curl nano


RUN mkdir /usr/share/elasticsearch
WORKDIR /usr/share/elasticsearch


RUN wget -O /tmp/elasticsearch.tar.gz  https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.17.1-linux-x86_64.tar.gz


RUN tar -xzf /tmp/elasticsearch.tar.gz --strip-components=1


#RUN tar -xzf /usr/share/elasticsearch.tar.gz  --strip-components=1

#RUN mv elasticsearch-7.17.1 elasticsearch

RUN echo $(grep $(hostname) /etc/hosts | cut -f1) node-1 >> /etc/hosts 

WORKDIR /usr/share/elasticsearch

#RUN mkdir -pv data/nodes/ && chmod -R 777 chown -R elasticsearch:elasticsearch data/nodes/ 

RUN groupadd elasticsearch && \
    useradd elasticsearch -g elasticsearch -p elasticsearch && \
    chown -R elasticsearch:elasticsearch /usr/share/elasticsearch && \
    chmod o+x /usr/share/ /usr/share/elasticsearch/ && \
    chgrp elasticsearch /usr/share/elasticsearch/ && \
    adduser elasticsearch root

RUN mkdir -pv data/nodes/ && chmod -R 777 data/nodes/ &&  chown -R elasticsearch:elasticsearch data/nodes/                        


#groupadd -g 1000 elasticsearch && \
#    adduser --uid 1000 --gid 1000 --home /usr/share/elasticsearch elasticsearch && \
#    adduser elasticsearch root && \
#    chown -R 0:0 /usr/share/elasticsearch


RUN echo $(grep $(hostname) /etc/hosts | cut -f1) node >> /etc/hosts
 
USER elasticsearch 


#RUN if [[ -z "$CERT_ADD" ]] ; new cert request is not demanded ; ./bin/elasticsearch-certutil cert --silent --pem --in /tmp/instances.yml -out certs/bundle.zip;; fi


CMD ./bin/elasticsearch



