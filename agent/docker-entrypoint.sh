#!/bin/bash

# "m" option is for job control
set -exm

echo "[INFO] Starting Nginx"
# call default entrypoint of nginx with args
# from CMD in background mode
echo "$@"
/docker-entrypoint.sh "$@" &

# wait some time for master node
SLEEP_TIME=10
echo "Sleeping ${SLEEP_TIME}"
sleep ${SLEEP_TIME}

# test connection with master node
while [ $(nc -zv ${MASTER_NAME} 8301 2> /dev/null; echo $?) -ne 0 ]; do
  echo "Waiting Master Node ${MASTER_NAME} Connection"
  sleep 5
done

echo "[INFO] Starting Consul Agent"
# starting consul agent
consul agent \
  -config-dir=/etc/consul.d/ \
  -data-dir=/var/consul/ \
  -enable-script-checks=true \
  -node="${NODE_NAME}" \
  -bind="0.0.0.0" \
  -client="0.0.0.0" &

# wait some random time for agent, then join the cluster
SLEEP_TIME=$(($RANDOM % 20 + 10))
echo "Sleeping ${SLEEP_TIME}"
sleep ${SLEEP_TIME}

echo "Joining Master Node ${MASTER_NAME}"
consul join ${MASTER_NAME}

# return to previous job to get something on output channel
fg
