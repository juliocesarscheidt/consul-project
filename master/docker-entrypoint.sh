#!/bin/bash

# "m" option is for job control
set -exm

echo "[INFO] Starting Nginx"
# call default entrypoint of nginx with args
# from CMD in background mode
echo "$@"
/docker-entrypoint.sh "$@" &

echo "[INFO] Starting Consul Master"
# starting consul server
consul agent -server -ui \
  -bootstrap-expect=1 \
  -config-dir=/etc/consul.d/ \
  -data-dir=/var/consul/ \
  -enable-script-checks=true \
  -node="${NODE_NAME}" \
  -bind="0.0.0.0" \
  -client="0.0.0.0"
