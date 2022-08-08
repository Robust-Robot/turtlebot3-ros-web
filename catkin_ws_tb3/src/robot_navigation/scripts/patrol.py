#!/usr/bin/env python

import rospy
import actionlib

from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal


waypoints = [  # <1>
    [(-2.10821362286, -0.444083253061, 0.0), (0.0, 0.0, 0.0, 1.0)],
    [(-4.27737396053, -0.619961118278, 0.0), (0.0, 0.0, 0.0, 1.0)],
    [(-0.298137260011, 1.51622211966, 0.0), (0.0, 0.0, -0.441751762391, 0.897137325288)],
    [(0.0, 0.0, 0.0), (0.0, 0.0, 0.0, 0.0)]
]


def goal_pose(pose):  # <2>
    goal_pose = MoveBaseGoal()
    goal_pose.target_pose.header.frame_id = 'map'
    goal_pose.target_pose.pose.position.x = pose[0][0]
    goal_pose.target_pose.pose.position.y = pose[0][1]
    goal_pose.target_pose.pose.position.z = pose[0][2]
    goal_pose.target_pose.pose.orientation.x = pose[1][0]
    goal_pose.target_pose.pose.orientation.y = pose[1][1]
    goal_pose.target_pose.pose.orientation.z = pose[1][2]
    goal_pose.target_pose.pose.orientation.w = pose[1][3]

    return goal_pose


if __name__ == '__main__':
    rospy.init_node('patrol')

    client = actionlib.SimpleActionClient('move_base', MoveBaseAction)  # <3>
    client.wait_for_server()
    
    while not rospy.is_shutdown(): # True:
        for pose in waypoints:   # <4>
            goal = goal_pose(pose)
            client.send_goal(goal)
            client.wait_for_result()

