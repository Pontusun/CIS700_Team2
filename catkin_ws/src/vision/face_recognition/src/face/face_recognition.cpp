#include <ros/ros.h>
#include <image_transport/image_transport.h>
#include <cv_bridge/cv_bridge.h>
#include <sensor_msgs/image_encodings.h>
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/objdetect/objdetect.hpp>
#include "opencv2/contrib/contrib.hpp"
#include "opencv2/core/core.hpp"
#include <iostream>
#include <stdio.h>
#include <fstream>
#include <sstream>

using namespace cv;
using namespace std;

static const std::string OPENCV_WINDOW = "Image window";

class ImageConverter
{
private:
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
  //parameters for face recognition
  string fn_csv; 
  vector<Mat> images;
  vector<int> labels;
  int im_width;
  int im_height;
  Ptr<FaceRecognizer> model;


public:
  ImageConverter()
    : it_(nh_)
  {
    face_cascade_name = "/home/genesis/code/ROS/catkin_ws/src/vision/face_detection/haarcascade_frontalface_alt2.xml";
    
    // Load the cascades
    if( !face_cascade.load( face_cascade_name ) )
    {
      printf("--(!)Error loading\n");
    }
    
    fn_csv = "/home/genesis/code/ROS/catkin_ws/src/vision/face_recognition/src/face/attfaces10.csv";
    
    // Read in the data (fails if no valid input filename is given, but you'll get an error message):
    try {
        read_csv(fn_csv, images, labels);
    } catch (cv::Exception& e) {
        cerr << "Error opening file \"" << fn_csv << "\". Reason: " << e.msg << endl;
        // nothing more we can do
        exit(1);
    } 


    // Get the height from the first image. We'll need this
    // later in code to reshape the images to their original
    // size AND we need to reshape incoming faces to this size:
    im_width = images[0].cols;
    im_height = images[0].rows;
    
    cerr << "Start traing@!" << sizeof(images) <<endl;
    // Create a FaceRecognizer and train it on the given images:
     model = createEigenFaceRecognizer();
    // model = createLBPHFaceRecognizer();
    model->train(images, labels);
    cerr << "Train Complete" << labels[1] << endl; 
    // Subscrive to input video feed and publish output video feed
    image_sub_ = it_.subscribe("/camera/image_raw", 1, 
      &ImageConverter::imageCb, this);
    image_pub_ = it_.advertise("/face_recognition/output_video", 1);

   // cv::namedWindow(OPENCV_WINDOW);
  }

  ~ImageConverter()
  {
    cv::destroyWindow(OPENCV_WINDOW);
  }
  
  static void read_csv(const string& filename, vector<Mat>& images, vector<int>& labels, char separator = ';') {
    std::ifstream file(filename.c_str(), ifstream::in);
    if (!file) {
        string error_message = "No valid input file was given, please check the given filename.";
        CV_Error(CV_StsBadArg, error_message);
    }
    string line, path, classlabel;
    while (getline(file, line)) {
        stringstream liness(line);
        getline(liness, path, separator);
        getline(liness, classlabel);
        if(!path.empty() && !classlabel.empty()) {
            images.push_back(imread(path,0));
          
            labels.push_back(atoi(classlabel.c_str()));
        }
    }
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
    
    
    //face recognition
    for(int i = 0; i < faces.size(); i++) {
      // Process face by face:
      Rect face_i = faces[i];
      // Crop the face from the image. So simple with OpenCV C++:
      Mat face = frame_gray(face_i);
      //resize the face 
      Mat face_resized;
      cv::resize(face, face_resized, Size(im_width, im_height), 1.0, 1.0, INTER_CUBIC);   

      
      //set the threshold
      model->set("threshold", 0.0);
      // Now perform the prediction, see how easy that is:
      int prediction = -1;
      double confidence = 0.0;
      model->predict(face_resized, prediction, confidence);
      // cerr << "Confidence: "<< confidence << endl;
      // Create the text we will annotate the box with:
      string box_text = format("Prediction = %d", prediction);
      
      // Calculate the position for annotated text (make sure we don't
      // put illegal values in there):
      int pos_x = std::max(face_i.tl().x - 10, 0);
      int pos_y = std::max(face_i.tl().y - 10, 0);
      // And now put it into the image:
      putText(cv_ptr -> image, box_text, Point(pos_x, pos_y), FONT_HERSHEY_PLAIN, 1.0, CV_RGB(0,255,0), 2.0);
    }

 
    //draw rectangle face on original image
    for( size_t i = 0; i < faces.size(); i++ ) 
    {  
       rectangle(cv_ptr -> image, faces[i], CV_RGB(255,255,255),1);
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
  ros::init(argc, argv, "face_recognition");
  ImageConverter ic;
  ros::spin();
  return 0;
}

