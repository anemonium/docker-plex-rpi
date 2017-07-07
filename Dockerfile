#FROM debian:stretch
FROM armv7/armhf-ubuntu

RUN apt-get update && apt-get install -y curl less
RUN export DEBIAN_FRONTEND=noninteractive && curl -L -o /tmp/plex.deb https://dev2day.de/pms/pool/main/p/plexmediaserver-installer/plexmediaserver-installer_1.7.5.4035-313f93718-1_armhf.deb && dpkg -i /tmp/plex.deb
#RUN systemctl disable plexmediaserver
RUN update-rc.d -f plexmediaserver remove 

COPY files/start.sh /opt/start.sh
RUN chmod 755 /opt/start.sh

#ENTRYPOINT /usr/sbin/start_pms
ENTRYPOINT /opt/start.sh
