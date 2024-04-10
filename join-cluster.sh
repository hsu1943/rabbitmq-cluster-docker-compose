#!/bin/bash

set -e

# Get hostname from enviromant variable
HOSTNAME=`env hostname`

echo "Starting join cluster: $JOIN_CLUSTER_HOST for host: " $HOSTNAME

/usr/local/bin/docker-entrypoint.sh rabbitmq-server &
sleep 5
rabbitmqctl wait /var/lib/rabbitmq/mnesia/rabbit\@$HOSTNAME.pid
rabbitmqctl stop_app

# 如果是--ram内存节点可以不用rabbitmqctl reset，默认启动disc磁盘节点则需要rabbitmqctl reset
# rabbitmqctl reset
rabbitmqctl join_cluster --ram rabbit@$JOIN_CLUSTER_HOST
rabbitmqctl start_app

# Keep foreground process active
tail -f /dev/null
