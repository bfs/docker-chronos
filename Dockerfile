FROM boritzio/docker-mesosphere-base

ADD start_chronos.sh /usr/sbin/chronos

EXPOSE 8081

ENTRYPOINT /usr/sbin/chronos