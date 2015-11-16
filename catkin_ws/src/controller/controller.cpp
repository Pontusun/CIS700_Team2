

// Packages
#include <ros/ros.h>
#include <hector_path_follower/hector_path_follower.h>
#include <hector_nav_msgs/GetRobotTrajectory.h>
#include <move_base_msgs/MoveBaseAction.h>
#include <actionlib/client/simple_action_client.h>
#include "beginner_tutorials/Loc.h"

// Type Definitions
typedef actionlib::SimpleActionClient<move_base_msgs::MoveBaseAction> MoveBaseClient;

// Declarations for Helper Functions

// Controller Class
class Controller{
    
public:
    // constructor
    Controller(ros::NodeHandle& nh){
        //set up subscribers and publishers here (change callbacks)
        commandPub = nh.advertise < geometry_msgs::Twist > ("cmd_vel", 1);
        laserSub = nh.subscribe("base_scan", 1, &RandomWalk::commandCallback,this);
        occupSub = nh.subscribe("/map",1,&RandomWalk::occupantCallback,this);
        timer = nh.createTimer(ros::Duration(0.1), &RandomWalk::timerCallback,this);
    }
    
    // destructor
    ~Controller(){
        // delete clients
    }
    
//Write Callbacks here

    void navigationExplore(){

    }
    
    // send a velocity command
    void move(double linear, double angular){
        geometry_msgs::Twist msg; // The default constructor will set all commands to 0
        msg.linear.x = linearVelMPS;
        msg.angular.z = angularVelRadPS;
        commandPub.publish(msg);
    }


    void detectFace(){
        
    }

    void detectObject(){
        
    }

// Helper Functions
    
    

// Finite State Machine Loop
// spin() should be overloaded for each individual task controller
    
    void spin(){
        ros::Rate rate(50);
        while (ros::ok()) {
            // TODO: Fill in task logic here
            
            
            
            ros::spinOnce();
            rate.sleep();
        }
    }


// Declare member fields here
protected:
        ros::Publisher commandPub; // Publisher to the simulated robot's velocity command topic
        ros::Subscriber laserSub; // Subscriber to the simulated robot's laser scan topic
        enum FSM fsm; // Finite state machine for the random walk algorithm
        ros::Time rotateStartTime; // Start time of the rotation
        ros::Duration rotateDuration; // Duration of the rotation
        ros::Timer timer;
        ros::Subscriber occupSub; // OCCUPANCY GRID Subscriber
    
};


// Default Controller Node
int main(int argc, char **argv) {
    ros::init(argc, argv, "random_walk"); // Initiate new ROS node named "random_walk"
    ros::NodeHandle nh;
        
    Controller controller(nh); // Create default controller object
    controller.spin(); // Execute FSM loop
    return 0;
}

