#include <ros/ros.h>
#include <image_transport/image_transport.h>
#include <cv_bridge/cv_bridge.h>
#include <sensor_msgs/image_encodings.h>
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/objdetect/objdetect.hpp>
#include <iostream>
#include <fstream>
#include <sstream>
#include <stdio.h>

#include <sys/types.h>
#include <sys/stat.h>

using namespace cv;
using namespace std;
static const std::string OPENCV_WINDOW = "Image window";

class ImageConverter
{
  ros::NodeHandle nh_;
  image_transport::ImageTransport it_;
  image_transport::Subscriber image_sub_;
  image_transport::Publisher image_pub_;
  // Set cascades
  string face_cascade_name;
  CascadeClassifier face_cascade;
  //set face vector
  std::vector<Rect> faces;  
  //set gray frame
  Mat frame_gray;
  string facedir;
  int index;
  int label;
  ofstream outFile;
 
public:
  ImageConverter()
    : it_(nh_)
  {

    index = 0;
    label = -1;
    nh_.getParam("label", label);
    ROS_INFO("label %d", label);

    face_cascade_name = "/home/genesis/code/ROS/catkin_ws/src/vision/face_detection/haarcascade_frontalface_alt2.xml";

    facedir = format("/home/genesis/code/ROS/catkin_ws/src/vision/face_recognition/src/face/face/%d",label);

    outFile.open("/home/genesis/code/ROS/catkin_ws/src/vision/face_recognition/src/face/face.csv",std::ofstream::app);
    
    // Load the cascades
    if( !face_cascade.load( face_cascade_name ) )
    {
      printf("--(!)Error loading\n");
    }
     
    //create now folder
    int status;
    status = mkdir(facedir.c_str(), S_IRWXU | S_IRWXG | S_IROTH | S_IXOTH);
    
    // Subscrive to input video feed and publish output video feed
    image_sub_ = it_.subscribe("/camera/image_raw", 1, 
      &ImageConverter::imageCb, this);
    image_pub_ = it_.advertise("/face_detection/output_video", 1);

   // cv::namedWindow(OPENCV_WINDOW);
  }

  ~ImageConverter()
  {
    cv::destroyWindow(OPENCV_WINDOW);
    outFile.close();  
  }

  static Mat norm_0_255(InputArray _src) {
    Mat src = _src.getMat();
    // Create and return normalized image:
    Mat dst;
    switch(src.channels()) {
    case 1:
        cv::normalize(_src, dst, 0, 255, NORM_MINMAX, CV_8UC1);
        break;
    case 3:
        cv::normalize(_src, dst, 0, 255, NORM_MINMAX, CV_8UC3);
        break;
    default:
        src.copyTo(dst);
        break;
    }
    return dst;
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
    face_cascade.detectMultiScale( frame_gray, faces, 1.05, 6, 0|CASCADE_SCALE_IMAGE, Size(30, 30) );


    
    //draw rectangle face on original image
      for( size_t i = 0; i < faces.size(); i++ ) 
      {  

        Mat face = frame_gray(faces[i]);
        Mat face_resized;
        cv::resize(face, face_resized, Size(92, 112), 1.0, 1.0, INTER_CUBIC);
        face_resized = norm_0_255(face_resized);
        imshow("face",face_resized);
	      rectangle(cv_ptr -> image, faces[i], CV_RGB(255,255,255),1);

        //add face to the folder
        imwrite(format("%s/%d.pgm", facedir.c_str(), index), face_resized);
        //write scv file
        outFile << facedir << "/" << index <<".pgm;" << label <<endl;  
        index++;
	if (index > 100){
	  exit(1);
	}
      }

 
    // Update GUI Window
   // cv::imshow(OPENCV_WINDOW, frame_gray);
    cv::waitKey(3);
    
    // Output modified video stream
    image_pub_.publish(cv_ptr->toImageMsg()); 
  }
};

int main(int argc, char** argv)
{
  ros::init(argc, argv, "face_detection");
  ImageConverter ic;
  ros::spin();
  return 0;
}


