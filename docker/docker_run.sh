xhost +
killall -9 bluetoothd
docker run -it --net=host --privileged --device=/dev/ttyACM0 --device=/dev/ttyACM1 --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix --mount type=bind,source=$HOME/snowbots_arm_moveit,target=/workfiles ros_melodic_arm