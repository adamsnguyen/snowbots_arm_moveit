#!/bin/bash
set -e

# setup ros environment
source /opt/ros/$ROS_DISTRO/setup.bash
rm -rf ./devel ./build
catkin_make
echo "source /workfiles/snowbots_arm/devel/setup.bash" >> ~/.bashrc
source /workfiles/snowbots_arm/devel/setup.bash

# start services
service dbus start
service bluetooth start

exec "$@"

