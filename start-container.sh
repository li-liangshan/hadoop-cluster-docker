#!/bin/bash

# the default node number is 2
N=${1:-2}


# start hadoop master container
docker rm -f hadoop-master &> /dev/null
echo "start hadoop-master container..."
docker run -itd \
                --net=hadoop \
                -p 50070:50070 \
                -p 8088:8088 \
                --name hadoop-master \
                --hostname hadoop-master \
                liliangshan/hadoop-2.7.2:1.0


# start hadoop slave container
i=1
while [ $i -lt $N ]
do
	docker rm -f hadoop-slave$i &> /dev/null
	echo "start hadoop-slave$i container..."
	docker run -itd \
	                --net=hadoop \
                    -p 8042:8042 \
                    -p 8090:8090 \
                    -p 8091:8091 \
                    -p 8190:8190 \
                    -p 8191:8191 \
	                --name hadoop-slave$i \
	                --hostname hadoop-slave$i \
	                liliangshan/hadoop-2.7.2:1.0
	i=$(( $i + 1 ))
done

# get into hadoop master container
docker exec -it hadoop-master bash
