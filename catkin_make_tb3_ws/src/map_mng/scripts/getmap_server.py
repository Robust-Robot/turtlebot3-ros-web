#! /usr/bin/env python
#coding=utf-8

import os
import rospy
from map_mng.srv import * #GetMaps,GetMapsRequest,GetMapsResponse

import json
import yaml

def read_map_file(fname):
    rospy.loginfo('read yaml file:%s',fname);
    try:
        yaml_dat="";
        with open(fname,'r') as f:
            lines= f.readlines() ;
            count=0;
            for line in lines:
                # empty line
                if (len(line)<5):
                    continue;

                if (count>0):
                    yaml_dat+=',';
                yaml_dat+='"'+line.replace('\n','').replace(':','":"')+'"';
                count+=1;
            return '{'+yaml_dat+'}';
    except Exception as e:
        # 'module' object has no attribute 'FullLoader'
        # 版本低于5.1，pip install PyYAML==5.1
        # rospy.loginfo(yaml.__version__);

        rospy.loginfo('err read .yaml file:%s',str(e));
        return '{}';

# err
def read_yaml_file(fname):
    rospy.loginfo('read yaml file:%s',fname);
    try:
        with open(fname,'r') as f: #, encoding="utf-8"
            yaml_dat= yaml.safe_load_all(f) ;# yaml.load(f,Loader=yaml.FullLoader); 
            return yaml_dat;
    except Exception as e:
        # 'module' object has no attribute 'FullLoader'
        # 版本低于5.1，pip install PyYAML==5.1
        rospy.loginfo(yaml.__version__);

        rospy.loginfo('err read .yaml file:%s',str(e));
        return {};

def msg2json(msg):
    ''' Convert a ROS message to JSON format'''
    y = yaml.load(str(msg))
    return json.dumps(y,indent=4)


''' usage demo:
from geometry_msgs.msg import PoseStamped
    P = PoseStamped()
    print msg2json(P)
'''

# 所有Map文件
fileList = []

def getFiles():
    strJson="";
    strData="";
    count_i=0;
    map_path="/home/u18/maps";
    files =os.listdir(map_path);
    for f in files:
        if (f[0] == '.'): # .xx start with'.' hidden
            pass
        elif (f.endswith(".yaml") ):
            if (os.path.isfile(map_path+'/'+f)):
                count_i+=1;
                # fileList.append(f)
                # yaml_dat=read_yaml_file(map_path+'/'+f); # os.path.join(map_path,'/',f)
                yaml_dat=read_map_file(map_path+'/'+f);
                strData+=","+yaml_dat;# +json.dumps(yaml_dat);
                # strData+=",{"+'"fullname":"'+f+'"}';
                rospy.loginfo(f);
                #,'datetime=',os.path.getmtime(f))
    
    strJson="{"+'"code": 0,"msg": "","count": '+str(count_i)+','+'"data":['+strData[1:]+']'+"}";
    # strJson="{"+'"code": 0,"msg": "","count": '+str(count_i)+','+'"data":['+strData+']'+"}";
    
    # fileList.append(strJson);
    return strJson;

def getMap(request):
    key=request.key
    # reset
    fileList = [];
    # getFiles();
    str_json=getFiles();
    fileList.append(str_json);
    maps=fileList;
    response = GetMapsResponse()
    response.maps = maps;
    rospy.loginfo("request:%s,result:%s",key,maps)

    return response

if __name__ == "__main__":
    rospy.init_node("getmaps");
    rospy.loginfo("get maps from folder ~/maps");
    server= rospy.Service("GetMaps",GetMaps,getMap)
    # server_json= rospy.Service("get_maps_json",GetMaps,getMap)
    rospy.loginfo("get map service start.")
    rospy.spin()
