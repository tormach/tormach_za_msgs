int32                  active_queue
StatusPoseMsg          actual_position
bool                   adaptive_feed_enabled
float64[]              ain
float64[]              aout
StatusMotionAxisMsg[]  axis
bool                   block_delete
int32                  current_line
float64                current_vel
float64                delay_left
bool[]                 din
float64                distance_to_go
bool[]                 dout
StatusPoseMsg          dtg
bool                   enabled
bool                   feed_hold_enabled
bool                   feed_override_enabled
float64                feedrate
uint8                  g5x_index
uint32                 g5x_index_extended
StatusPoseMsg          g5x_offset
StatusPoseMsg          g92_offset
int32                  id
bool                   inpos
StatusPoseMsg          joint_actual_position
StatusPoseMsg          joint_position
int32[]                limit
int32                  motion_line
uint8                  motion_type
# enum EmcTrajectoryModeType
uint8                  motion_mode
bool                   paused
StatusPoseMsg          position
bool                   probe_tripped
int32                  probe_val
StatusPoseMsg          probed_position
bool                   probing
int32                  queue
bool                   queue_full
float64                rotation_xy
bool                   spindle_brake
int32                  spindle_direction
bool                   spindle_enabled
int32                  spindle_increasing
bool                   spindle_override_enabled
float64                spindle_speed
float64                spindlerate
# Current command execution status
uint8                  state
float64                max_velocity
float64                max_acceleration
float64                rapidrate
