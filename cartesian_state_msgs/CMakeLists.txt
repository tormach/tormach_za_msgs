cmake_minimum_required(VERSION 3.0.2)
project(cartesian_state_msgs)

find_package(catkin REQUIRED COMPONENTS geometry_msgs message_generation
                                        sensor_msgs std_msgs)

add_service_files(FILES GetCurrentJointValues.srv GetCurrentPose.srv
                  GetPose.srv)

generate_messages(DEPENDENCIES geometry_msgs sensor_msgs std_msgs)

# Generate ROS catkin package
catkin_package(CATKIN_DEPENDS geometry_msgs message_runtime sensor_msgs
               std_msgs)
