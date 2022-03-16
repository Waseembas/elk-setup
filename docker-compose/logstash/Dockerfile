FROM ubuntu:20.04

ARG CERT_ADD
ARG NODE

#RUN which java

RUN for iter in {1..10}; do \
      export DEBIAN_FRONTEND=noninteractive && \
      apt-get update  && \
      apt-get upgrade -y  && \
      apt-get install -y --no-install-recommends \
       fontconfig fonts-liberation libnss3 libfontconfig1 ca-certificates curl wget && \
      apt-get clean && \
      rm -rf /var/lib/apt/lists/* && exit_code=0 && break || exit_code=$? && echo "apt-get error: retry $iter in 10s" && \
      sleep 10; \
    done; \
    (exit $exit_code)

#RUN which java

RUN wget -O /tmp/logstash.tar.gz  https://artifacts.elastic.co/downloads/logstash/logstash-7.17.1-linux-x86_64.tar.gz




RUN mkdir /usr/share/logstash
WORKDIR /usr/share/logstash

RUN tar -xzf /tmp/logstash.tar.gz --strip-components=1


WORKDIR /usr/share/logstash


COPY ./logstash.conf /usr/share/logstash/

WORKDIR /usr/share/logstash

RUN mkdir -pv /usr/share/logstash/config/config.d

COPY ./logstash.conf /usr/share/logstash/config/config.d/

RUN echo "- pipeline.id: main \n   path.config: "/usr/share/logstash/config/config.d/*.conf" " >>  config/pipelines.yml 


COPY  ./logstash.yml  config/logstash.yml


CMD ./bin/logstash -f config/config.d/logstash.conf 

