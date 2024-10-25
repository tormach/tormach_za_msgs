# Tormach ZA ROS 1 `*_msgs` packages

This distribution provides all ROS 1 interface (ROS topic, service and
action) definitions needed to connect a remote ZA robot.

Checked out into a ROS 1 workspace, this repo provides the custom
`*_msgs` ROS packages used in ZA controllers.  It also provides a
`vcstool` configuration to pull the ZA's customized `moveit_msgs`
package, and package dependencies for `rosdeps` to install remaining
standard interface packages.

Starting from an existing ROS 1 workspace, this `README` shows how to
install the interface packages, how to connect your workspace to the
ZA controller's ROS master, and where to find additional
documentation.

ROS 2 support is planned but currently not available.


## Install Tormach ZA support packages in a ROS 1 workspace

These instructions assume an existing ROS 1 workspace.

Check out this git repo under your workspace's `src/` directory.

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
