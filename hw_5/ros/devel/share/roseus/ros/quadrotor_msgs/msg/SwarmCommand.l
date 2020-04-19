;; Auto-generated. Do not edit!


(when (boundp 'quadrotor_msgs::SwarmCommand)
  (if (not (find-package "QUADROTOR_MSGS"))
    (make-package "QUADROTOR_MSGS"))
  (shadow 'SwarmCommand (find-package "QUADROTOR_MSGS")))
(unless (find-package "QUADROTOR_MSGS::SWARMCOMMAND")
  (make-package "QUADROTOR_MSGS::SWARMCOMMAND"))

(in-package "ROS")
;;//! \htmlinclude SwarmCommand.msg.html
(if (not (find-package "NAV_MSGS"))
  (ros::roseus-add-msgs "nav_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass quadrotor_msgs::SwarmCommand
  :super ros::object
  :slots (_header _selection _plan _formation ))

(defmethod quadrotor_msgs::SwarmCommand
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:selection __selection) (make-array 0 :initial-element 0 :element-type :integer))
    ((:plan __plan) (instance nav_msgs::Path :init))
    ((:formation __formation) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _header __header)
   (setq _selection __selection)
   (setq _plan __plan)
   (setq _formation __formation)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:selection
   (&optional __selection)
   (if __selection (setq _selection __selection)) _selection)
  (:plan
   (&rest __plan)
   (if (keywordp (car __plan))
       (send* _plan __plan)
     (progn
       (if __plan (setq _plan (car __plan)))
       _plan)))
  (:formation
   (&optional __formation)
   (if __formation (setq _formation __formation)) _formation)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; int32[] _selection
    (* 4    (length _selection)) 4
    ;; nav_msgs/Path _plan
    (send _plan :serialization-length)
    ;; float32[] _formation
    (* 4    (length _formation)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; int32[] _selection
     (write-long (length _selection) s)
     (dotimes (i (length _selection))
       (write-long (elt _selection i) s)
       )
     ;; nav_msgs/Path _plan
       (send _plan :serialize s)
     ;; float32[] _formation
     (write-long (length _formation) s)
     (dotimes (i (length _formation))
       (sys::poke (elt _formation i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; int32[] _selection
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _selection (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _selection i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; nav_msgs/Path _plan
     (send _plan :deserialize buf ptr-) (incf ptr- (send _plan :serialization-length))
   ;; float32[] _formation
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _formation (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _formation i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get quadrotor_msgs::SwarmCommand :md5sum-) "fb2553d3cc9aea3fc90865317210e00c")
(setf (get quadrotor_msgs::SwarmCommand :datatype-) "quadrotor_msgs/SwarmCommand")
(setf (get quadrotor_msgs::SwarmCommand :definition-)
      "#data structure
Header        header
int32[]       selection
nav_msgs/Path plan
float32[]     formation #todo implement related code

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
MSG: nav_msgs/Path
#An array of poses that represents a Path for a robot to follow
Header header
geometry_msgs/PoseStamped[] poses

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



(provide :quadrotor_msgs/SwarmCommand "fb2553d3cc9aea3fc90865317210e00c")


