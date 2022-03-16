#!/bin/bash

# Configure Bootstrap Password

BootstrapPassword="Test@1234"

while true
do
  curl --cacert /usr/share/kibana/certs/ca/ca.crt --fail -u "elastic:$BootstrapPassword" \
    "https://master:9200/_cluster/health?wait_for_status=yellow" \
    && break
  sleep 5
done

# Set passwords for various users
for User in "kibana" "logstash_system" "apm_system" "beats_system" "elastic"
do
  UserPassword=Test@1234
  curl --cacert /usr/share/kibana/certs/ca/ca.crt -u "elastic:${BootstrapPassword}" \
    -XPOST "https://master:9200/_xpack/security/user/${User}/_password" \
    -d'{"password":"'"${UserPassword}"'"}' -H "Content-Type: application/json"
  printf "%s=%s\n" "$User" "$UserPassword" >> passwords.txt
done
#cat passwords.txt
./bin/kibana --allow-root

