#! /usr/bin/env python
#coding=utf-8

import os
import rospy
from map_mng.srv import * # SaveMap,SaveMapRequest,SaveMapResponse

import json
import yaml

def saveMap2File(fn):
    map_path="~/maps/"; #"/home/u18/maps/";
    try:
        path_name=os.path.join(map_path,fn);
        rospy.loginfo("will save map to %s",path_name);
        cmd="rosrun map_server map_saver -f "+path_name;
        returned_value=os.system(cmd);
        rospy.loginfo("result= %d",returned_value);
        return returned_value;
    except:
        return -1;

def saveMap(request):
    file_name=request.file_name; # no extent-name (.yaml or .pgm)
    # reset
    result=0; # no err
    # save map to file;
    result=saveMap2File(file_name);
    response = SaveMapResponse();
    response.result = result;
    rospy.loginfo("request:%s,result:%d",file_name,result)

    return response

if __name__ == "__main__":
    rospy.init_node("savemap");
    rospy.loginfo("will save maps to folder ~/maps");
    server= rospy.Service("SaveMap",SaveMap,saveMap)
    # server_json= rospy.Service("get_maps_json",GetMaps,getMap)
    rospy.loginfo("save map service start.")
    rospy.spin()

