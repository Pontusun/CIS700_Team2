#include "opencv2/highgui/highgui.hpp"
#include "opencv2/objdetect/objdetect.hpp"
#include "opencv2/imgproc/imgproc.hpp"
#include <iostream>
#include <stdio.h>

using namespace cv;
using namespace std;

String face_cascade_name = "/home/parallels/Documents/opencv-2.4.10/haarcascade_frontalface_alt2.xml"; //
CascadeClassifier face_cascade;

int main(int argc, char* argv[])
{
	 //-- 1. Load the cascades
    if( !face_cascade.load( face_cascade_name ) )
    {
      printf("--(!)Error loading\n");
      return -1; 
    };

    VideoCapture cap; // open the video camera no. 0
    cap.open(0);

    if (!cap.isOpened())  // if not success, exit program
    {
        cout << "Cannot open the video cam" << endl;
        return -1;
    }

   double dWidth = cap.get(CV_CAP_PROP_FRAME_WIDTH); //get the width of frames of the video
   double dHeight = cap.get(CV_CAP_PROP_FRAME_HEIGHT); //get the height of frames of the video

    cout << "Frame size : " << dWidth << " x " << dHeight << endl;

    namedWindow("MyVideo",CV_WINDOW_AUTOSIZE); //create a window called "MyVideo"\

    Mat frame;
    Mat frame_gray;
    std::vector<Rect> faces;

    while (1)
    {
        bool bSuccess = cap.read(frame); // read a new frame from video

         if (!bSuccess) //if not success, break loop
        {
             cout << "Cannot read a frame from video stream" << endl;
             break;
        }

        cvtColor( frame, frame_gray, CV_BGR2GRAY ); //convert frame to grey frame
        equalizeHist( frame_gray, frame_gray );

        face_cascade.detectMultiScale( frame_gray, faces, 1.1, 2, 0|CASCADE_SCALE_IMAGE, Size(30, 30) );
       

          for( size_t i = 0; i < faces.size(); i++ )
          {
            Point center( faces[i].x + faces[i].width*0.5, faces[i].y + faces[i].height*0.5 );
            ellipse( frame, center, Size( faces[i].width*0.5, faces[i].height*0.5), 0, 0, 360, Scalar( 255, 0, 255 ), 4, 8, 0 );

          }

        imshow("MyVideo", frame); //show the frame in "MyVideo" window



        if (waitKey(5) == 27) //wait for 'esc' key press for 30ms. If 'esc' key is pressed, break loop
       {
            cout << "esc key is pressed by user" << endl;
            break; 
       }
    }
    return 0;

}
