;; Auto-generated. Do not edit!


(when (boundp 'quadrotor_msgs::SwarmInfo)
  (if (not (find-package "QUADROTOR_MSGS"))
    (make-package "QUADROTOR_MSGS"))
  (shadow 'SwarmInfo (find-package "QUADROTOR_MSGS")))
(unless (find-package "QUADROTOR_MSGS::SWARMINFO")
  (make-package "QUADROTOR_MSGS::SWARMINFO"))

(in-package "ROS")
;;//! \htmlinclude SwarmInfo.msg.html


(defclass quadrotor_msgs::SwarmInfo
  :super ros::object
  :slots (_path _start ))

(defmethod quadrotor_msgs::SwarmInfo
  (:init
   (&key
    ((:path __path) (instance quadrotor_msgs::TrajectoryMatrix :init))
    ((:start __start) (instance ros::time :init))
    )
   (send-super :init)
   (setq _path __path)
   (setq _start __start)
   self)
  (:path
   (&rest __path)
   (if (keywordp (car __path))
       (send* _path __path)
     (progn
       (if __path (setq _path (car __path)))
       _path)))
  (:start
   (&optional __start)
   (if __start (setq _start __start)) _start)
  (:serialization-length
   ()
   (+
    ;; quadrotor_msgs/TrajectoryMatrix _path
    (send _path :serialization-length)
    ;; time _start
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; quadrotor_msgs/TrajectoryMatrix _path
       (send _path :serialize s)
     ;; time _start
       (write-long (send _start :sec) s) (write-long (send _start :nsec) s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; quadrotor_msgs/TrajectoryMatrix _path
     (send _path :deserialize buf ptr-) (incf ptr- (send _path :serialization-length))
   ;; time _start
     (send _start :sec (sys::peek buf ptr- :integer)) (incf ptr- 4)  (send _start :nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get quadrotor_msgs::SwarmInfo :md5sum-) "908ae631e70132160c2527a9926df867")
(setf (get quadrotor_msgs::SwarmInfo :datatype-) "quadrotor_msgs/SwarmInfo")
(setf (get quadrotor_msgs::SwarmInfo :definition-)
      "quadrotor_msgs/TrajectoryMatrix path
time start

================================================================================
MSG: quadrotor_msgs/TrajectoryMatrix
#type
uint8 TYPE_UNKNOWN = 0
uint8 TYPE_POLY    = 1
uint8 TYPE_TIME    = 2

#data structure
Header    header
uint8     type
uint32    id
string    name
uint32[]  format
float64[] data

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

")



(provide :quadrotor_msgs/SwarmInfo "908ae631e70132160c2527a9926df867")


