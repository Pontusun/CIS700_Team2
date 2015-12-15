// ROS Packages
#include <ros/ros.h>
#include <hector_path_follower/hector_path_follower.h>
#include <hector_nav_msgs/GetRobotTrajectory.h>
#include <move_base_msgs/MoveBaseAction.h>
#include <actionlib/client/simple_action_client.h>

// Messages 
#include <geometry_msgs/Twist.h>
#include <geometry_msgs/PoseWithCovarianceStamped.h>
#include <nav_msgs/Odometry.h>
#include <std_msgs/String.h>
#include <std_msgs/Float32MultiArray.h>

// #include "face_recognition/Loc.h"

// Libraries
#include <vector>
#include <math.h>
#include <deque>
#include <map>
#include <iostream>
#include <string>
#include <sstream>

// Type Definitions
typedef actionlib::SimpleActionClient<move_base_msgs::MoveBaseAction> MoveBaseClient;

// Function Declarations
map<std::string, std::vector<double> > coordinates();


// Controller Class
class Controller{
    
public:

    // constructor
    Controller(ros::NodeHandle& nh){

        //publishers
        commandPub = nh.advertise < geometry_msgs::Twist > ("cmd_vel_mux/input/navi", 1);
        //androidPub = nh.advertise < std_msgs::String>("android_fb", 1000);

        //subscribers
        amclSub = nh.subscribe("amcl_pose",1, &Controller::amclCallback,this);
        caffeSub = nh.subscribe("caffe_ret", 1, &Controller::caffeCallback, this);
        objectSub = nh.subscribe("objects", 1, &Controller::objectCallback, this);
        //androidSub = nh.subscribe("android_ui", &Controller::androidCallback, this);
        //faceSub = nh.subscribe("face_ret")
        
        //clients
        exploration_plan_service_client_ = nh.serviceClient<hector_nav_msgs::GetRobotTrajectory>("get_exploration_path");
    	path_follower_.initialize(&tfl_);
        mb_ac = new MoveBaseClient("move_base", true); 
		while(!mb_ac->waitForServer(ros::Duration(5.0))) { 
  			ROS_INFO("Waiting for the move_base action server to come up");
  		}

  		// controller members
  		fsm = GOTO; 
        detect_obj = false;
        detect_face = false;
        userInput = " "; 
    }
    
    // destructor
    ~Controller(){
        // delete clients
        delete mb_ac;
    }
    



/******************************
* Navigation API
*******************************/

    // Hector explore 
    void navigationExplore(){
    	//ROS_INFO("go to explore waypoint"); 

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
        ROS_INFO("waiting for goal to finish...");
        this->mb_ac->waitForResult(ros::Duration(10.0)); 
        this->mb_ac->cancelGoal(); 
    }
    
    void move(double linear, double angular){
        geometry_msgs::Twist msg; // The default constructor will set all commands to 0
        msg.linear.x = linear;
        msg.angular.z = angular;
        commandPub.publish(msg);
    }

    void lookForOjbect(){    
        ROS_INFO("searching for object ...");
        for (int i=0; i<20; i++){
            this->move(0.0,0.75);
            ROS_INFO("turning...");
    	    for (int j=0; j<5; j++){ // try to detect object 5 times on each turn
        		ros::spinOnce();
        		ros::Duration(0.3).sleep();
        		if (detect_obj == true){
        			return;
    		    }
		    }	
        }
	    ROS_INFO("finished looking...");
    }

    bool goal(std::vector<double> v){
        double x = v[0];
        double y = v[1];
        double yaw = v[2];

    	move_base_msgs::MoveBaseGoal goal;
    	goal.target_pose.header.frame_id = "/map"; 
    	goal.target_pose.header.stamp = ros::Time::now();
    	goal.target_pose.pose.position.x = x;
    	goal.target_pose.pose.position.y = y;
    	goal.target_pose.pose.orientation = tf::createQuaternionMsgFromYaw(yaw);
  		this->mb_ac->sendGoal(goal);
  		//ROS_INFO("Sending a new goal to move_base x %lf y %lf yaw %lf", x, y, yaw);

        if (this->mb_ac->waitForResult(ros::Duration(10.0)) ){
            return true;
        }
        this->mb_ac->cancelGoal();
        return false; 
    }

    double get_yaw(double x, double y, double w, double z){
        double yaw = asin(-2*(x*z - w*y));
        return yaw;
    }

    void getCoordinates(){

        // charitys office
        std::vector<double>(3) charity;
        charity.push_back(2.40424320025);
        charity.push_back(1.33934123128);
        charity.push_back(3.3); 

        // jeans office
        std::vector<double>(3) jean;
        jean.push_back(2.40424320025);
        jean.push_back(1.33934123128);
        jean.push_back(3.3); 

        // grasp
        std::vector<double>(3) grasp;
        grasp.push_back(2.40424320025);
        grasp.push_back(1.33934123128);
        grasp.push_back(3.3); 

        // vending machine
        std::vector<double>(3) vending;        
        vending.push_back(2.0);
        vending.push_back(-11.0);
        vending.push_back(-1.4);

        this->coordinates['grasp_lab'] = grasp;
        this->coordinates['charitys_office'] = charity;
        this->coordinates['jeans_office'] = jean;
        this->coordinates['vending_machine'] = vending;
    }


/*
* Callbacks
*/

