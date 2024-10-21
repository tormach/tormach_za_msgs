# Tormach ZA ROS 1 `*_msgs` packages

The `*_msgs` ROS packages in this tree contain the definitions for all
ROS interfaces used by Tormach ZA robots.  These may be used for
connecting a ZA robot to a remote ROS 1 workspace.

This `README` tells how to install them in a ROS 1 workspace, how to
connect to the ZA controller's ROS master, and provides pointers to
Tormach documentation.


## Install Tormach ZA support packages in a ROS 1 workspace

These instructions assume an existing ROS 1 workspace.

Check out this git repo into your workspace.

    git clone https://github.com/tormach/tormach_za_msgs src/tormach_za_msgs

Install the `vcs` tool if needed.

    sudo apt-get install python3-vcstool

Pull source dependencies into your workspace.  (Ignore 'detached HEAD'
messages.)

    vcs import src < src/tormach_za_msgs/za.repos.yaml

Install any missing package dependencies.

    rosdep install --from-paths src/tormach_za_msgs --ignore-src

Build and set up the ROS environment as you usually do.

    catkin build
    source devel/setup.bash


## Connect to the Tormach ZA robot

On the PathPilot robot UI, obtain the `ROS_MASTER_URI`, visible in the
lower-right corner, left of the "Exit" button.

Set the `ROS_MASTER_URI` environment variable in the remote ROS
workspace.  Example:

    export ROS_MASTER_URI=http://192.168.0.42:11311/

You should now be able to see the ROS nodes on the robot.

    rosnode list  # /move_group etc.


## Tormach ZA robot ROS interfaces

The [ZA knowledgebase "API access levels"][za_kb_api] article contains
some information about how to use the ZA robot ROS interfaces to
control the robot.  A few example are below.

### `hal_io`

The `hal_io` ROS node is a non-RT interface to robot controls:

- Digital I/O:  `/hal_io/digital_in_*` and `/hal_io/digital_out_*` topics
- Motor drive controls:  `/hal_io/state_cmd` and `/hal_io/state_fb` topics
  - Stop=1, Start=2, Home=3, Fault=4

### `robot_command`

The `robot_command` ROS node is the TRPL interpreter.

```
# Load a program file
rosservice call /robot_command/load_program \
    ~/nc_files/robot_programs/example_program.py
# Run the program; see src/robot_command_msgs/srv/RunCommand.srv
rosservice call -v /robot_command/run_command 2 # COMMAND_START
# Execute an MDI command
rosservice call -v /robot_command/execute_mdi "<MDI command>"
```

### MoveIt

The MoveIt interfaces are documented in the MoveIt project.  Tormach
has customized some messages; see their definitions in the
`moveit_msgs` package downloaded by the `vcstool` (see above).


[za_kb_api]: https://tormach.atlassian.net/wiki/spaces/ROBO/pages/2252374043/API+access+levels
