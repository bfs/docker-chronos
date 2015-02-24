#!/bin/bash

#defaults
CHRONOS_ZK=${CHRONOS_ZK:-"localhost:2181"}
MESOS_ZK=${MESOS_ZK:-"zk://localhost:2181/mesos"}
CHRONOS_HOSTNAME=${CHRONOS_HOSTNAME:-${HOSTNAME:-${HOST:-`hostname`}}}
CHRONOS_HTTP_PORT=${CHRONOS_HTTP_PORT:-${PORT:-4400}}

java -Xmx512m -Djava.library.path=/usr/local/lib:/usr/lib64:/usr/lib -cp /usr/bin/chronos org.apache.mesos.chronos.scheduler.Main --zk_hosts $CHRONOS_ZK --master $MESOS_ZK --hostname $CHRONOS_HOSTNAME --http_port $CHRONOS_HTTP_PORT
