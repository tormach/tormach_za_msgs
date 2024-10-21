cmake_minimum_required(VERSION 3.0.2)
project(ros_machinetalk_msgs)
add_definitions(-std=c++11)

find_package(catkin REQUIRED COMPONENTS actionlib_msgs message_generation)

add_message_files(
  FILES
  Instance.msg
  Instances.msg
  StatusConfigAxisMsg.msg
  StatusConfigMsg.msg
  StatusIOMsg.msg
  StatusInterpMsg.msg
  StatusMotionAxisMsg.msg
  StatusMotionMsg.msg
  StatusMsg.msg
  StatusPoseMsg.msg
  StatusTaskMsg.msg
  StatusToolDataMsg.msg)

add_service_files(FILES AddUpdateNode.srv RemoveNode.srv)

add_action_files(FILES Command.action)

generate_messages(DEPENDENCIES actionlib_msgs)

catkin_package(CATKIN_DEPENDS actionlib_msgs message_runtime)
