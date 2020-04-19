;; Auto-generated. Do not edit!


(when (boundp 'quadrotor_msgs::PositionCommand)
  (if (not (find-package "QUADROTOR_MSGS"))
    (make-package "QUADROTOR_MSGS"))
  (shadow 'PositionCommand (find-package "QUADROTOR_MSGS")))
(unless (find-package "QUADROTOR_MSGS::POSITIONCOMMAND")
  (make-package "QUADROTOR_MSGS::POSITIONCOMMAND"))

(in-package "ROS")
;;//! \htmlinclude PositionCommand.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(intern "*TRAJECTORY_STATUS_EMPTY*" (find-package "QUADROTOR_MSGS::POSITIONCOMMAND"))
(shadow '*TRAJECTORY_STATUS_EMPTY* (find-package "QUADROTOR_MSGS::POSITIONCOMMAND"))
(defconstant quadrotor_msgs::PositionCommand::*TRAJECTORY_STATUS_EMPTY* 0)
(intern "*TRAJECTORY_STATUS_READY*" (find-package "QUADROTOR_MSGS::POSITIONCOMMAND"))
(shadow '*TRAJECTORY_STATUS_READY* (find-package "QUADROTOR_MSGS::POSITIONCOMMAND"))
(defconstant quadrotor_msgs::PositionCommand::*TRAJECTORY_STATUS_READY* 1)
(intern "*TRAJECTORY_STATUS_COMPLETED*" (find-package "QUADROTOR_MSGS::POSITIONCOMMAND"))
(shadow '*TRAJECTORY_STATUS_COMPLETED* (find-package "QUADROTOR_MSGS::POSITIONCOMMAND"))
(defconstant quadrotor_msgs::PositionCommand::*TRAJECTORY_STATUS_COMPLETED* 3)
(intern "*TRAJECTROY_STATUS_ABORT*" (find-package "QUADROTOR_MSGS::POSITIONCOMMAND"))
(shadow '*TRAJECTROY_STATUS_ABORT* (find-package "QUADROTOR_MSGS::POSITIONCOMMAND"))
(defconstant quadrotor_msgs::PositionCommand::*TRAJECTROY_STATUS_ABORT* 4)
(intern "*TRAJECTORY_STATUS_ILLEGAL_START*" (find-package "QUADROTOR_MSGS::POSITIONCOMMAND"))
(shadow '*TRAJECTORY_STATUS_ILLEGAL_START* (find-package "QUADROTOR_MSGS::POSITIONCOMMAND"))
(defconstant quadrotor_msgs::PositionCommand::*TRAJECTORY_STATUS_ILLEGAL_START* 5)
(intern "*TRAJECTORY_STATUS_ILLEGAL_FINAL*" (find-package "QUADROTOR_MSGS::POSITIONCOMMAND"))
(shadow '*TRAJECTORY_STATUS_ILLEGAL_FINAL* (find-package "QUADROTOR_MSGS::POSITIONCOMMAND"))
(defconstant quadrotor_msgs::PositionCommand::*TRAJECTORY_STATUS_ILLEGAL_FINAL* 6)
(intern "*TRAJECTORY_STATUS_IMPOSSIBLE*" (find-package "QUADROTOR_MSGS::POSITIONCOMMAND"))
(shadow '*TRAJECTORY_STATUS_IMPOSSIBLE* (find-package "QUADROTOR_MSGS::POSITIONCOMMAND"))
(defconstant quadrotor_msgs::PositionCommand::*TRAJECTORY_STATUS_IMPOSSIBLE* 7)
(defclass quadrotor_msgs::PositionCommand
  :super ros::object
  :slots (_header _position _velocity _acceleration _yaw _yaw_dot _kx _kv _trajectory_id _trajectory_flag ))

(defmethod quadrotor_msgs::PositionCommand
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:position __position) (instance geometry_msgs::Point :init))
    ((:velocity __velocity) (instance geometry_msgs::Vector3 :init))
    ((:acceleration __acceleration) (instance geometry_msgs::Vector3 :init))
    ((:yaw __yaw) 0.0)
    ((:yaw_dot __yaw_dot) 0.0)
    ((:kx __kx) (make-array 3 :initial-element 0.0 :element-type :float))
    ((:kv __kv) (make-array 3 :initial-element 0.0 :element-type :float))
    ((:trajectory_id __trajectory_id) 0)
    ((:trajectory_flag __trajectory_flag) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _position __position)
   (setq _velocity __velocity)
   (setq _acceleration __acceleration)
   (setq _yaw (float __yaw))
   (setq _yaw_dot (float __yaw_dot))
   (setq _kx __kx)
   (setq _kv __kv)
   (setq _trajectory_id (round __trajectory_id))
   (setq _trajectory_flag (round __trajectory_flag))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:position
   (&rest __position)
   (if (keywordp (car __position))
       (send* _position __position)
     (progn
       (if __position (setq _position (car __position)))
       _position)))
  (:velocity
   (&rest __velocity)
   (if (keywordp (car __velocity))
       (send* _velocity __velocity)
     (progn
       (if __velocity (setq _velocity (car __velocity)))
       _velocity)))
  (:acceleration
   (&rest __acceleration)
   (if (keywordp (car __acceleration))
       (send* _acceleration __acceleration)
     (progn
       (if __acceleration (setq _acceleration (car __acceleration)))
       _acceleration)))
  (:yaw
   (&optional __yaw)
   (if __yaw (setq _yaw __yaw)) _yaw)
  (:yaw_dot
   (&optional __yaw_dot)
   (if __yaw_dot (setq _yaw_dot __yaw_dot)) _yaw_dot)
  (:kx
   (&optional __kx)
   (if __kx (setq _kx __kx)) _kx)
  (:kv
   (&optional __kv)
   (if __kv (setq _kv __kv)) _kv)
  (:trajectory_id
   (&optional __trajectory_id)
   (if __trajectory_id (setq _trajectory_id __trajectory_id)) _trajectory_id)
  (:trajectory_flag
   (&optional __trajectory_flag)
   (if __trajectory_flag (setq _trajectory_flag __trajectory_flag)) _trajectory_flag)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; geometry_msgs/Point _position
    (send _position :serialization-length)
    ;; geometry_msgs/Vector3 _velocity
    (send _velocity :serialization-length)
    ;; geometry_msgs/Vector3 _acceleration
    (send _acceleration :serialization-length)
    ;; float64 _yaw
    8
    ;; float64 _yaw_dot
    8
    ;; float64[3] _kx
    (* 8    3)
    ;; float64[3] _kv
    (* 8    3)
    ;; uint32 _trajectory_id
    4
    ;; uint8 _trajectory_flag
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; geometry_msgs/Point _position
       (send _position :serialize s)
     ;; geometry_msgs/Vector3 _velocity
       (send _velocity :serialize s)
     ;; geometry_msgs/Vector3 _acceleration
       (send _acceleration :serialize s)
     ;; float64 _yaw
       (sys::poke _yaw (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _yaw_dot
       (sys::poke _yaw_dot (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64[3] _kx
     (dotimes (i 3)
       (sys::poke (elt _kx i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[3] _kv
     (dotimes (i 3)
       (sys::poke (elt _kv i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; uint32 _trajectory_id
       (write-long _trajectory_id s)
     ;; uint8 _trajectory_flag
       (write-byte _trajectory_flag s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; geometry_msgs/Point _position
     (send _position :deserialize buf ptr-) (incf ptr- (send _position :serialization-length))
   ;; geometry_msgs/Vector3 _velocity
     (send _velocity :deserialize buf ptr-) (incf ptr- (send _velocity :serialization-length))
   ;; geometry_msgs/Vector3 _acceleration
     (send _acceleration :deserialize buf ptr-) (incf ptr- (send _acceleration :serialization-length))
   ;; float64 _yaw
     (setq _yaw (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _yaw_dot
     (setq _yaw_dot (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64[3] _kx
   (dotimes (i (length _kx))
     (setf (elt _kx i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;; float64[3] _kv
   (dotimes (i (length _kv))
     (setf (elt _kv i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;; uint32 _trajectory_id
     (setq _trajectory_id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint8 _trajectory_flag
     (setq _trajectory_flag (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get quadrotor_msgs::PositionCommand :md5sum-) "4712f0609ca29a79af79a35ca3e3967a")
(setf (get quadrotor_msgs::PositionCommand :datatype-) "quadrotor_msgs/PositionCommand")
(setf (get quadrotor_msgs::PositionCommand :definition-)
      "Header header
geometry_msgs/Point position
geometry_msgs/Vector3 velocity
geometry_msgs/Vector3 acceleration
float64 yaw
float64 yaw_dot
float64[3] kx
float64[3] kv 

uint32 trajectory_id

uint8 TRAJECTORY_STATUS_EMPTY = 0
uint8 TRAJECTORY_STATUS_READY = 1
uint8 TRAJECTORY_STATUS_COMPLETED = 3
uint8 TRAJECTROY_STATUS_ABORT = 4
uint8 TRAJECTORY_STATUS_ILLEGAL_START = 5
uint8 TRAJECTORY_STATUS_ILLEGAL_FINAL = 6
uint8 TRAJECTORY_STATUS_IMPOSSIBLE = 7

# Its ID number will start from 1, allowing you comparing it with 0.
uint8 trajectory_flag

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
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

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



(provide :quadrotor_msgs/PositionCommand "4712f0609ca29a79af79a35ca3e3967a")


