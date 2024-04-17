[English](./readme.md) | 简体中文

## 介绍
使用docker-compose一键部署rabbitmq的集群，包括3个节点。

## 使用
1. 安装docker和docker-compose
2. 下载本项目

```shell
git clone https://github.com/hsu1943/rabbitmq-cluster-docker-compose.git
```
3. 配置stack.env中的环境变量
复制一份stack.env.example，命名为stack.env

```shell
cp stack.env.example stack.env
```

具体配置：

```env
# rabbitmq management 用户名和密码
RABBITMQ_DEFAULT_USER=admin
RABBITMQ_DEFAULT_PASS=admin

# rabbitmq 集群共用 cookie
RABBITMQ_ERLANG_COOKIE=rabbit-cookie

# 本目录路径
RABBITMQ_PATH=.
```

4. 为脚本赋予执行权限

```shell
chmod +x ./join-cluster.sh
```

5. 启动
```shell
docker-compose --env-file ./stack.env up -d
```

登录 rabbitmq management：http://localhost:15672，可以看到3个节点的集群状态：
![rabbitmq-cluster](./images/rabbitmq-cluster.png)

## 参考
- [serkodev/rabbitmq-cluster-docker](https://github.com/serkodev/rabbitmq-cluster-docker)
- [RabbitMQ Clustering Guide](https://www.rabbitmq.com/clustering.html)
- [hub.docker.com/_/rabbitmq](https://hub.docker.com/_/rabbitmq)

## License
[MIT](./LICENSE)