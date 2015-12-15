#include <ros/ros.h>
#include <image_transport/image_transport.h>
#include <cv_bridge/cv_bridge.h>
#include <sensor_msgs/image_encodings.h>
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/objdetect/objdetect.hpp>
#include <iostream>
#include <stdio.h>
#include "std_msgs/Int8.h"

using namespace cv;
using namespace std;
static const std::string OPENCV_WINDOW = "Image window";

class ImageConverter
{
  ros::NodeHandle nh_;
  ros::NodeHandle n;
  image_transport::ImageTransport it_;
  image_transport::Subscriber image_sub_;
  image_transport::Publisher image_pub_;
  // Set cascades
  string face_cascade_name;
  CascadeClassifier face_cascade;
  
  string lbp_face_cascade_name;
  CascadeClassifier lbp_face_cascade;
  //set face vector
  std::vector<Rect> faces;
  std::vector<Rect> lbp_faces;
  std::vector<Rect> real_faces;
  //set gray frame
  Mat frame_gray;
  //ros message
  std_msgs::Int8 count;
  ros::Publisher facecount_pub; 
 
public:
  ImageConverter()
    : it_(nh_)
  {
    face_cascade_name = "/home/genesis/code/ROS/catkin_ws/src/vision/data/haarcascades/haarcascade_profileface.xml";
    lbp_face_cascade_name = "/home/genesis/code/ROS/catkin_ws/src/vision/data/lbpcascades/lbpcascade_profileface.xml";      

    
    // Load the cascades
    if( !face_cascade.load( face_cascade_name ) )
    {
      printf("--(!)Error loading\n");
    }
     if( !lbp_face_cascade.load( lbp_face_cascade_name ) )
    {
      printf("--(!)Error loading\n");
    }
    
    // Subscrive to input video feed and publish output video feed
    image_sub_ = it_.subscribe("/camera/image_raw", 1, 
      &ImageConverter::imageCb, this);
    image_pub_ = it_.advertise("/face_detection/output_video", 1);

    // publish something
    facecount_pub =n.advertise<std_msgs::Int8>("facecount", 1000);
    

   // cv::namedWindow(OPENCV_WINDOW);
  }

  ~ImageConverter()
  {
    cv::destroyWindow(OPENCV_WINDOW);
  }

  void imageCb(const sensor_msgs::ImageConstPtr& msg)
  {
    cv_bridge::CvImagePtr cv_ptr;
    try
    {
      cv_ptr = cv_bridge::toCvCopy(msg, sensor_msgs::image_encodings::BGR8);
    }
    catch (cv_bridge::Exception& e)
    {
      ROS_ERROR("cv_bridge exception: %s", e.what());
      return;
    }

    //convert to gray image
    cvtColor(cv_ptr->image, frame_gray, CV_BGR2GRAY );
    equalizeHist(frame_gray, frame_gray);
    
    //detect face
    face_cascade.detectMultiScale( frame_gray, faces, 1.05, 1, 0|CASCADE_SCALE_IMAGE, Size(30, 30) );
     lbp_face_cascade.detectMultiScale( frame_gray, lbp_faces, 1.05, 1, 0|CASCADE_SCALE_IMAGE, Size(30, 30) );
    
     real_faces.clear(); 
      //draw rectangle face on original image
      for( size_t i = 0; i < faces.size(); i++ ) 
      {  
	 rectangle(cv_ptr -> image, faces[i], CV_RGB(255,255,255),1);
      }
     
      for( size_t i = 0; i < lbp_faces.size(); i++ ) 
      {  
	 rectangle(cv_ptr -> image, lbp_faces[i], CV_RGB(255,0,0),1);
      }
      

	
      for( size_t i = 0; i < faces.size(); i++ ) 
      {  
	 for( size_t j = 0; j < lbp_faces.size(); j++) 
	 {
             if ((faces[i].x + 0.5* faces[i].width) > lbp_faces[j].x 
		    && (faces[i].x + 0.5* faces[i].width) < lbp_faces[j].x + lbp_faces[j].width
			&& (faces[i].y + 0.5* faces[i].height) > lbp_faces[j].y 
			    && (faces[i].y + 0.5* faces[i].height) < lbp_faces[j].y + lbp_faces[j].height )
		
		real_faces.push_back(faces[i]);
	 }
      }     
      /*
      for( size_t i = 0; i < real_faces.size(); i++ ) 
      {  
	 rectangle(cv_ptr -> image, real_faces[i], CV_RGB(255,255,255),1);
      }
      */

    // Update GUI Window
   // cv::imshow(OPENCV_WINDOW, frame_gray);
    cv::waitKey(3);
    
    // Output modified video stream
    image_pub_.publish(cv_ptr->toImageMsg()); 
    // publish ros messages
    count.data = faces.size();
    facecount_pub.publish(count);
  }
};

int main(int argc, char** argv)
{
  ros::init(argc, argv, "face_detection");
  ImageConverter ic;
  ros::spin();
  return 0;
}

