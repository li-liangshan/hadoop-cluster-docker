## Run Hadoop Cluster within Docker Containers

- Blog: [Run Hadoop Cluster in Docker Update](http://kiwenlau.com/2016/06/26/hadoop-cluster-docker-update-english/)
- 博客: [基于Docker搭建Hadoop集群之升级版](http://kiwenlau.com/2016/06/12/160612-hadoop-cluster-docker-update/)


![alt tag](https://raw.githubusercontent.com/kiwenlau/hadoop-cluster-docker/master/hadoop-cluster-docker.png)

**!!! Note that only hadoop-slave1 will be run in this forked project.**

### Nodes Hadoop Cluster

##### 1. clone github repository

```
git clone https://github.com/neoremind/hadoop-cluster-docker
```

##### 2. create hadoop network

```
docker network create --driver=bridge hadoop
```

##### 3. Create image locally

```
cd hadoop-cluster-docker && docker build -t xuzh/hadoop:1.0 .
```

##### 4. start docker container and login to hadoop-master

```
cd hadoop-cluster-docker
./start-container.sh
```

**output:**

```
start hadoop-master container...
start hadoop-slave1 container...
root@hadoop-master:~# 
```
- start 2 containers with 1 master and 1 slaves
- you will get into the /root directory of hadoop-master container

you can check by running:
```
$ docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                                                                                        NAMES
e3f5ad6ebac0        xuzh/hadoop:1.0     "sh -c 'service ssh s"   7 hours ago         Up 7 hours          0.0.0.0:8042->8042/tcp, 0.0.0.0:8090-8091->8090-8091/tcp, 0.0.0.0:8190-8191->8190-8191/tcp   hadoop-slave1
c5c094753715        xuzh/hadoop:1.0     "sh -c 'service ssh s"   7 hours ago         Up 7 hours          0.0.0.0:8088->8088/tcp, 0.0.0.0:50070->50070/tcp                                             hadoop-master
```

##### 5. start hadoop

```
./start-hadoop.sh
```

##### 6. start job history server

```
./start-historyserver.sh
```

##### 7. configure /etc/hosts

add the following to /etc/hosts
```
127.0.0.1       hadoop-master
127.0.0.1       hadoop-slave1
```

##### 8. visit hadoop yarn resource manager

```
http://hadoop-master:8088
```

If you can open the page, then everything is done.