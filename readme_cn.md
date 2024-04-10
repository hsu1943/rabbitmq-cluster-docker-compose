## 介绍
使用docker-compose一键部署rabbitmq的集群，包括3个节点。

## 使用
1. 安装docker和docker-compose
2. 下载本项目

```shell
git clone git@github.com:hsu1943/rabbitmq-cluster-docker-compose.git
```
3. 配置stack.env中的环境变量

```env
# rabbitmq management 用户名和密码
RABBITMQ_DEFAULT_USER=admin
RABBITMQ_DEFAULT_PASS=admin

# rabbitmq 集群共用 cookie
RABBITMQ_ERLANG_COOKIE=rabbit-cookie

# 本目录路径
RABBITMQ_PATH=/docker-project/rabbitmq
```

4. 为脚本赋予执行权限

```shell
chmod +x ./join-cluster.sh
```

5. 启动
```shell
docker-compose --env-file ./stack.env up -d
```