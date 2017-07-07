#!/bin/bash

# delete pid
PLEX_PID="/root/Library/Application Support/Plex Media Server/plexmediaserver.pid"
[ -e "$PLEX_PID" ] && rm -f "$PLEX_PID"

# start plex
/usr/sbin/start_pms
