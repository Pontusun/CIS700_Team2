    #include "ros/ros.h"
    #include <sstream>
	#include "std_msgs/Int32MultiArray.h"

    int main(int argc, char **argv)
    {
     ros::init(argc, argv, "example1_a");
     ros::NodeHandle n;
     ros::Publisher chatter_pub = n.advertise<std_msgs::Int32MultiArray>("message", 1000);
     ros::Rate loop_rate(10);
     while (ros::ok())
     {

       std_msgs::Int32MultiArray msg;
       msg.data.clear();
       //ROS_INFO("%s", msg.data.c_str());
       msg.data.push_back(10);
       msg.data.push_back(20);
       chatter_pub.publish(msg);

       ROS_INFO("I published something!");
       ros::spinOnce();
       loop_rate.sleep();
}
return 0; 
}