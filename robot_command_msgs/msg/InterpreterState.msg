# contains the current state of a RCL/RPL interpreter

# current state
uint8 STATE_UNDEFINED = 0
uint8 STATE_IDLE = 1
uint8 STATE_STOPPED = 2
uint8 STATE_RUNNING = 3
uint8 STATE_PAUSED = 4
uint8 STATE_PAUSED_ACTIVE = 5
uint8 STATE_RUNTIME_ERROR = 6
uint8 STATE_LOAD_ERROR = 7
uint8 state

# context information for the current state
uint8 CONTEXT_UNDEFINED = 0
uint8 CONTEXT_PROGRAM = 1
uint8 CONTEXT_MDI = 2
uint8 context