    void amclCallback(const geometry_msgs::PoseWithCovarianceStamped::ConstPtr& msg){
        float x = msg->pose.pose.orientation.x;
        float y = msg->pose.pose.orientation.y;
        float z = msg->pose.pose.orientation.z;
        float w = msg->pose.pose.orientation.w;
        ROS_INFO("AMCL current_pose |  x: %lf, y: %lf, z: %lf, w: %lf", x, y, z, w);
    }
    
    void caffeCallback(const std_msgs::String::ConstPtr& msg){
	    ROS_INFO("Caffe says: [%s]", msg->data.c_str());
    	
        // extract information from message
    	std::string line;
    	std::string object;
    	line = msg->data.c_str();	
    	object = line.substr(line.find_first_of(" \t")+1);
    	
    	for (int i =0; i<this->objectTargets.size(); i++) {
    		if (object.find(this->objectTargets[i])!= std::string::npos){ // parse caffe message for item
    			ROS_INFO_STREAM("FOUND: " << object);
    			this->detect_obj = true;
    		}
	   }    
    }

    void objectCallback(const std_msgs::Float32MultiArray::ConstPtr& msg){
        ROS_INFO("FILL IN OBJECT CALLBACK");
    }

    void androidCallback(const std_msgs::String::ConstPtr& msg){
        this->userInput = msg->data.c_str();
    }

    void faceCallback(const std_msgs::Float32MultiArray::ConstPtr& msg){
    	ROS_INFO("FILL IN FACE CALLBACK");
    }

/******************
* Spin() for Tasks
******************/

    void spin_findObject(){
        
        // wait for user input  
        while(userInput.compare(" ") == 0){
            os::Duration(0.25).sleep();
            ros::spinOnce();
        }

        // parse input 
        std::istringstream iss(str1);
        std::string location;
        std::string object;
        iss >> location;
        iss >> object;

        // initialize variables
    	std::vector<double> navGoal = this->coordinates[location]; // [x,y,yaw]
        std::vector<double> homeBase = this->coordinates["grasp_lab"]; 
        this->objectTargets.push_back("keyboard");
        this->objectTargets.push_back("ball");
        this->objectTargets.push_back(object);
        bool result;
        
        // spin loop 
        this->fsm = GOTO;
        ros::Rate rate(50);
        while (ros::ok()) {
        	switch(fsm){

        		case GOTO : 
        			result = goal(navGoal);
        			if (result == true && navGoal == homeBase){
	                    ROS_INFO("Wiggles has returned to homebase");
	                    ROS_INFO("exiting");
	                    return;
                	}	

                	if (result){
                		this->fsm = EXPLORE;
                	}
        			break;

        		case EXPLORE : 
        			if( detect_obj == true){
        				this->fsm = WAIT;
        				break;
                	}
                	this->navigationExplore();
	                this->lookForOjbect();
        			break;

        		case WAIT :
        			move(0.0,0.0);
	                ROS_INFO("object found, waiting ...");
	                ros::Duration(10.0).sleep();
                	navGoal = homeBase;
                	this->fsm = GOTO;
        			break;  
        	}
        }

    	ros::spinOnce();
        rate.sleep();
    }

protected:
	// publishers and subscribers 
	ros::Publisher commandPub; // Publisher to the simulated robot's velocity command topic
    ros::Publisher faceSub; // Publisher to face detection
	//ros::Publisher androidPub;
    ros::Subscriber objectSub;
    ros::Subscriber amclSub;
	ros::Subscriber caffeSub;
	ros::Subscriber androidSub; 
	
	// hector navigation data members
	ros::ServiceClient exploration_plan_service_client_;
	ros::Publisher vel_pub_;
	tf::TransformListener tfl_;
	pose_follower::HectorPathFollower path_follower_;
	ros::Timer exploration_plan_generation_timer_;
	ros::Timer cmd_vel_generator_timer_;
	MoveBaseClient *mb_ac; 

	// controller members
	enum FSM {GOTO, EXPLORE, WAIT, FOLLOW};
	FSM fsm;
    bool detect_obj;
    bool detect_face;
    string userInput;
    std::vector<std::string> objectTargets;
    std::map<std::string,std::vector<double> > coordinates;


};


// Default Controller Node
int main(int argc, char **argv) {
    ros::init(argc, argv, "controller"); // Initiate new ROS node named "controller"
    ros::NodeHandle nh;
    Controller controller(nh); // Create default controller object
    controller.spin_findObject(); // Execute FSM loop
    return 0;
}


