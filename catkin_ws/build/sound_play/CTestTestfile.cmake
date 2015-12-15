# CMake generated Testfile for 
# Source directory: /home/genesis/code/ROS/catkin_ws/src/sound_play
# Build directory: /home/genesis/code/ROS/catkin_ws/build/sound_play
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
ADD_TEST(_ctest_sound_play_nosetests_scripts.test "/home/genesis/code/ROS/catkin_ws/build/catkin_generated/env_cached.sh" "/usr/bin/python" "/opt/ros/indigo/share/catkin/cmake/test/run_tests.py" "/home/genesis/code/ROS/catkin_ws/build/test_results/sound_play/nosetests-scripts.test.xml" "--return-code" "/usr/bin/cmake -E make_directory /home/genesis/code/ROS/catkin_ws/build/test_results/sound_play" "/usr/bin/nosetests-2.7 -P --process-timeout=60 --where=/home/genesis/code/ROS/catkin_ws/src/sound_play/scripts/test --with-xunit --xunit-file=/home/genesis/code/ROS/catkin_ws/build/test_results/sound_play/nosetests-scripts.test.xml")
SUBDIRS(test)
