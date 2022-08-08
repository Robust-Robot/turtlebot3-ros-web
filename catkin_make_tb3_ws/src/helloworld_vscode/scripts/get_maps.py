#! /usr/bin/env python
#coding=utf-8

import os
import rospy

# 所有文件
fileList = []

if __name__ == "__main__":

    rospy.init_node("get_maps");
    rospy.loginfo("get maps from folder ~/maps");

    map_path="/home/u18/maps";
    files =os.listdir(map_path);
    for f in files:
        if (f[0] == '.'):
            pass
        else:
            if (os.path.isfile(map_path+'/'+f)):
                fileList.append(f)
                rospy.loginfo(f);
                #,'datetime=',os.path.getmtime(f))
            
