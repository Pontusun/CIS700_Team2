#include <ros/ros.h>
#include <move_base_msgs/MoveBaseAction.h>
#include <actionlib/client/simple_action_client.h>
#include <tf/transform_listener.h>
#include <iostream>
#include "std_msgs/String.h"


typedef actionlib::SimpleActionClient<move_base_msgs::MoveBaseAction> MoveBaseClient;

class ExploreGoal {

public:
    ExploreGoal();
    void sendNewGoal();
    void getNewGoal();
    MoveBaseClient ac;

    // vision stuff 
    void visionCallback(const std_msgs::String::ConstPtr&);
    ros::NodeHandle n; 

private:

    double x;
    double y;
    double yaw;

    //void goalDoneCallback(const actionlib::SimpleClientGoalState &state, const move_base_msgs::MoveBaseResultConstPtr &result);
    //void goalActiveCallback();
    //void goalFeedbackCallback(const move_base_msgs::MoveBaseFeedbackConstPtr &feedback);

};

/* 
* constructor 
*/

ExploreGoal::ExploreGoal() : ac("move_base", true) {

  // connect to server 
  ROS_INFO("Waiting for the move_base action server to come up");
  if(!this->ac.waitForServer(ros::Duration(5.0)))
  {
      ROS_FATAL("Did you forget to launch the ROS navigation?");
      ROS_BREAK();
  }



}



/*
* Methods
*/

void ExploreGoal::sendNewGoal(){
  move_base_msgs::MoveBaseGoal goal;
  goal.target_pose.header.frame_id = "base_link";
  goal.target_pose.header.stamp = ros::Time::now();
  goal.target_pose.pose.position.x = this->x;
  goal.target_pose.pose.position.y = this->y;
  goal.target_pose.pose.orientation = tf::createQuaternionMsgFromYaw(this->yaw);

  ROS_INFO("Sending a new goal to move_base x %lf y %lf yaw %lf", x, y, yaw);
  this->ac.sendGoal(goal);
  }


void ExploreGoal::getNewGoal(){
  std::cout << "Please enter new goal: x y z" << std::endl;
  std::cout << "Example: 1.2 3.3 2.1" << std::endl;
  std::cin >> this->x;
  std::cin >> this->y;
  std::cin >> this->yaw;
}





// callbacks

/*
void ExploreGoal::goalDoneCallback(const actionlib::SimpleClientGoalState &state, const move_base_msgs::MoveBaseResultConstPtr &result)
{
    if(state.state_ == actionlib::SimpleClientGoalState::SUCCEEDED)
        ROS_INFO("The goal was reached!");

    if(state.state_ == actionlib::SimpleClientGoalState::ABORTED)
        ROS_WARN("Failed to reach the goal...");
}
*/

// function declarations
void visionCallback(const std_msgs::String::ConstPtr& msg);

int main(int argc, char** argv){
    
  ros::init(argc, argv, "simple_navigation_goals_demo");
  if (ros::ok()){std::cout<<"ROS is okay!";}
  ExploreGoal node;

  ros::Subscriber visionSubscriber = node.n.subscribe("location", 1000, visionCallback);
  ros::Rate loop_rate(10);

  while(ros::ok()){
    
    // demo
    /*
    node.getNewGoal();
    node.sendNewGoal();

    // wait for action to return
    /*
    bool finished_before_timeout = node.ac.waitForResult(ros::Duration(60.0));

    if (finished_before_timeout)
    {
      actionlib::SimpleClientGoalState state = node.ac.getState();
      ROS_INFO("Action finished: %s",state.toString().c_str());
    }
    
    else{
      ROS_INFO("Action did not finish before the time out.");
    }
    */

    ros::spinOnce();
    loop_rate.sleep();
  }



  // exit 
  ROS_INFO("ROS shutdown, exiting...");
  return 0;
}

// Additional notes 

// fancier goal send with call backs - implement later 
  /*
  ac.sendGoal(goal, boost::bind(&ExploreGoal::goalDoneCallback, this, _1, _2), 
                    boost::bind(&ExploreGoal::goalActiveCallback, this), 
                    boost::bind(&ExploreGoal::goalFeedbackCallback, this, _1));
  */

void visionCallback(const std_msgs::String::ConstPtr& msg)
{
  ROS_INFO("I heard: [%s]", msg->data.c_str());
}
