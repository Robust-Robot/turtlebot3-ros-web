#! /usr/bin/env python
#coding=utf-8

from locale import LC_ALL, setlocale
import rospy

if __name__ == "__main__":
    # solve中文乱码
    # 文件开头加入 # -*- coding: UTF-8 -*-  或者 #coding=utf-8

    # no-config py err:
    # python3 (not recommended)
    # sudo ln -s /usr/bin/python3 /usr/bin/python 

    rospy.init_node("hello_p");
    rospy.loginfo("hello python 中文乱码");
