    #include "ros/ros.h"
    #include <sstream>
	#include "std_msgs/Int32MultiArray.h"
	#include "beginner_tutorials/Num.h"

    int main(int argc, char **argv)
    {
     ros::init(argc, argv, "example1_a");
     ros::NodeHandle n;
     ros::Publisher chatter_pub = n.advertise<beginner_tutorials::Num>("message", 1000);
     ros::Rate loop_rate(10);
     while (ros::ok())
     {

       beginner_tutorials::Num msg;
       //ROS_INFO("%s", msg.data.c_str());
       msg.num = 10;
       chatter_pub.publish(msg);

       ROS_INFO("I published something!");
       ros::spinOnce();
       loop_rate.sleep();
}
return 0; 
}