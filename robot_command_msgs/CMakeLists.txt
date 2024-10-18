cmake_minimum_required(VERSION 3.0.2)
project(robot_command_msgs)

find_package(catkin REQUIRED COMPONENTS message_generation std_msgs uuid_msgs)

add_message_files(FILES AcknowledgeNotification.msg InterpreterState.msg
                  NotificationMessage.msg ProgramPosition.msg)

add_service_files(
  FILES
  CheckReloadRequired.srv
  ExecuteMDI.srv
  LoadProgram.srv
  ReloadInterpreter.srv
  RunCommand.srv
  StartSubprogram.srv
  UnloadProgram.srv)

generate_messages(DEPENDENCIES uuid_msgs)

catkin_package(CATKIN_DEPENDS message_runtime std_msgs uuid_msgs)
