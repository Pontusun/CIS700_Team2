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

  string lbp_face_cascade_name;
  CascadeClassifier lbp_face_cascade;

  //set face vector
  std::vector<Rect> faces; 
  std::vector<Rect> lbp_faces;
  std::vector<Rect> real_faces;

 
  //set gray frame
  Mat frame_gray;
  string facedir;
  int index;
  int max_index;
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
    
    nh_.getParam("index", index);
    ROS_INFO("index %d", index);
    max_index = index + 100;
  
    face_cascade_name = "/home/genesis/code/ROS/catkin_ws/src/vision/face_detection/haarcascade_frontalface_alt2.xml";
    lbp_face_cascade_name = "/home/genesis/code/ROS/catkin_ws/src/vision/data/lbpcascades/lbpcascade_frontalface.xml";

    facedir = format("/home/genesis/code/ROS/catkin_ws/src/vision/face_recognition/src/face/face/%d",label);

    outFile.open("/home/genesis/code/ROS/catkin_ws/src/vision/face_recognition/src/face/face.csv",std::ofstream::app);
    
    // Load the cascades
    if( !face_cascade.load( face_cascade_name ) )
    {
      printf("--(!)Error loading\n");
    }
     
    if( !lbp_face_cascade.load( lbp_face_cascade_name ) )
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
    real_faces.clear();
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
  
    lbp_face_cascade.detectMultiScale( frame_gray, lbp_faces, 1.05, 5, 0|CASCADE_SCALE_IMAGE, Size(30, 30));   
    
      //reduce noise 
      for( size_t i = 0; i < faces.size(); i++ )
      {
         for( size_t j = 0; j < lbp_faces.size(); j++)
         {
             if ((faces[i].x + 0.5* faces[i].width) > lbp_faces[j].x
                    && (faces[i].x + 0.5* faces[i].width) < lbp_faces[j].x + lbp_faces[j].width
                        && (faces[i].y + 0.5* faces[i].height) > lbp_faces[j].y
                            && (faces[i].y + 0.5* faces[i].height) < lbp_faces[j].y + lbp_faces[j].height )

                real_faces.push_back(faces[i]);
               // cerr << faces[i].x<<endl;
         }
      }


    //draw rectangle face on original image
      for( size_t i = 0; i < real_faces.size(); i++ ) 
      {  

        Mat face = frame_gray(real_faces[i]);
        Mat face_resized;
        cv::resize(face, face_resized, Size(92, 112), 1.0, 1.0, INTER_CUBIC);
        face_resized = norm_0_255(face_resized);
        imshow("face",face_resized);
	      rectangle(cv_ptr -> image, real_faces[i], CV_RGB(255,255,255),1);

        //add face to the folder
        imwrite(format("%s/%d.pgm", facedir.c_str(), index), face_resized);
        //write scv file
        outFile << facedir << "/" << index <<".pgm;" << label <<endl;  
        index++;
	if (index > max_index){
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


