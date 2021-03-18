#!/bin/bash

image_to_run=rosbot_remote/rviz:latest 

docker run --net=host --privileged --rm \
--runtime=nvidia \
--env=NVIDIA_VISIBLE_DEVICES=all \
--env=NVIDIA_DRIVER_CAPABILITIES=all \
--env=QT_X11_NO_MITSHM=1 \
--env DISPLAY=$DISPLAY \
-v /tmp/.X11-unix:/tmp/.X11-unix \
$image_to_run