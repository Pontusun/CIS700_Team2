#include "ros/ros.h"
#include "std_msgs/Int32MultiArray.h"
    

   void chatterCallback(const std_msgs::Int32MultiArray::ConstPtr& array)
   {
        ROS_INFO("I heard: %d , %d", array->data[0],array->data[1]);
   }


   int main(int argc, char **argv)
   {
     ros::init(argc, argv, "example1_c");
     ros::NodeHandle n;
     ros::Subscriber sub = n.subscribe("message", 1000, chatterCallback);
     ros::spin();
     return 0;
}
