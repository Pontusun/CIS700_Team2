#include "ros/ros.h"
#include "std_msgs/Int32MultiArray.h"
#include "beginner_tutorials/Loc.h"
#include "std_msgs/Int8.h"
    

   void chatterCallback(const std_msgs::Int8::ConstPtr& msg)
   {
        ROS_INFO("Count: %d", msg->data);
   }


   void chatter2Callback(const std_msgs::Int32MultiArray::ConstPtr& array)
   {
        //ROS_INFO("Label: %d", array->data[0]);
   }

      void chatter3Callback(const beginner_tutorials::Loc::ConstPtr& Loc)
   {
        //ROS_INFO("label: %d", Loc->labels[0]);
   }


   int main(int argc, char **argv)
   {
     ros::init(argc, argv, "example1_c");
     ros::NodeHandle n;
     ros::Subscriber sub = n.subscribe("facecount", 1000, chatterCallback);
     ros::NodeHandle n2;
     ros::Subscriber sub2 = n2.subscribe("facelabel", 1000, chatter2Callback);
     ros::NodeHandle n3;
     ros::Subscriber sub3 = n3.subscribe("location", 1000, chatter3Callback);

     ros::spin();
     return 0;
}
