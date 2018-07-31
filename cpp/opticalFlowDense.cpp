/*
#+AUTHOR: Kunal Patel @ Swaayatt Robots
#+DATE: 2017 Nov 20
#+FUNCTION: To test different optical flow finding methods
#+COMPILE: g++ --std=c++14 -O3 -o ./a.out `pkg-config --cflags --libs opencv`
#+REFERENCES:
http://funvision.blogspot.in/2016/02/opencv-31-tutorial-optical-flow.html
https://docs.opencv.org/3.3.1/d7/d8b/tutorial_py_lucas_kanade.html
https://docs.opencv.org/3.3.1/dc/d6b/group__video__track.html
#+TIME: 
# calcOpticalFlowFarneback(old, img, flow, 0.4, 1, 12, 2, 8, 1.2, 0);
  # 270 ms, for 720x1280
  # 75 ms, 13 Hz for 360x640
*/

// constants definations
#define N_start   100
#define N_end     300
#define imgBase   "../152133/"
#define imgExt    ".png"
#define Rows      360
#define Cols      640

// includes
#include <iostream>
#include <string>
// #include <cmath>
#include <opencv2/opencv.hpp>

// Time functions
#include <chrono>
typedef std::chrono::high_resolution_clock::time_point timeVar;
#define duration(a) std::chrono::duration_cast<std::chrono::microseconds>(a).count()
#define freq(a) 1000000.0/duration(a)
#define timeNow() std::chrono::high_resolution_clock::now()


using namespace std;
using namespace cv;


void flow2bgr(cv::Mat flow, cv::Mat& bgr){

  //extraxt x and y channels
  cv::Mat xy[2]; //X,Y
  cv::split(flow, xy);

  //calculate angle and magnitude
  cv::Mat magnitude, angle;
  cv::cartToPolar(xy[0], xy[1], magnitude, angle, true);

  //translate magnitude to range [0;1]
  double mag_max;
  cv::minMaxLoc(magnitude, 0, &mag_max);
  magnitude.convertTo(magnitude, -1, 1.0 / mag_max);

  //build hsv image
  cv::Mat _hsv[3], hsv;
  _hsv[0] = angle;
  _hsv[1] = cv::Mat::ones(angle.size(), CV_32F);
  _hsv[2] = magnitude;
  cv::merge(_hsv, 3, hsv);

  //convert to BGR and show
  // cv::Mat bgr;//CV_32FC3 matrix
  cv::cvtColor(hsv, bgr, cv::COLOR_HSV2BGR);
}

void flow2xyz(cv::Mat flow, cv::Mat& rgb){
  cv::Mat xy[2], xyz[3];
  cv::split(flow, xy);
  xyz[0]= xy[0];
  xyz[1]= cv::Mat::zeros(xy[0].size(), CV_32F);
  xyz[2]= xy[1];
  cv::merge(xyz, 3, rgb);
}

void farneback(cv::Mat old, cv::Mat img, cv::Mat& flow){
  /*
    # calcOpticalFlowFarneback(old, img, flow, 0.4, 1, 12, 2, 8, 1.2, 0);
    # 270 ms, for 720x1280
    # 75 ms, 13 Hz for 360x640
  */

  timeVar t1, t2, t3;
  t1 = timeNow();
  // cv::UMat flowUmat;
  calcOpticalFlowFarneback(old, img, flow, 0.4, 1, 12, 2, 8, 1.2, 0);
  // flowUmat.copyTo(flow);
  t2 = timeNow();

  // Display functions from below
  cv::Mat rgb;
  flow2bgr(flow, rgb);
  t3 = timeNow();
  cout<< duration(t2-t1) << " + " << duration(t3-t2) << " = " << duration(t3-t1)<< endl;
  // cout<< 1000000.0/duration(t3-t1) << endl;
  cout<< freq(t2-t1) << " Hz" << endl;

  cv::imshow("img", rgb);
  int key = cv::waitKey(1);
  if (key == 27) exit(1);
}

int main(int argc, char ** argv){
  int n = N_start;
  string name = imgBase + to_string(n) + imgExt;
  n++;
  cout<< name << endl;
  cv::Mat old = cv::imread(name, 0);
  cv::resize(old, old, cv::Size(Cols,Rows));
  cv::Mat flow;

  for(; n<=N_end; n++){
    string name = imgBase + to_string(n) + imgExt;
    cv::Mat img = cv::imread(name, 0);
    cv::resize(img, img, cv::Size(Cols,Rows));
    cout<< name << endl;

    cv::Mat flow;// , rgb;
    farneback(old, img, flow);

    old = img;
  }

  return 0;
}
