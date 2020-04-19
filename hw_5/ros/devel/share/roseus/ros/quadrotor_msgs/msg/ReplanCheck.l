;; Auto-generated. Do not edit!


(when (boundp 'quadrotor_msgs::ReplanCheck)
  (if (not (find-package "QUADROTOR_MSGS"))
    (make-package "QUADROTOR_MSGS"))
  (shadow 'ReplanCheck (find-package "QUADROTOR_MSGS")))
(unless (find-package "QUADROTOR_MSGS::REPLANCHECK")
  (make-package "QUADROTOR_MSGS::REPLANCHECK"))

(in-package "ROS")
;;//! \htmlinclude ReplanCheck.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass quadrotor_msgs::ReplanCheck
  :super ros::object
  :slots (_header _start_velocity _start_acceleration _plan_points _check_points _stop_velocity _stop_acceleration _replan_time_length _check_points_time_interval _plan_points_time_interval _trajectory_id _replan_to_global_time ))

(defmethod quadrotor_msgs::ReplanCheck
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:start_velocity __start_velocity) (instance geometry_msgs::Vector3 :init))
    ((:start_acceleration __start_acceleration) (instance geometry_msgs::Vector3 :init))
    ((:plan_points __plan_points) (let (r) (dotimes (i 0) (push (instance geometry_msgs::Point :init) r)) r))
    ((:check_points __check_points) (let (r) (dotimes (i 0) (push (instance geometry_msgs::Point :init) r)) r))
    ((:stop_velocity __stop_velocity) (instance geometry_msgs::Vector3 :init))
    ((:stop_acceleration __stop_acceleration) (instance geometry_msgs::Vector3 :init))
    ((:replan_time_length __replan_time_length) 0.0)
    ((:check_points_time_interval __check_points_time_interval) 0.0)
    ((:plan_points_time_interval __plan_points_time_interval) 0.0)
    ((:trajectory_id __trajectory_id) 0)
    ((:replan_to_global_time __replan_to_global_time) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _start_velocity __start_velocity)
   (setq _start_acceleration __start_acceleration)
   (setq _plan_points __plan_points)
   (setq _check_points __check_points)
   (setq _stop_velocity __stop_velocity)
   (setq _stop_acceleration __stop_acceleration)
   (setq _replan_time_length (float __replan_time_length))
   (setq _check_points_time_interval (float __check_points_time_interval))
   (setq _plan_points_time_interval (float __plan_points_time_interval))
   (setq _trajectory_id (round __trajectory_id))
   (setq _replan_to_global_time (float __replan_to_global_time))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:start_velocity
   (&rest __start_velocity)
   (if (keywordp (car __start_velocity))
       (send* _start_velocity __start_velocity)
     (progn
       (if __start_velocity (setq _start_velocity (car __start_velocity)))
       _start_velocity)))
  (:start_acceleration
   (&rest __start_acceleration)
   (if (keywordp (car __start_acceleration))
       (send* _start_acceleration __start_acceleration)
     (progn
       (if __start_acceleration (setq _start_acceleration (car __start_acceleration)))
       _start_acceleration)))
  (:plan_points
   (&rest __plan_points)
   (if (keywordp (car __plan_points))
       (send* _plan_points __plan_points)
     (progn
       (if __plan_points (setq _plan_points (car __plan_points)))
       _plan_points)))
  (:check_points
   (&rest __check_points)
   (if (keywordp (car __check_points))
       (send* _check_points __check_points)
     (progn
       (if __check_points (setq _check_points (car __check_points)))
       _check_points)))
  (:stop_velocity
   (&rest __stop_velocity)
   (if (keywordp (car __stop_velocity))
       (send* _stop_velocity __stop_velocity)
     (progn
       (if __stop_velocity (setq _stop_velocity (car __stop_velocity)))
       _stop_velocity)))
  (:stop_acceleration
   (&rest __stop_acceleration)
   (if (keywordp (car __stop_acceleration))
       (send* _stop_acceleration __stop_acceleration)
     (progn
       (if __stop_acceleration (setq _stop_acceleration (car __stop_acceleration)))
       _stop_acceleration)))
  (:replan_time_length
   (&optional __replan_time_length)
   (if __replan_time_length (setq _replan_time_length __replan_time_length)) _replan_time_length)
  (:check_points_time_interval
   (&optional __check_points_time_interval)
   (if __check_points_time_interval (setq _check_points_time_interval __check_points_time_interval)) _check_points_time_interval)
  (:plan_points_time_interval
   (&optional __plan_points_time_interval)
   (if __plan_points_time_interval (setq _plan_points_time_interval __plan_points_time_interval)) _plan_points_time_interval)
  (:trajectory_id
   (&optional __trajectory_id)
   (if __trajectory_id (setq _trajectory_id __trajectory_id)) _trajectory_id)
  (:replan_to_global_time
   (&optional __replan_to_global_time)
   (if __replan_to_global_time (setq _replan_to_global_time __replan_to_global_time)) _replan_to_global_time)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; geometry_msgs/Vector3 _start_velocity
    (send _start_velocity :serialization-length)
    ;; geometry_msgs/Vector3 _start_acceleration
    (send _start_acceleration :serialization-length)
    ;; geometry_msgs/Point[] _plan_points
    (apply #'+ (send-all _plan_points :serialization-length)) 4
    ;; geometry_msgs/Point[] _check_points
    (apply #'+ (send-all _check_points :serialization-length)) 4
    ;; geometry_msgs/Vector3 _stop_velocity
    (send _stop_velocity :serialization-length)
    ;; geometry_msgs/Vector3 _stop_acceleration
    (send _stop_acceleration :serialization-length)
    ;; float64 _replan_time_length
    8
    ;; float64 _check_points_time_interval
    8
    ;; float64 _plan_points_time_interval
    8
    ;; uint32 _trajectory_id
    4
    ;; float64 _replan_to_global_time
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; geometry_msgs/Vector3 _start_velocity
       (send _start_velocity :serialize s)
     ;; geometry_msgs/Vector3 _start_acceleration
       (send _start_acceleration :serialize s)
     ;; geometry_msgs/Point[] _plan_points
     (write-long (length _plan_points) s)
     (dolist (elem _plan_points)
       (send elem :serialize s)
       )
     ;; geometry_msgs/Point[] _check_points
     (write-long (length _check_points) s)
     (dolist (elem _check_points)
       (send elem :serialize s)
       )
     ;; geometry_msgs/Vector3 _stop_velocity
       (send _stop_velocity :serialize s)
     ;; geometry_msgs/Vector3 _stop_acceleration
       (send _stop_acceleration :serialize s)
     ;; float64 _replan_time_length
       (sys::poke _replan_time_length (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _check_points_time_interval
       (sys::poke _check_points_time_interval (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _plan_points_time_interval
       (sys::poke _plan_points_time_interval (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; uint32 _trajectory_id
       (write-long _trajectory_id s)
     ;; float64 _replan_to_global_time
       (sys::poke _replan_to_global_time (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; geometry_msgs/Vector3 _start_velocity
     (send _start_velocity :deserialize buf ptr-) (incf ptr- (send _start_velocity :serialization-length))
   ;; geometry_msgs/Vector3 _start_acceleration
     (send _start_acceleration :deserialize buf ptr-) (incf ptr- (send _start_acceleration :serialization-length))
   ;; geometry_msgs/Point[] _plan_points
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _plan_points (let (r) (dotimes (i n) (push (instance geometry_msgs::Point :init) r)) r))
     (dolist (elem- _plan_points)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; geometry_msgs/Point[] _check_points
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _check_points (let (r) (dotimes (i n) (push (instance geometry_msgs::Point :init) r)) r))
     (dolist (elem- _check_points)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; geometry_msgs/Vector3 _stop_velocity
     (send _stop_velocity :deserialize buf ptr-) (incf ptr- (send _stop_velocity :serialization-length))
   ;; geometry_msgs/Vector3 _stop_acceleration
     (send _stop_acceleration :deserialize buf ptr-) (incf ptr- (send _stop_acceleration :serialization-length))
   ;; float64 _replan_time_length
     (setq _replan_time_length (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _check_points_time_interval
     (setq _check_points_time_interval (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _plan_points_time_interval
     (setq _plan_points_time_interval (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; uint32 _trajectory_id
     (setq _trajectory_id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float64 _replan_to_global_time
     (setq _replan_to_global_time (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get quadrotor_msgs::ReplanCheck :md5sum-) "6a31f08865d3c08f64743e11538e9c4b")
(setf (get quadrotor_msgs::ReplanCheck :datatype-) "quadrotor_msgs/ReplanCheck")
(setf (get quadrotor_msgs::ReplanCheck :definition-)
      "Header header
geometry_msgs/Vector3 start_velocity
geometry_msgs/Vector3 start_acceleration
geometry_msgs/Point[] plan_points
geometry_msgs/Point[] check_points
geometry_msgs/Vector3 stop_velocity
geometry_msgs/Vector3 stop_acceleration
float64               replan_time_length
float64               check_points_time_interval
float64               plan_points_time_interval
uint32                trajectory_id
float64               replan_to_global_time

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

")



(provide :quadrotor_msgs/ReplanCheck "6a31f08865d3c08f64743e11538e9c4b")


