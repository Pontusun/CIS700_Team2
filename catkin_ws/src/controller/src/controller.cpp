
// ROS Packages
#include <ros/ros.h>
#include <hector_path_follower/hector_path_follower.h>
#include <hector_nav_msgs/GetRobotTrajectory.h>
#include <move_base_msgs/MoveBaseAction.h>
#include <actionlib/client/simple_action_client.h>
#include <geometry_msgs/Twist.h>
#include <nav_msgs/Odometry.h>
// #include "face_recognition/Loc.h"

// Libraries
#include <vector>
#include <math.h>
#include <deque>


// Type Definitions
typedef actionlib::SimpleActionClient<move_base_msgs::MoveBaseAction> MoveBaseClient;

// Controller Class
class Controller{
    
public:

    // constructor
    Controller(ros::NodeHandle& nh){
        //set up subscribers and publishers here (change callbacks)
        commandPub = nh.advertise < geometry_msgs::Twist > ("cmd_vel", 1);
        //faceSub = nh.subscribe("", 1, &Controller::detectFace, this);
        //laserSub = nh.subscribe("base_scan", 1, &Controller::commandCallback,this);
        //timer = nh.createTimer(ros::Duration(0.1), &Controller::timerCallback,this);
        
        
        //set up clients
        exploration_plan_service_client_ = nh.serviceClient<hector_nav_msgs::GetRobotTrajectory>("get_exploration_path");
    	path_follower_.initialize(&tfl_);
        mb_ac = new MoveBaseClient("move_base", true); 
		while(!mb_ac->waitForServer(ros::Duration(5.0))) { 
  			ROS_INFO("Waiting for the move_base action server to come up"); 
  		}
    }
    
    // destructor
    ~Controller(){
        // delete clients
        delete mb_ac;
    }
    

/*
* Navigation API
*/

    // SLAM exploration
    void navigationExplore(){
    	ROS_INFO("go to explore waypoint"); 

    	// get exploration plan
        hector_nav_msgs::GetRobotTrajectory srv_exploration_plan;
        if (this->exploration_plan_service_client_.call(srv_exploration_plan)){
          ROS_INFO("Generated exploration path with %u poses", (unsigned int)srv_exploration_plan.response.trajectory.poses.size());
          this->path_follower_.setPlan(srv_exploration_plan.response.trajectory.poses);
        }
        else{
          ROS_WARN("Service call for exploration service failed");
        }
    	
    	// execute plan through move base goal 
        move_base_msgs::MoveBaseGoal goal; 
        goal.target_pose.header.frame_id = "/map"; 
        goal.target_pose.header.stamp = ros::Time::now(); 
        goal.target_pose.pose = srv_exploration_plan.response.trajectory.poses[srv_exploration_plan.response.trajectory.poses.size()-1].pose; 
        ROS_INFO("sending goal"); 
        this->mb_ac->sendGoal(goal); 
        this->mb_ac->waitForResult(ros::Duration(10.0)); 
        this->mb_ac->cancelGoal(); 
    }
    
    // send a velocity command
    void move(double linear, double angular){
        geometry_msgs::Twist msg; // The default constructor will set all commands to 0
        msg.linear.x = linear;
        msg.angular.z = angular;
        commandPub.publish(msg);
    }

    // goal based navigation
    void goal(double x, double y, double yaw){
    	move_base_msgs::MoveBaseGoal goal;
    	goal.target_pose.header.frame_id = "base_link";
    	goal.target_pose.header.stamp = ros::Time::now();
    	goal.target_pose.pose.position.x = x;
    	goal.target_pose.pose.position.y = y;
    	goal.target_pose.pose.orientation = tf::createQuaternionMsgFromYaw(yaw);
  		ROS_INFO("Sending a new goal to move_base x %lf y %lf yaw %lf", x, y, yaw);
  		this->mb_ac->sendGoal(goal);
    }

/*
* Turtlebot Callbacks
*/

/*
* Vision Callbacks 
*/

/*
    void detectFace(const face_recognition::Loc::ConstPtr& msg){
    
    	if(msg->labels.size() > 0) { // face detected 
    		detect_face = true;
    		count = 0; 
    		ROS_INFO("I heard %f %f %f", msg->x[0], msg->y[0], msg->z[0]);

    		// TODO: record information
    		// global_msg.x.push_back(msg->x[0]);
		    // global_msg.y.push_back(msg->y[0]); 
    		// global_msg.z.push_back(msg->z[0]);    
    	}

    	else{
	    	count ++; 
	    	ROS_INFO("I heard nothing from face detection");
			if (count >= 10){
				detect_face = false;
				count = 0;
				ROS_INFO("Face detection counter is resetting.")
			}
		}
	} 
  
*/   
  
    // TODO: Additional Vision subscribers  
    /*
    void detectObject(const detect_Object::Loc::ConstPtr& msg){
    }
    void detectHuman(const detect_Human::Loc::ConstPtr& msg){
    }
    */


/* 
* Write Helper Functions
*/    

// Finite State Machine Loop
// spin() should be overloaded for each individual task controller
    
    void spin(){
        ros::Rate rate(50);
        while (ros::ok()) {
        	//this->navigationExplore();
		this->goal(1.0,0.0,0.0);

            // TODO: Fill in task logic here
                        
            ros::spinOnce();
            rate.sleep();
        }
    }

protected:
	// publishers and subscribers 
	ros::Publisher commandPub; // Publisher to the simulated robot's velocity command topic
	ros::Publisher faceSub; // Publisher to face detection
	ros::Subscriber laserSub; // Subscriber to the simulated robot's laser scan topic
	ros::Time rotateStartTime; // Start time of the rotation
	ros::Duration rotateDuration; // Duration of the rotation
	ros::Timer timer;

	// hector navigation data members
	ros::ServiceClient exploration_plan_service_client_;
	ros::Publisher vel_pub_;
	tf::TransformListener tfl_;
	pose_follower::HectorPathFollower path_follower_;
	ros::Timer exploration_plan_generation_timer_;
	ros::Timer cmd_vel_generator_timer_;
	MoveBaseClient *mb_ac; 

	// flags and states	
	//enum FSM state;
	bool detect_face;

};


// Default Controller Node
int main(int argc, char **argv) {
    ros::init(argc, argv, "controller"); // Initiate new ROS node named "controller"
    ros::NodeHandle nh;
    Controller controller(nh); // Create default controller object
    controller.spin(); // Execute FSM loop
    return 0;
}

/*
	enum FSM {
	EXPLORE; // explore environment until we have stimulus 
	MOVE; // go to goal point
	FACE_DET; // response to face detection
	OBJECT_DET; // response to object detection
	SCENE_RECOGNITION; // response to scene recognition
	RECOVERY; // recovery behavior 
}
*/


