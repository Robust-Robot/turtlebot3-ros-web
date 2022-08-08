#! /usr/bin/env python
#coding=utf-8

#by Tiger@2022
import os
import subprocess
import rospy
from map_mng.srv import * # SaveMap,SaveMapRequest,SaveMapResponse

import urllib #.parse #https://www.urldecoder.io/python/
import json
import yaml

# returns output as byte string
# returned_output = subprocess.check_output(cmd)

# using decode() function to convert byte string to string
# print('Current date is:', returned_output.decode("utf-8"))

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

def loadMap(fn):
    # rosrun kill node map_server_node
    # do not need to kill node with the same name ,that will override it.
    # but I did.
    map_path="~/maps/"; #"/home/u18/maps/";
    # cmd_kill="rosrun kill map_server_node && "; #but if is the first time .node not exist!
    # so use ';' instead of '&&' (when previous is successful then execute the next)
    cmd_kill="rosrun kill map_server_node;"; # cmd_kill+cmd
    # now fn is full_path_name with '.pgm'
    cmd="rosrun map_server map_server __name:=map_server_node "+urllib.unquote(fn).replace(".pgm",".yaml");#+os.path.join(map_path,fn);
    returned_value = subprocess.call(cmd, shell=True);
    response = SaveMapResponse();
    response.result = returned_value;
    return response;

def saveMap(file_name): #(request):
    # file_name=request.file_name; # no extent-name (.yaml or .pgm)
    # reset
    result=0; # no err
    # save map to file;
    result=saveMap2File(file_name);
    response = SaveMapResponse();
    response.result = result;
    rospy.loginfo("request:%s,result:%d",file_name,result)

    return response

def sayOK(act,returned_value):
    response = SaveMapResponse();
    response.result = returned_value; #0
    rospy.loginfo("action request:%s,result:%d",act,returned_value)

    return response
def sayErr(act):
    response = SaveMapResponse();
    response.result = -1;
    rospy.loginfo("Not support action request:%s,result:%d",act,-1)

    return response

def gather_action(request):
    if request.action=='savemap':
        saveMap(request.params[0]);
    elif request.action=='loadmap':
        rospy.loginfo("request will load map %s",request.params[0]);
        loadMap(request.params[0]);
    elif request.action=='start':
        # start SLAM
        cmd="roslaunch turtlebot3_slam turtlebot3_slam.launch";
        returned_value = subprocess.call(cmd, shell=True);  # returns the exit code in unix
        sayOK(request.action,returned_value);
    elif request.action=='stop':
        # kill node (stop SLAM)
        cmd="rosnode kill /rviz";
        returned_value = subprocess.call(cmd, shell=True);  # returns the exit code in unix
        sayOK(request.action,returned_value);
    else:
        sayErr(request.action);
    # endif

if __name__ == "__main__":
    rospy.init_node("map_gather");
    rospy.loginfo("map gather service contains: a. gather start,b. gather stop, and c. save map. that will save maps to folder ~/maps");
    server= rospy.Service("MapGather",MapGather,gather_action)
    # server_json= rospy.Service("get_maps_json",GetMaps,getMap)
    rospy.loginfo("Map gathering service start.")
    rospy.spin()
