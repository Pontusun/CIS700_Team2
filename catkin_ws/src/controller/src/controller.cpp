// ROS Packages
#include <ros/ros.h>
#include <hector_path_follower/hector_path_follower.h>
#include <hector_nav_msgs/GetRobotTrajectory.h>
#include <move_base_msgs/MoveBaseAction.h>
#include <actionlib/client/simple_action_client.h>
#include <geometry_msgs/Twist.h>
#include <geometry_msgs/PoseWithCovarianceStamped.h>
#include <nav_msgs/Odometry.h>
#include <std_msgs/String.h>
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

        //subscribers and publishers
        commandPub = nh.advertise < geometry_msgs::Twist > ("cmd_vel_mux/input/navi", 1);
        objectSub = nh.subscribe("caffe_ret", 1, &Controller::detectObject, this);
        amclSub = nh.subscribe("amcl_pose",1, &Controller::amclCallback,this);

        //clients
        exploration_plan_service_client_ = nh.serviceClient<hector_nav_msgs::GetRobotTrajectory>("get_exploration_path");
    	path_follower_.initialize(&tfl_);
        mb_ac = new MoveBaseClient("move_base", true); 
		while(!mb_ac->waitForServer(ros::Duration(5.0))) { 
  			ROS_INFO("Waiting for the move_base action server to come up"); 
  		}
	
    	//configurations
    	objectTargets.push_back("keyboard");
    	objectTargets.push_back("ball");
    	objectTargets.push_back("chair");

        //states 
    	detect_face = false;
    	detect_obj = false;
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
    
    // send a velocity command
    void move(double linear, double angular){
        geometry_msgs::Twist msg; // The default constructor will set all commands to 0
        msg.linear.x = linear;
        msg.angular.z = angular;
        commandPub.publish(msg);
    }

    // procedure for looking for object 
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

    // goal based navigation
    bool goal(std::vector<double> v){
        double x = v[0];
        double y = v[1];
        double yaw = v[2];

    	move_base_msgs::MoveBaseGoal goal;
    	goal.target_pose.header.frame_id = "/map"; //"base_link";
    	goal.target_pose.header.stamp = ros::Time::now();
    	goal.target_pose.pose.position.x = x;
    	goal.target_pose.pose.position.y = y;
    	goal.target_pose.pose.orientation = tf::createQuaternionMsgFromYaw(yaw);
  		//ROS_INFO("Sending a new goal to move_base x %lf y %lf yaw %lf", x, y, yaw);
  		this->mb_ac->sendGoal(goal);

        if (this->mb_ac->waitForResult(ros::Duration(10.0)) ){
            return true;
        };  
        this->mb_ac->cancelGoal();
        return false; 
    }

    double get_yaw(double x, double y, double w, double z){
        double yaw = asin(-2*(x*z - w*y));
        return yaw;
    }


/*
* Navigation Callbacks
*/
    void amclCallback(const geometry_msgs::PoseWithCovarianceStamped::ConstPtr& msg){
        ROS_INFO("reaching amcl callback");
        float x = msg->pose.pose.orientation.x;
        float y = msg->pose.pose.orientation.y;
        float z = msg->pose.pose.orientation.z;
        float w = msg->pose.pose.orientation.w;
        ROS_INFO("current_pose |  x: %lf, y: %lf, z: %lf, w: %lf", x, y, z, w);
    }

/*
* Vision Callbacks 
*/

    // TODO: Additional Vision subscribers  
    
    void detectObject(const std_msgs::String::ConstPtr& msg){
	   ROS_INFO("Vision callback");
	   ROS_INFO("Caffe says: [%s]", msg->data.c_str());
    	
        // extract information from message
    	std::string line;
    	std::string object;

    	line = msg->data.c_str();	
    	object = line.substr(line.find_first_of(" \t")+1);
    	
        //ROS_INFO_STREAM("Current CAFFE object: " << object);
    	for (int i =0; i<this->objectTargets.size(); i++) {
    		if (object.find(this->objectTargets[i])!= std::string::npos){
    			ROS_INFO_STREAM("FOUND: " << object);
    			this->detect_obj = true;
    		}
	   }    
    }



// Finite State Machine Loop
// spin() should be overloaded for each individual task controller
    
    void spin(){
        // initialize values 
        double explore_x = 2.0;
        double explore_y = -11.9994510184;
        double explore_w = 0.995189973514;
        double explore_z = -0.0979638536269;
        double explore_yaw = get_yaw(explore_x,explore_y,explore_w,explore_z);
        
        std::vector<double> homeBase;
        homeBase.push_back(2.40424320025);
        homeBase.push_back(1.33934123128);
        homeBase.push_back(3.3); 

        std::vector<double> exploreArea;
        exploreArea.push_back(2.0);
        exploreArea.push_back(-11.0);
        exploreArea.push_back(-1.4);
        
        this->state = 1;
        this->goto_Goal = exploreArea;

        ros::Rate rate(50);
        while (ros::ok()) {

            // go to exploration area 
            if (state == 1){
                bool result = goal(goto_Goal); 
                if (result == true && this->goto_Goal == homeBase){
                    ROS_INFO("Wiggles has returned to homebase");
                    ROS_INFO("exiting");
                    break;
                }

                if( result ){ // reached goal 
                    this->state = 2;
                }
            }
            
            // explore area for object
            if (state == 2){
                if( detect_obj == false){
                    this->navigationExplore();
                    this->lookForOjbect();
                }
                if (detect_obj == true){ // found object
                    this->state = 3;
                }
            }

            // wait and puase for 10 seconds
            if (state == 3){ 
                move(0.0,0.0);
                for (int i = 0; i<10; i++){
                    ros::Duration(1.0).sleep();
                    ROS_INFO("object found, waiting ...");
                }
                this->goto_Goal = homeBase;
                this->state = 1;
            }

    	    ros::spinOnce();
            rate.sleep();
        }
    }

protected:
	// publishers and subscribers 
	ros::Publisher commandPub; // Publisher to the simulated robot's velocity command topic
    ros::Publisher faceSub; // Publisher to face detection
	ros::Subscriber objectSub;
    ros::Subscriber amclSub; 
	
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
	std::vector<std::string> objectTargets;
	bool detect_face;
	bool detect_obj;
    int state;
    std::vector<double> goto_Goal;
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


