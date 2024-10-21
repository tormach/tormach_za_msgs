cmake_minimum_required(VERSION 3.0.2)
project(movej_ik_server_msgs)

find_package(catkin REQUIRED COMPONENTS geometry_msgs message_generation
                                        std_msgs)

add_message_files(FILES ArmConfigs.msg IKSolverError.msg IKSolverWarning.msg)

add_service_files(FILES GetArmConfigService.srv MovejClosestIKService.srv
                  MovejUserIKService.srv SetArmConfigConstraintsService.srv)

generate_messages(DEPENDENCIES geometry_msgs std_msgs)

catkin_package(CATKIN_DEPENDS geometry_msgs message_runtime std_msgs)
