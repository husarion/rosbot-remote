#!/bin/bash

image_to_run=rosbot_remote/rviz:latest

docker run --net=host --privileged --rm \
    --device=/dev/dri:/dev/dri \
    --env DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    $image_to_run
