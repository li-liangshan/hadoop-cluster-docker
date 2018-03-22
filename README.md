## Run Hadoop Cluster within Docker Containers

- Blog: [Run Hadoop Cluster in Docker Update](http://kiwenlau.com/2016/06/26/hadoop-cluster-docker-update-english/)
- 博客: [基于Docker搭建Hadoop集群之升级版](http://kiwenlau.com/2016/06/12/160612-hadoop-cluster-docker-update/)


![alt tag](https://raw.githubusercontent.com/kiwenlau/hadoop-cluster-docker/master/hadoop-cluster-docker.png)

**!!! Note that only hadoop-slave1 will be run in this forked project.**

### 3 Nodes Hadoop Cluster

##### 1. clone github repository

```
git clone https://github.com/neoremind/hadoop-cluster-docker
```

##### 2. create hadoop network

```
sudo docker network create --driver=bridge hadoop
```

##### 3. Create image locally

```
cd hadoop-cluster-docker && docker build -t xuzh/hadoop:1.0 .
```

##### 4. start docker container and login to hadoop-master

```
cd hadoop-cluster-docker
sudo ./start-container.sh
```

**output:**

```
start hadoop-master container...
start hadoop-slave1 container...
root@hadoop-master:~# 
```
- start 2 containers with 1 master and 1 slaves
- you will get into the /root directory of hadoop-master container

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