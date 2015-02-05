# docker-chronos
Docker build for chronos based on the mesosphere deb package


### Starting

```bash
docker run --restart=on-failure:10 --name chronos -p 8081:8081 -m 1g -e MESOS_ZK=zk://pet100:2181,pet110:2181,pet120:2181/mesos -e CHRONOS_ZK=zk://pet100:2181,pet110:2181,pet120:2181 -e CHRONOS_HOSTNAME=`hostname` boritzio/docker-chronos
```