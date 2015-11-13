# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "face_recognition: 1 messages, 0 services")

set(MSG_I_FLAGS "-Iface_recognition:/home/genesis/code/ROS/catkin_ws/src/vision/face_recognition/msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(face_recognition_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/genesis/code/ROS/catkin_ws/src/vision/face_recognition/msg/Loc.msg" NAME_WE)
add_custom_target(_face_recognition_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "face_recognition" "/home/genesis/code/ROS/catkin_ws/src/vision/face_recognition/msg/Loc.msg" ""
)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(face_recognition
  "/home/genesis/code/ROS/catkin_ws/src/vision/face_recognition/msg/Loc.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/face_recognition
)

### Generating Services

### Generating Module File
_generate_module_cpp(face_recognition
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/face_recognition
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(face_recognition_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(face_recognition_generate_messages face_recognition_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/genesis/code/ROS/catkin_ws/src/vision/face_recognition/msg/Loc.msg" NAME_WE)
add_dependencies(face_recognition_generate_messages_cpp _face_recognition_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(face_recognition_gencpp)
add_dependencies(face_recognition_gencpp face_recognition_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS face_recognition_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(face_recognition
  "/home/genesis/code/ROS/catkin_ws/src/vision/face_recognition/msg/Loc.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/face_recognition
)

### Generating Services

### Generating Module File
_generate_module_lisp(face_recognition
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/face_recognition
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(face_recognition_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(face_recognition_generate_messages face_recognition_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/genesis/code/ROS/catkin_ws/src/vision/face_recognition/msg/Loc.msg" NAME_WE)
add_dependencies(face_recognition_generate_messages_lisp _face_recognition_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(face_recognition_genlisp)
add_dependencies(face_recognition_genlisp face_recognition_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS face_recognition_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(face_recognition
  "/home/genesis/code/ROS/catkin_ws/src/vision/face_recognition/msg/Loc.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/face_recognition
)

### Generating Services

### Generating Module File
_generate_module_py(face_recognition
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/face_recognition
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(face_recognition_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(face_recognition_generate_messages face_recognition_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/genesis/code/ROS/catkin_ws/src/vision/face_recognition/msg/Loc.msg" NAME_WE)
add_dependencies(face_recognition_generate_messages_py _face_recognition_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(face_recognition_genpy)
add_dependencies(face_recognition_genpy face_recognition_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS face_recognition_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/face_recognition)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/face_recognition
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(face_recognition_generate_messages_cpp std_msgs_generate_messages_cpp)

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/face_recognition)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/face_recognition
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(face_recognition_generate_messages_lisp std_msgs_generate_messages_lisp)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/face_recognition)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/face_recognition\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/face_recognition
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
add_dependencies(face_recognition_generate_messages_py std_msgs_generate_messages_py)
