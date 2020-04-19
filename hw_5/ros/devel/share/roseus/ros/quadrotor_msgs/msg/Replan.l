;; Auto-generated. Do not edit!


(when (boundp 'quadrotor_msgs::Replan)
  (if (not (find-package "QUADROTOR_MSGS"))
    (make-package "QUADROTOR_MSGS"))
  (shadow 'Replan (find-package "QUADROTOR_MSGS")))
(unless (find-package "QUADROTOR_MSGS::REPLAN")
  (make-package "QUADROTOR_MSGS::REPLAN"))

(in-package "ROS")
;;//! \htmlinclude Replan.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "NAV_MSGS"))
  (ros::roseus-add-msgs "nav_msgs"))


(defclass quadrotor_msgs::Replan
  :super ros::object
  :slots (_start_velocity _start_acceleration _plan _stop_velocity _stop_acceleration _replan_time ))

(defmethod quadrotor_msgs::Replan
  (:init
   (&key
    ((:start_velocity __start_velocity) (instance geometry_msgs::Vector3 :init))
    ((:start_acceleration __start_acceleration) (instance geometry_msgs::Vector3 :init))
    ((:plan __plan) (instance nav_msgs::Path :init))
    ((:stop_velocity __stop_velocity) (instance geometry_msgs::Vector3 :init))
    ((:stop_acceleration __stop_acceleration) (instance geometry_msgs::Vector3 :init))
    ((:replan_time __replan_time) 0.0)
    )
   (send-super :init)
   (setq _start_velocity __start_velocity)
   (setq _start_acceleration __start_acceleration)
   (setq _plan __plan)
   (setq _stop_velocity __stop_velocity)
   (setq _stop_acceleration __stop_acceleration)
   (setq _replan_time (float __replan_time))
   self)
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
  (:plan
   (&rest __plan)
   (if (keywordp (car __plan))
       (send* _plan __plan)
     (progn
       (if __plan (setq _plan (car __plan)))
       _plan)))
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
  (:replan_time
   (&optional __replan_time)
   (if __replan_time (setq _replan_time __replan_time)) _replan_time)
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Vector3 _start_velocity
    (send _start_velocity :serialization-length)
    ;; geometry_msgs/Vector3 _start_acceleration
    (send _start_acceleration :serialization-length)
    ;; nav_msgs/Path _plan
    (send _plan :serialization-length)
    ;; geometry_msgs/Vector3 _stop_velocity
    (send _stop_velocity :serialization-length)
    ;; geometry_msgs/Vector3 _stop_acceleration
    (send _stop_acceleration :serialization-length)
    ;; float64 _replan_time
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Vector3 _start_velocity
       (send _start_velocity :serialize s)
     ;; geometry_msgs/Vector3 _start_acceleration
       (send _start_acceleration :serialize s)
     ;; nav_msgs/Path _plan
       (send _plan :serialize s)
     ;; geometry_msgs/Vector3 _stop_velocity
       (send _stop_velocity :serialize s)
     ;; geometry_msgs/Vector3 _stop_acceleration
       (send _stop_acceleration :serialize s)
     ;; float64 _replan_time
       (sys::poke _replan_time (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Vector3 _start_velocity
     (send _start_velocity :deserialize buf ptr-) (incf ptr- (send _start_velocity :serialization-length))
   ;; geometry_msgs/Vector3 _start_acceleration
     (send _start_acceleration :deserialize buf ptr-) (incf ptr- (send _start_acceleration :serialization-length))
   ;; nav_msgs/Path _plan
     (send _plan :deserialize buf ptr-) (incf ptr- (send _plan :serialization-length))
   ;; geometry_msgs/Vector3 _stop_velocity
     (send _stop_velocity :deserialize buf ptr-) (incf ptr- (send _stop_velocity :serialization-length))
   ;; geometry_msgs/Vector3 _stop_acceleration
     (send _stop_acceleration :deserialize buf ptr-) (incf ptr- (send _stop_acceleration :serialization-length))
   ;; float64 _replan_time
     (setq _replan_time (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get quadrotor_msgs::Replan :md5sum-) "73a17ace4b8b54cf9b4974fbea003b7f")
(setf (get quadrotor_msgs::Replan :datatype-) "quadrotor_msgs/Replan")
(setf (get quadrotor_msgs::Replan :definition-)
      "#data structure
geometry_msgs/Vector3 start_velocity
geometry_msgs/Vector3 start_acceleration
nav_msgs/Path         plan
geometry_msgs/Vector3 stop_velocity
geometry_msgs/Vector3 stop_acceleration
float64               replan_time

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
MSG: nav_msgs/Path
#An array of poses that represents a Path for a robot to follow
Header header
geometry_msgs/PoseStamped[] poses

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
MSG: geometry_msgs/PoseStamped
# A Pose with reference coordinate frame and timestamp
Header header
Pose pose

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

")



(provide :quadrotor_msgs/Replan "73a17ace4b8b54cf9b4974fbea003b7f")


