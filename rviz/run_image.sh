#!/bin/bash

if [ -z $1 ]; then
  echo "Defaulting to rosbot_remote/rviz"
  image_to_run=rosbot_remote/rviz:latest 
else
  image_to_run=$1
fi

docker run --net=host --privileged --rm \
--runtime=nvidia \
--env=NVIDIA_VISIBLE_DEVICES=all \
--env=NVIDIA_DRIVER_CAPABILITIES=all \
--env=QT_X11_NO_MITSHM=1 \
--env DISPLAY=$DISPLAY \
-v /tmp/.X11-unix:/tmp/.X11-unix \
$image_to_run