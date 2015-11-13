# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "snap_vision_msgs: 6 messages, 4 services")

set(MSG_I_FLAGS "-Isnap_vision_msgs:/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/msg;-Isensor_msgs:/opt/ros/indigo/share/sensor_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/indigo/share/geometry_msgs/cmake/../msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(snap_vision_msgs_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/msg/LabeledImage.msg" NAME_WE)
add_custom_target(_snap_vision_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "snap_vision_msgs" "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/msg/LabeledImage.msg" "snap_vision_msgs/BoundingBox:snap_vision_msgs/Detection:std_msgs/Header:sensor_msgs/Image"
)

get_filename_component(_filename "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/msg/Detection.msg" NAME_WE)
add_custom_target(_snap_vision_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "snap_vision_msgs" "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/msg/Detection.msg" "snap_vision_msgs/BoundingBox"
)

get_filename_component(_filename "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/srv/Models.srv" NAME_WE)
add_custom_target(_snap_vision_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "snap_vision_msgs" "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/srv/Models.srv" "snap_vision_msgs/Error"
)

get_filename_component(_filename "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/srv/Stream.srv" NAME_WE)
add_custom_target(_snap_vision_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "snap_vision_msgs" "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/srv/Stream.srv" "snap_vision_msgs/Error"
)

get_filename_component(_filename "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/msg/Error.msg" NAME_WE)
add_custom_target(_snap_vision_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "snap_vision_msgs" "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/msg/Error.msg" ""
)

get_filename_component(_filename "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/srv/Params.srv" NAME_WE)
add_custom_target(_snap_vision_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "snap_vision_msgs" "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/srv/Params.srv" "snap_vision_msgs/Error"
)

get_filename_component(_filename "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/msg/DetectionsStamped.msg" NAME_WE)
add_custom_target(_snap_vision_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "snap_vision_msgs" "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/msg/DetectionsStamped.msg" "snap_vision_msgs/BoundingBox:std_msgs/Header:snap_vision_msgs/Detection"
)

get_filename_component(_filename "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/srv/Detector.srv" NAME_WE)
add_custom_target(_snap_vision_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "snap_vision_msgs" "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/srv/Detector.srv" "snap_vision_msgs/Error"
)

get_filename_component(_filename "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/msg/DescriptorStamped.msg" NAME_WE)
add_custom_target(_snap_vision_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "snap_vision_msgs" "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/msg/DescriptorStamped.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/msg/BoundingBox.msg" NAME_WE)
add_custom_target(_snap_vision_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "snap_vision_msgs" "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/msg/BoundingBox.msg" ""
)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(snap_vision_msgs
  "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/msg/LabeledImage.msg"
  "${MSG_I_FLAGS}"
  "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/msg/BoundingBox.msg;/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/msg/Detection.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/sensor_msgs/cmake/../msg/Image.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/snap_vision_msgs
)
_generate_msg_cpp(snap_vision_msgs
  "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/msg/Detection.msg"
  "${MSG_I_FLAGS}"
  "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/msg/BoundingBox.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/snap_vision_msgs
)
_generate_msg_cpp(snap_vision_msgs
  "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/msg/Error.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/snap_vision_msgs
)
_generate_msg_cpp(snap_vision_msgs
  "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/msg/DetectionsStamped.msg"
  "${MSG_I_FLAGS}"
  "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/msg/BoundingBox.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/msg/Detection.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/snap_vision_msgs
)
_generate_msg_cpp(snap_vision_msgs
  "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/msg/DescriptorStamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/snap_vision_msgs
)
_generate_msg_cpp(snap_vision_msgs
  "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/msg/BoundingBox.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/snap_vision_msgs
)

### Generating Services
_generate_srv_cpp(snap_vision_msgs
  "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/srv/Params.srv"
  "${MSG_I_FLAGS}"
  "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/msg/Error.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/snap_vision_msgs
)
_generate_srv_cpp(snap_vision_msgs
  "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/srv/Detector.srv"
  "${MSG_I_FLAGS}"
  "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/msg/Error.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/snap_vision_msgs
)
_generate_srv_cpp(snap_vision_msgs
  "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/srv/Models.srv"
  "${MSG_I_FLAGS}"
  "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/msg/Error.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/snap_vision_msgs
)
_generate_srv_cpp(snap_vision_msgs
  "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/srv/Stream.srv"
  "${MSG_I_FLAGS}"
  "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/msg/Error.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/snap_vision_msgs
)

