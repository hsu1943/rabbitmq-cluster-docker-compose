## Introduction
Deploy a RabbitMQ cluster with one click using docker-compose, including 3 nodes.

## Usage
1. Install docker and docker-compose
2. Download this project

```shell
git clone git@github.com:hsu1943/rabbitmq-cluster-docker-compose.git
```
3. Configure the environment variables in stack.env

```env
# RabbitMQ management username and password
RABBITMQ_DEFAULT_USER=admin
RABBITMQ_DEFAULT_PASS=admin

# Shared cookie for RabbitMQ cluster
RABBITMQ_ERLANG_COOKIE=rabbit-cookie

# This directory path
RABBITMQ_PATH=/docker-project/rabbitmq
```
4. Grant execute permission to the script

```shell
chmod +x ./join-cluster.sh
```

5. Start

```shell
docker-compose --env-file ./stack.env up -d
```