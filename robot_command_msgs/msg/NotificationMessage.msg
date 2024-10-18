# notification message displayed on the GUI

# identification of Interface
uuid_msgs/UniqueID identifier
# notification type
uint8 TYPE_NOTIFICATION = 0
uint8 TYPE_WARNING = 1
uint8 TYPE_ERROR = 2
uint8 TYPE_USER_INPUT = 3
uint8 type
# message text
string message
# optional image path
string image_path
# whether the message is currently active or not
bool active
# default value for user input
string default
