#ifndef _STATE_H_
#define _STATE_H_

#include <iostream>
#include <ros/ros.h>
#include <ros/console.h>
#include <Eigen/Eigen>
#include "backward.hpp"

struct TrajectoryState;
typedef TrajectoryState* TrajectoryStatePtr;

struct TrajectoryState
{
    std::vector<Eigen::Vector3d> Position;
    std::vector<Eigen::Vector3d> Velocity;
    double Trajctory_Cost ;
    bool collision_check ;           //False -> no collision, True -> collision
    bool optimal_flag;               //False -> not optimal in TraLibrary, True -> not optimal in TraLibrary, 

    TrajectoryState(std::vector<Eigen::Vector3d> _Position, std::vector<Eigen::Vector3d> _Velocity,double _Trajctory_Cost){
        Position        = _Position;
        Velocity        = _Velocity;
        Trajctory_Cost  = _Trajctory_Cost;
        collision_check = false;
        optimal_flag    = false;
    }
    TrajectoryState(){};
    ~TrajectoryState(){};

    void setCollisionfree(){
        collision_check = true;
    }
    void setOptimal(){
        optimal_flag    = true;
    }
};

#endif