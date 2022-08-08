#include "ros/ros.h"

int main(int argc, char *argv[])
{
    //solve 中文乱码
    setlocale(LC_ALL,"");
    //or
    //setlocale(LC_CTYPE,"zh_CN.utf8");

    ros::init(argc,argv,"hello_c"); //ctrl+shift+k del line
    ROS:ROS_INFO("hello,zw中文乱码A");

    return 0;
}
