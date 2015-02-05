FROM boritzio/docker-mesosphere-base

ADD start_chronos.sh /usr/sbin/chronos

EXPOSE 4400

ENTRYPOINT /usr/sbin/chronos