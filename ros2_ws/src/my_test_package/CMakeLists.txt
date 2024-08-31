cmake_minimum_required(VERSION 3.5)
project(my_test_package)

find_package(ament_cmake REQUIRED)
find_package(rclpy REQUIRED)
find_package(std_msgs REQUIRED)

install(PROGRAMS
  src/talker.py
  src/listener.py
  DESTINATION lib/${PROJECT_NAME}
)

ament_package()

