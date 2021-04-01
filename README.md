# rosbot_dockers

This repository contains docker images meant for remote controlling rosbot and rosbot_pro.

## Content

- `rviz image` automatically launches rviz2 with configuration suited for rosbot and navigation2 packages.
- `vnc client image` launches TigerVNC client that connects with rosbot server and allowes for remote access in graphical mode.

## Prerequisites

### Intel GPU
For Intel graphic card make sure you got mesa library installed 

Check if installed with:

```
glxinfo | grep Mesa
```

If not install with
```
sudo apt install mesa-utils
```

Building and running docker containers requires the docker to be installed on host computer. Docker can be installed using following instruction: https://docs.docker.com/engine/install/ubuntu/

Moreover, since we want the containers to launch GUI visible to host system nvidia-docker needs to be installed. Instructions can be found in Nvidia doc: https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html

## Rviz container 

Rviz container is an image build on top of `osrf/ros:foxy-desktop` image. It can be build by using `rviz/build_image.sh` and launched by `rviz/run_image.sh`. Default rviz2 configuration can be changed by replacing `rviz/resources/config.rviz` file and rebuilding the image.

Rviz container should be launched in the same network as rosbot running `navigation_demo`.

## VNC client container

VNC client container can be build with `tiger_vnc/build_image.sh` and lauched with `tiger_vnc/run_image.sh`. VNC server should be automatically launched on rosbot on startup. `run_image.sh` script requires rosbot IP address as a console argument eg. `run_image.sh 192.168.10.100`.

In case of any problems VNC connections are covered in this tutorial: https://husarnet.com/blog/remote-desktop-over-internet
