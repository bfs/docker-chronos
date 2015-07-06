# docker-chronos
Docker build for chronos based on the mesosphere deb package


### Starting

```bash
docker run --restart=always --name chronos -p 8081:8081 -m 1g -e MESOS_ZK=zk://pet100:2181,pet110:2181,pet120:2181/mesos -e CHRONOS_ZK=zk://pet100:2181,pet110:2181,pet120:2181 -e CHRONOS_HOSTNAME=`hostname` boritzio/docker-chronos
```

### This can (and should) be run on marathon with a config like this:

```javascript
{
  "id": "chronos",
  "container": {
    "type": "DOCKER",
    "docker": {
      "image": "boritzio/docker-chronos",
      "forcePullImage": true,
      "network": "HOST",
      "parameters": [
        { "key": "env", "value": "MESOS_ZK=zk://pet100:2181,pet110:2181,pet120:2181/mesos" },
        { "key": "env", "value": "CHRONOS_ZK=pet100:2181,pet110:2181,pet120:2181" },
        { "key": "env", "value": "MAIL_SERVER=smtp.myco.com:25" },
        { "key": "env", "value": "MAIL_FROM=chronos.tasks@myco.com" }
      ]
    }
  },
  "instances": 3,
  "cpus": 1,
  "mem": 1024,
  "ports": [4400],
  "healthChecks": [
    {
      "protocol": "HTTP",
      "portIndex": 0,
      "path": "/",
      "gracePeriodSeconds": 5,
      "intervalSeconds": 20,
      "maxConsecutiveFailures": 3
    }
  ]
}
```