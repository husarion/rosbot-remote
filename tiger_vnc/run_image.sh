#!/bin/bash

if [ $# -eq 0 ]; then
  echo "ROSBOT IP address is required to launch vnc client! Aborting."
  exit
else
  echo "Conneting to xtigervncviewer $1:1"
  ROSBOT_IP=$1 
fi

docker run --net=host --privileged --rm \
--env=ROSBOT_IP=$1 \
--device=/dev/dri:/dev/dri \
--env=QT_X11_NO_MITSHM=1 \
--env DISPLAY=$DISPLAY \
-v /tmp/.X11-unix:/tmp/.X11-unix \
rosbot_remote/vnc_client:latest 