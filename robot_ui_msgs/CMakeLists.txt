cmake_minimum_required(VERSION 3.16.0)
project(robot_ui_msgs)

find_package(catkin REQUIRED COMPONENTS message_generation std_msgs uuid_msgs)

add_message_files(FILES ActivePanel.msg Panels.msg)

add_service_files(FILES LockPanel.srv SwitchPanel.srv)

generate_messages(DEPENDENCIES std_msgs uuid_msgs)

catkin_package(CATKIN_DEPENDS message_runtime std_msgs uuid_msgs)
