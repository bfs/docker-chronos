FROM boritzio/docker-mesosphere-base

RUN apt-get install -y chronos

EXPOSE 4400

ADD start_chronos.sh /etc/my_init.d/chronos.sh
