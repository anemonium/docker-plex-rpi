#FROM debian:stretch
FROM croc/debian-rpi:stretch

RUN apt-get update && apt-get install -y curl less
RUN export DEBIAN_FRONTEND=noninteractive && curl -L -o /tmp/plex.deb https://downloads.plex.tv/plex-media-server/1.13.5.5291-6fa5e50a8/plexmediaserver-ros6-binaries-annapurna_1.13.5.5291-6fa5e50a8_armel.deb && dpkg -i /tmp/plex.deb
#RUN systemctl disable plexmediaserver
RUN update-rc.d -f plexmediaserver remove 

COPY files/start.sh /opt/start.sh
RUN chmod 755 /opt/start.sh

#ENTRYPOINT /usr/sbin/start_pms
ENTRYPOINT /opt/start.sh
