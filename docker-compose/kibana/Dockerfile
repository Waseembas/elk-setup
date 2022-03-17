FROM ubuntu:20.04

ARG PASSWORD=Test@1234
ARG VERSION=7.17.1

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


RUN wget -O /tmp/kibana.tar.gz  https://artifacts.elastic.co/downloads/kibana/kibana-7.17.1-linux-x86_64.tar.gz




RUN mkdir /usr/share/kibana
WORKDIR /usr/share/kibana

RUN tar -xzf /tmp/kibana.tar.gz --strip-components=1


WORKDIR /usr/share/kibana


COPY ./password.sh /usr/share/kibana/
COPY ./kibana.yml /usr/share/kibana/config
RUN chmod 777 password.sh 
#&& ./password.sh

 
#USER kibana

CMD ./bin/kibana

