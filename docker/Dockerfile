# This is an auto generated Dockerfile for ros:ros-core
# generated from docker_images/create_ros_core_image.Dockerfile.em
FROM ubuntu:bionic

# setup timezone
RUN echo 'Etc/UTC' > /etc/timezone && \
    ln -s /usr/share/zoneinfo/Etc/UTC /etc/localtime && \
    apt-get update && \
    apt-get install -q -y --no-install-recommends tzdata && \
    rm -rf /var/lib/apt/lists/*

# install packages
RUN apt-get update && apt-get install -q -y --no-install-recommends \
    dirmngr \
    gnupg2 \
    && rm -rf /var/lib/apt/lists/*

# setup sources.list
RUN echo "deb http://packages.ros.org/ros/ubuntu bionic main" > /etc/apt/sources.list.d/ros1-latest.list

# setup keys
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

# setup environment
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

ENV ROS_DISTRO melodic

# install ros packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-melodic-ros-core=1.4.1-0* \
    && rm -rf /var/lib/apt/lists/*

# Setting up source list
RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
RUN apt-get update

# Installing moveit packages
RUN apt install -y ros-melodic-moveit

# setup entrypoint
COPY ./ros_entrypoint.sh /

# Installing ROS Build stuff...
RUN apt-get update && sudo apt-get -y install build-essential
RUN apt install -y rviz python-rosdep ros-melodic-joy ros-melodic-joint-state-publisher vim \
    ros-melodic-robot-state-publisher ros-melodic-joystick-drivers ros-melodic-joy
RUN apt-get install -y bluez libusb-dev zip unzip dialog build-essential \
    pyqt4-dev-tools libusb-dev libbluetooth-dev python-dbus dbus


WORKDIR /workfiles/ros_arm_ws

COPY moveitjoy_module.py /opt/ros/kinetic/lib/python2.7/dist-packages/moveit_ros_visualization/moveitjoy_module.py

ENTRYPOINT ["/ros_entrypoint.sh"]
CMD ["bash"]