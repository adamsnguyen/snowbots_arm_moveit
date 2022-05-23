#!/bin/bash
set -e

# setup ros environment
echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
source "/opt/ros/$ROS_DISTRO/setup.bash"

# start services
service dbus start
service bluetooth start

exec "$@"

