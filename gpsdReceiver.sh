#!/bin/bash

# get GPS from router
#

/usr/bin/socat exec:"/data/gpsdReceiver/ext/gpsd/clients/gpspipe -r 172.16.42.3" pty,link=/dev/ttygps,raw,nonblock,echo=0,b115200 &
while [ `ps|grep gps_dbus|grep -v grep|wc -l` -eq 0 ]; do
  sleep 1
  /opt/victronenergy/gps-dbus/gps_dbus -s /dev/ttygps -b 115200 -t 0 &
done
