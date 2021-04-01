FROM osrf/ros:foxy-desktop

SHELL ["/bin/bash", "-c"]

RUN useradd -ms /bin/bash husarion && usermod -aG sudo husarion && echo 'husarion     ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER husarion
WORKDIR /home/husarion

# COPY --chown=husarion resources/keyboard /etc/default/keyboard

RUN sudo apt update && \
    DEBIAN_FRONTEND=noninteractive \
    sudo apt install -y \
    tigervnc-viewer && \
    sudo rm -rf /var/lib/apt/lists/*
    
COPY --chown=husarion resources/entrypoint.sh /home/husarion/

ENTRYPOINT ["/home/husarion/entrypoint.sh"]