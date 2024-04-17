#!/bin/bash

set -e

# Get hostname from enviromant variable
HOSTNAME=`env hostname`

echo "=================== Starting join cluster: $JOIN_CLUSTER_HOST for host: " $HOSTNAME ===================

/usr/local/bin/docker-entrypoint.sh rabbitmq-server &
sleep 5
rabbitmqctl wait /var/lib/rabbitmq/mnesia/rabbit\@$HOSTNAME.pid

# 第一次启动时，创建一个文件，用于判断是否已经启动过
CONTAINER_ALREADY_STARTED="CONTAINER_ALREADY_STARTED_PLACEHOLDER"
# 只有第一次启动需要加入集群，后续重启容器不需要加入集群
if [ ! -e $CONTAINER_ALREADY_STARTED ]; then
    touch $CONTAINER_ALREADY_STARTED
    echo "=================== $HOSTNAME first time start ==================="
    rabbitmqctl stop_app
    rabbitmqctl reset
    rabbitmqctl join_cluster rabbit@$JOIN_CLUSTER_HOST
    rabbitmqctl start_app
fi

# Keep foreground process active
tail -f /dev/null
