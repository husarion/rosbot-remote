#!/bin/bash

source /opt/ros/foxy/setup.bash
export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp

ros2 run rviz2 rviz2