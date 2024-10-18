cmake_minimum_required(VERSION 3.0.2)
project(robot_frame_msgs)

find_package(catkin REQUIRED COMPONENTS message_generation std_msgs)

add_service_files(FILES UpdateFrame.srv)

generate_messages(DEPENDENCIES std_msgs)

catkin_package(CATKIN_DEPENDS message_runtime std_msgs)
