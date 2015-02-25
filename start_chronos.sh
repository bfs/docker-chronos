#!/bin/bash

#defaults
export CHRONOS_ZK=${CHRONOS_ZK:-"localhost:2181"}
export MESOS_ZK=${MESOS_ZK:-"zk://localhost:2181/mesos"}
export CHRONOS_HOSTNAME=${CHRONOS_HOSTNAME:-${HOST:-`hostname`}}
export CHRONOS_HTTP_PORT=${CHRONOS_HTTP_PORT:-${PORT:-4400}}


echo "-------Chronos Host ENV Variables-------"
env
echo "----end Chronos Host ENV Variables----"

#LIBPROCESS_IP=$HOST
java -Xmx512m -Djava.library.path=/usr/local/lib:/usr/lib64:/usr/lib -cp /usr/bin/chronos org.apache.mesos.chronos.scheduler.Main --zk_hosts $CHRONOS_ZK --master $MESOS_ZK --hostname $CHRONOS_HOSTNAME --http_port $CHRONOS_HTTP_PORT
