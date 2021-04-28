FROM osrf/ros:foxy-desktop

SHELL ["/bin/bash", "-c"]

RUN useradd -ms /bin/bash husarion && usermod -aG sudo husarion && echo 'husarion     ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER husarion
WORKDIR /home/husarion

RUN sudo apt update && \
    sudo apt install -y \
    ros-foxy-nav2-rviz-plugins \
    ros-foxy-rmw-cyclonedds-cpp \
    ros-foxy-gazebo-ros-pkgs && \
    sudo rm -rf /var/lib/apt/lists/*

RUN mkdir -p rosbot_ws/src && \
    cd rosbot_ws/src && \
    git clone https://github.com/husarion/rosbot_description --branch=foxy && \
    cd .. && \
    source /opt/ros/foxy/setup.bash && \
    colcon build

COPY --chown=husarion resources/entrypoint.sh /home/husarion/
COPY --chown=husarion resources/config.rviz /home/husarion/.rviz2/default.rviz

ENV NVIDIA_VISIBLE_DEVICES \
    ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES \
    ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics

ENTRYPOINT ["/home/husarion/entrypoint.sh"]