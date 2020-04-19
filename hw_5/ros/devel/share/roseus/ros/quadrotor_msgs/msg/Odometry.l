;; Auto-generated. Do not edit!


(when (boundp 'quadrotor_msgs::Odometry)
  (if (not (find-package "QUADROTOR_MSGS"))
    (make-package "QUADROTOR_MSGS"))
  (shadow 'Odometry (find-package "QUADROTOR_MSGS")))
(unless (find-package "QUADROTOR_MSGS::ODOMETRY")
  (make-package "QUADROTOR_MSGS::ODOMETRY"))

(in-package "ROS")
;;//! \htmlinclude Odometry.msg.html
(if (not (find-package "NAV_MSGS"))
  (ros::roseus-add-msgs "nav_msgs"))


(intern "*STATUS_ODOM_VALID*" (find-package "QUADROTOR_MSGS::ODOMETRY"))
(shadow '*STATUS_ODOM_VALID* (find-package "QUADROTOR_MSGS::ODOMETRY"))
(defconstant quadrotor_msgs::Odometry::*STATUS_ODOM_VALID* 0)
(intern "*STATUS_ODOM_INVALID*" (find-package "QUADROTOR_MSGS::ODOMETRY"))
(shadow '*STATUS_ODOM_INVALID* (find-package "QUADROTOR_MSGS::ODOMETRY"))
(defconstant quadrotor_msgs::Odometry::*STATUS_ODOM_INVALID* 1)
(intern "*STATUS_ODOM_LOOPCLOSURE*" (find-package "QUADROTOR_MSGS::ODOMETRY"))
(shadow '*STATUS_ODOM_LOOPCLOSURE* (find-package "QUADROTOR_MSGS::ODOMETRY"))
(defconstant quadrotor_msgs::Odometry::*STATUS_ODOM_LOOPCLOSURE* 2)
(defclass quadrotor_msgs::Odometry
  :super ros::object
  :slots (_curodom _kfodom _kfid _status ))

(defmethod quadrotor_msgs::Odometry
  (:init
   (&key
    ((:curodom __curodom) (instance nav_msgs::Odometry :init))
    ((:kfodom __kfodom) (instance nav_msgs::Odometry :init))
    ((:kfid __kfid) 0)
    ((:status __status) 0)
    )
   (send-super :init)
   (setq _curodom __curodom)
   (setq _kfodom __kfodom)
   (setq _kfid (round __kfid))
   (setq _status (round __status))
   self)
  (:curodom
   (&rest __curodom)
   (if (keywordp (car __curodom))
       (send* _curodom __curodom)
     (progn
       (if __curodom (setq _curodom (car __curodom)))
       _curodom)))
  (:kfodom
   (&rest __kfodom)
   (if (keywordp (car __kfodom))
       (send* _kfodom __kfodom)
     (progn
       (if __kfodom (setq _kfodom (car __kfodom)))
       _kfodom)))
  (:kfid
   (&optional __kfid)
   (if __kfid (setq _kfid __kfid)) _kfid)
  (:status
   (&optional __status)
   (if __status (setq _status __status)) _status)
  (:serialization-length
   ()
   (+
    ;; nav_msgs/Odometry _curodom
    (send _curodom :serialization-length)
    ;; nav_msgs/Odometry _kfodom
    (send _kfodom :serialization-length)
    ;; uint32 _kfid
    4
    ;; uint8 _status
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; nav_msgs/Odometry _curodom
       (send _curodom :serialize s)
     ;; nav_msgs/Odometry _kfodom
       (send _kfodom :serialize s)
     ;; uint32 _kfid
       (write-long _kfid s)
     ;; uint8 _status
       (write-byte _status s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; nav_msgs/Odometry _curodom
     (send _curodom :deserialize buf ptr-) (incf ptr- (send _curodom :serialization-length))
   ;; nav_msgs/Odometry _kfodom
     (send _kfodom :deserialize buf ptr-) (incf ptr- (send _kfodom :serialization-length))
   ;; uint32 _kfid
     (setq _kfid (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint8 _status
     (setq _status (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get quadrotor_msgs::Odometry :md5sum-) "94d99f86002b25504a5d3354fa1ad709")
(setf (get quadrotor_msgs::Odometry :datatype-) "quadrotor_msgs/Odometry")
(setf (get quadrotor_msgs::Odometry :definition-)
      "uint8 STATUS_ODOM_VALID=0
uint8 STATUS_ODOM_INVALID=1
uint8 STATUS_ODOM_LOOPCLOSURE=2

nav_msgs/Odometry curodom
nav_msgs/Odometry kfodom
uint32 kfid
uint8 status

================================================================================
MSG: nav_msgs/Odometry
# This represents an estimate of a position and velocity in free space.  
# The pose in this message should be specified in the coordinate frame given by header.frame_id.
# The twist in this message should be specified in the coordinate frame given by the child_frame_id
Header header
string child_frame_id
geometry_msgs/PoseWithCovariance pose
geometry_msgs/TwistWithCovariance twist

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
MSG: geometry_msgs/PoseWithCovariance
# This represents a pose in free space with uncertainty.

Pose pose

# Row-major representation of the 6x6 covariance matrix
# The orientation parameters use a fixed-axis representation.
# In order, the parameters are:
# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)
float64[36] covariance

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

================================================================================
MSG: geometry_msgs/TwistWithCovariance
# This expresses velocity in free space with uncertainty.

Twist twist

# Row-major representation of the 6x6 covariance matrix
# The orientation parameters use a fixed-axis representation.
# In order, the parameters are:
# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)
float64[36] covariance

================================================================================
MSG: geometry_msgs/Twist
# This expresses velocity in free space broken into its linear and angular parts.
Vector3  linear
Vector3  angular

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
")



(provide :quadrotor_msgs/Odometry "94d99f86002b25504a5d3354fa1ad709")


