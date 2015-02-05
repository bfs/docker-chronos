#!/bin/bash
LIBPROCESS_PORT=8081
java -Xmx512m -Djava.library.path=/usr/local/lib:/usr/lib64:/usr/lib -cp /usr/bin/chronos com.airbnb.scheduler.Main --zk_hosts $CHRONOS_ZK --master $MESOS_ZK --hostname $CHRONOS_HOSTNAME --http_port 8081
