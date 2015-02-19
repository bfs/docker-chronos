#!/bin/bash

#defaults
CHRONOS_ZK=${CHRONOS_ZK:-"localhost:2181"}
MESOS_ZK=${MESOS_ZK:-"zk://localhost:2181/mesos"}
CHRONOS_HOSTNAME=${CHRONOS_HOSTNAME:-`hostname`}

#constants
HTTP_PORT=4400 #there are some bugs where chronos references other servers on the internal container port, so keeping this manual rather than setting via environment variables

java -Xmx512m -Djava.library.path=/usr/local/lib:/usr/lib64:/usr/lib -cp /usr/bin/chronos org.apache.mesos.chronos.scheduler.Main --zk_hosts $CHRONOS_ZK --master $MESOS_ZK --hostname $CHRONOS_HOSTNAME --http_port $HTTP_PORT
