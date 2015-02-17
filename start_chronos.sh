#!/bin/bash

CHRONOS_ZK=${CHRONOS_ZK:-"localhost:2181"}
MESOS_ZK=${MESOS_ZK:-"zk://localhost:2181/mesos"}
HTTP_PORT=4400

java -Xmx512m -Djava.library.path=/usr/local/lib:/usr/lib64:/usr/lib -cp /usr/bin/chronos org.apache.mesos.chronos.scheduler.Main --zk_hosts $CHRONOS_ZK --master $MESOS_ZK --hostname $CHRONOS_HOSTNAME --http_port $HTTP_PORT
