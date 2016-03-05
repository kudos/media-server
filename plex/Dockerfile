FROM ubuntu:14.04

MAINTAINER Jonathan Cremin <jonathan@crem.in>

ENV DEBIAN_FRONTEND="noninteractive" \
    TERM="xterm"

RUN echo "force-unsafe-io" > /etc/dpkg/dpkg.cfg.d/02apt-speedup &&\
  echo "Acquire::http {No-Cache=True;};" > /etc/apt/apt.conf.d/no-cache && \
  apt-get update && \
  apt-get install -y wget jq && \
  VERSION=$(wget -qO- https://tools.linuxserver.io/latest-plexpass.json | jq -r .version) && \
  cd tmp; wget "https://downloads.plex.tv/plex-media-server/$VERSION/plexmediaserver_${VERSION}_amd64.deb" && \
  dpkg -i plexmediaserver_${VERSION}_amd64.deb && \
  apt-get -y remove wget && \
  apt-get -y autoremove && \
  apt-get -y clean && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /tmp/*

VOLUME ["/config","/data"]

ADD ./start.sh /start.sh
RUN chmod u+x  /start.sh

ENV RUN_AS_ROOT="true" \
    CHANGE_DIR_RIGHTS="false" \
    CHANGE_CONFIG_DIR_OWNERSHIP="true" \
    HOME="/config"

EXPOSE 32400

CMD ["/start.sh"]
