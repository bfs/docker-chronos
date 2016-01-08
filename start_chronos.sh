#!/bin/bash

#defaults
CHRONOS_ZK=${CHRONOS_ZK:-"localhost:2181"}
MESOS_ZK=${MESOS_ZK:-"zk://localhost:2181/mesos"}
CHRONOS_HOSTNAME=${CHRONOS_HOSTNAME:-${HOST:-`hostname`}}
CHRONOS_HTTP_PORT=${CHRONOS_HTTP_PORT:-${PORT:-8080}}
MAIL_SERVER=${MAIL_SERVER:-"localhost:25"}
MAIL_FROM=${MAIL_FROM:-"chronos@$CHRONOS_HOSTNAME"}

ARGS="--zk_hosts $CHRONOS_ZK --master $MESOS_ZK --hostname $CHRONOS_HOSTNAME --http_port $CHRONOS_HTTP_PORT --mail_server $MAIL_SERVER --mail_from $MAIL_FROM"

if [ -n "$MAIL_PASSWORD" ]; then
  ARGS="$ARGS --mail_password $MAIL_PASSWORD"
fi
if [ -n "$MAIL_USER" ]; then
  ARGS="$ARGS --mail_user $MAIL_USER"
fi
if [ -n "$MAIL_SSL" ]; then
  ARGS="$ARGS --mail_ssl"
fi

echo "Starting with args: $ARGS"

java -Xmx512m -Djava.library.path=/usr/local/lib:/usr/lib64:/usr/lib -cp /usr/bin/chronos org.apache.mesos.chronos.scheduler.Main $ARGS
