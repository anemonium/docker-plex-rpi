FROM resin/rpi-raspbian:jessie

RUN [ "cross-build-start" ]

RUN apt-get update \
  && apt-get install -y curl less
RUN dpkg --add-architecture armhf
RUN export DEBIAN_FRONTEND=noninteractive && curl -L -o /tmp/plex.deb https://dev2day.de/files/plexmediaserver-installer_1.13.5.5291-6fa5e50a8-1_armhf.deb \ 
  && dpkg -i /tmp/plex.deb
  
#RUN systemctl disable plexmediaserver
RUN update-rc.d -f plexmediaserver remove 

COPY files/start.sh /opt/start.sh
RUN chmod 755 /opt/start.sh

#ENTRYPOINT /usr/sbin/start_pms
ENTRYPOINT /opt/start.sh

RUN [ "cross-build-end" ] 