### Generating Module File
_generate_module_cpp(snap_vision_msgs
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/snap_vision_msgs
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(snap_vision_msgs_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(snap_vision_msgs_generate_messages snap_vision_msgs_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/msg/LabeledImage.msg" NAME_WE)
add_dependencies(snap_vision_msgs_generate_messages_cpp _snap_vision_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/msg/Detection.msg" NAME_WE)
add_dependencies(snap_vision_msgs_generate_messages_cpp _snap_vision_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/srv/Models.srv" NAME_WE)
add_dependencies(snap_vision_msgs_generate_messages_cpp _snap_vision_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/srv/Stream.srv" NAME_WE)
add_dependencies(snap_vision_msgs_generate_messages_cpp _snap_vision_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/msg/Error.msg" NAME_WE)
add_dependencies(snap_vision_msgs_generate_messages_cpp _snap_vision_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/srv/Params.srv" NAME_WE)
add_dependencies(snap_vision_msgs_generate_messages_cpp _snap_vision_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/msg/DetectionsStamped.msg" NAME_WE)
add_dependencies(snap_vision_msgs_generate_messages_cpp _snap_vision_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/srv/Detector.srv" NAME_WE)
add_dependencies(snap_vision_msgs_generate_messages_cpp _snap_vision_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/msg/DescriptorStamped.msg" NAME_WE)
add_dependencies(snap_vision_msgs_generate_messages_cpp _snap_vision_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/msg/BoundingBox.msg" NAME_WE)
add_dependencies(snap_vision_msgs_generate_messages_cpp _snap_vision_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(snap_vision_msgs_gencpp)
add_dependencies(snap_vision_msgs_gencpp snap_vision_msgs_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS snap_vision_msgs_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(snap_vision_msgs
  "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/msg/LabeledImage.msg"
  "${MSG_I_FLAGS}"
  "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/msg/BoundingBox.msg;/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/msg/Detection.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/sensor_msgs/cmake/../msg/Image.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/snap_vision_msgs
)
_generate_msg_lisp(snap_vision_msgs
  "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/msg/Detection.msg"
  "${MSG_I_FLAGS}"
  "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/msg/BoundingBox.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/snap_vision_msgs
)
_generate_msg_lisp(snap_vision_msgs
  "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/msg/Error.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/snap_vision_msgs
)
_generate_msg_lisp(snap_vision_msgs
  "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/msg/DetectionsStamped.msg"
  "${MSG_I_FLAGS}"
  "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/msg/BoundingBox.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/msg/Detection.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/snap_vision_msgs
)
_generate_msg_lisp(snap_vision_msgs
  "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/msg/DescriptorStamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/snap_vision_msgs
)
_generate_msg_lisp(snap_vision_msgs
  "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/msg/BoundingBox.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/snap_vision_msgs
)

### Generating Services
_generate_srv_lisp(snap_vision_msgs
  "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/srv/Params.srv"
  "${MSG_I_FLAGS}"
  "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/msg/Error.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/snap_vision_msgs
)
_generate_srv_lisp(snap_vision_msgs
  "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/srv/Detector.srv"
  "${MSG_I_FLAGS}"
  "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/msg/Error.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/snap_vision_msgs
)
_generate_srv_lisp(snap_vision_msgs
  "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/srv/Models.srv"
  "${MSG_I_FLAGS}"
  "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/msg/Error.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/snap_vision_msgs
)
_generate_srv_lisp(snap_vision_msgs
  "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/srv/Stream.srv"
  "${MSG_I_FLAGS}"
  "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/msg/Error.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/snap_vision_msgs
)

### Generating Module File
_generate_module_lisp(snap_vision_msgs
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/snap_vision_msgs
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(snap_vision_msgs_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(snap_vision_msgs_generate_messages snap_vision_msgs_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/msg/LabeledImage.msg" NAME_WE)
add_dependencies(snap_vision_msgs_generate_messages_lisp _snap_vision_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/msg/Detection.msg" NAME_WE)
add_dependencies(snap_vision_msgs_generate_messages_lisp _snap_vision_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/srv/Models.srv" NAME_WE)
add_dependencies(snap_vision_msgs_generate_messages_lisp _snap_vision_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/srv/Stream.srv" NAME_WE)
add_dependencies(snap_vision_msgs_generate_messages_lisp _snap_vision_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/msg/Error.msg" NAME_WE)
add_dependencies(snap_vision_msgs_generate_messages_lisp _snap_vision_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/srv/Params.srv" NAME_WE)
add_dependencies(snap_vision_msgs_generate_messages_lisp _snap_vision_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/msg/DetectionsStamped.msg" NAME_WE)
add_dependencies(snap_vision_msgs_generate_messages_lisp _snap_vision_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/srv/Detector.srv" NAME_WE)
add_dependencies(snap_vision_msgs_generate_messages_lisp _snap_vision_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/msg/DescriptorStamped.msg" NAME_WE)
add_dependencies(snap_vision_msgs_generate_messages_lisp _snap_vision_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/msg/BoundingBox.msg" NAME_WE)
add_dependencies(snap_vision_msgs_generate_messages_lisp _snap_vision_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(snap_vision_msgs_genlisp)
add_dependencies(snap_vision_msgs_genlisp snap_vision_msgs_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS snap_vision_msgs_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(snap_vision_msgs
  "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/msg/LabeledImage.msg"
  "${MSG_I_FLAGS}"
  "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/msg/BoundingBox.msg;/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/msg/Detection.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/sensor_msgs/cmake/../msg/Image.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/snap_vision_msgs
)
_generate_msg_py(snap_vision_msgs
  "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/msg/Detection.msg"
  "${MSG_I_FLAGS}"
  "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/msg/BoundingBox.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/snap_vision_msgs
)
_generate_msg_py(snap_vision_msgs
  "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/msg/Error.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/snap_vision_msgs
)
_generate_msg_py(snap_vision_msgs
  "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/msg/DetectionsStamped.msg"
  "${MSG_I_FLAGS}"
  "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/msg/BoundingBox.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/msg/Detection.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/snap_vision_msgs
)
_generate_msg_py(snap_vision_msgs
  "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/msg/DescriptorStamped.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/snap_vision_msgs
)
_generate_msg_py(snap_vision_msgs
  "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/msg/BoundingBox.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/snap_vision_msgs
)

### Generating Services
_generate_srv_py(snap_vision_msgs
  "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/srv/Params.srv"
  "${MSG_I_FLAGS}"
  "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/msg/Error.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/snap_vision_msgs
)
_generate_srv_py(snap_vision_msgs
  "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/srv/Detector.srv"
  "${MSG_I_FLAGS}"
  "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/msg/Error.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/snap_vision_msgs
)
_generate_srv_py(snap_vision_msgs
  "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/srv/Models.srv"
  "${MSG_I_FLAGS}"
  "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/msg/Error.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/snap_vision_msgs
)
_generate_srv_py(snap_vision_msgs
  "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/srv/Stream.srv"
  "${MSG_I_FLAGS}"
  "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/msg/Error.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/snap_vision_msgs
)

### Generating Module File
_generate_module_py(snap_vision_msgs
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/snap_vision_msgs
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(snap_vision_msgs_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(snap_vision_msgs_generate_messages snap_vision_msgs_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/msg/LabeledImage.msg" NAME_WE)
add_dependencies(snap_vision_msgs_generate_messages_py _snap_vision_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/msg/Detection.msg" NAME_WE)
add_dependencies(snap_vision_msgs_generate_messages_py _snap_vision_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/srv/Models.srv" NAME_WE)
add_dependencies(snap_vision_msgs_generate_messages_py _snap_vision_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/srv/Stream.srv" NAME_WE)
add_dependencies(snap_vision_msgs_generate_messages_py _snap_vision_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/msg/Error.msg" NAME_WE)
add_dependencies(snap_vision_msgs_generate_messages_py _snap_vision_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/srv/Params.srv" NAME_WE)
add_dependencies(snap_vision_msgs_generate_messages_py _snap_vision_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/msg/DetectionsStamped.msg" NAME_WE)
add_dependencies(snap_vision_msgs_generate_messages_py _snap_vision_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/srv/Detector.srv" NAME_WE)
add_dependencies(snap_vision_msgs_generate_messages_py _snap_vision_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/msg/DescriptorStamped.msg" NAME_WE)
add_dependencies(snap_vision_msgs_generate_messages_py _snap_vision_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/genesis/code/ROS/catkin_ws/src/snap_vision_msgs/msg/BoundingBox.msg" NAME_WE)
add_dependencies(snap_vision_msgs_generate_messages_py _snap_vision_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(snap_vision_msgs_genpy)
add_dependencies(snap_vision_msgs_genpy snap_vision_msgs_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS snap_vision_msgs_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/snap_vision_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/snap_vision_msgs
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(snap_vision_msgs_generate_messages_cpp sensor_msgs_generate_messages_cpp)

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/snap_vision_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/snap_vision_msgs
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(snap_vision_msgs_generate_messages_lisp sensor_msgs_generate_messages_lisp)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/snap_vision_msgs)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/snap_vision_msgs\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/snap_vision_msgs
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
add_dependencies(snap_vision_msgs_generate_messages_py sensor_msgs_generate_messages_py)
