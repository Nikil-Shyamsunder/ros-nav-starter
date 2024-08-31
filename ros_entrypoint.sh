#!/bin/bash
set -e

# Source the ROS2 setup script
source /opt/ros/humble/setup.bash

# Execute the command passed to the entrypoint
exec "$@"
