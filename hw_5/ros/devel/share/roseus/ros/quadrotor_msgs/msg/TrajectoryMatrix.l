;; Auto-generated. Do not edit!


(when (boundp 'quadrotor_msgs::TrajectoryMatrix)
  (if (not (find-package "QUADROTOR_MSGS"))
    (make-package "QUADROTOR_MSGS"))
  (shadow 'TrajectoryMatrix (find-package "QUADROTOR_MSGS")))
(unless (find-package "QUADROTOR_MSGS::TRAJECTORYMATRIX")
  (make-package "QUADROTOR_MSGS::TRAJECTORYMATRIX"))

(in-package "ROS")
;;//! \htmlinclude TrajectoryMatrix.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(intern "*TYPE_UNKNOWN*" (find-package "QUADROTOR_MSGS::TRAJECTORYMATRIX"))
(shadow '*TYPE_UNKNOWN* (find-package "QUADROTOR_MSGS::TRAJECTORYMATRIX"))
(defconstant quadrotor_msgs::TrajectoryMatrix::*TYPE_UNKNOWN* 0)
(intern "*TYPE_POLY*" (find-package "QUADROTOR_MSGS::TRAJECTORYMATRIX"))
(shadow '*TYPE_POLY* (find-package "QUADROTOR_MSGS::TRAJECTORYMATRIX"))
(defconstant quadrotor_msgs::TrajectoryMatrix::*TYPE_POLY* 1)
(intern "*TYPE_TIME*" (find-package "QUADROTOR_MSGS::TRAJECTORYMATRIX"))
(shadow '*TYPE_TIME* (find-package "QUADROTOR_MSGS::TRAJECTORYMATRIX"))
(defconstant quadrotor_msgs::TrajectoryMatrix::*TYPE_TIME* 2)
(defclass quadrotor_msgs::TrajectoryMatrix
  :super ros::object
  :slots (_header _type _id _name _format _data ))

(defmethod quadrotor_msgs::TrajectoryMatrix
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:type __type) 0)
    ((:id __id) 0)
    ((:name __name) "")
    ((:format __format) (make-array 0 :initial-element 0 :element-type :integer))
    ((:data __data) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _header __header)
   (setq _type (round __type))
   (setq _id (round __id))
   (setq _name (string __name))
   (setq _format __format)
   (setq _data __data)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:type
   (&optional __type)
   (if __type (setq _type __type)) _type)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:format
   (&optional __format)
   (if __format (setq _format __format)) _format)
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint8 _type
    1
    ;; uint32 _id
    4
    ;; string _name
    4 (length _name)
    ;; uint32[] _format
    (* 4    (length _format)) 4
    ;; float64[] _data
    (* 8    (length _data)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint8 _type
       (write-byte _type s)
     ;; uint32 _id
       (write-long _id s)
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; uint32[] _format
     (write-long (length _format) s)
     (dotimes (i (length _format))
       (write-long (elt _format i) s)
       )
     ;; float64[] _data
     (write-long (length _data) s)
     (dotimes (i (length _data))
       (sys::poke (elt _data i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint8 _type
     (setq _type (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint32 _id
     (setq _id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; uint32[] _format
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _format (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _format i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; float64[] _data
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _data (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _data i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;;
   self)
  )

(setf (get quadrotor_msgs::TrajectoryMatrix :md5sum-) "363b28998b62c9897469bb0e5d2bcb14")
(setf (get quadrotor_msgs::TrajectoryMatrix :datatype-) "quadrotor_msgs/TrajectoryMatrix")
(setf (get quadrotor_msgs::TrajectoryMatrix :definition-)
      "#type
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



(provide :quadrotor_msgs/TrajectoryMatrix "363b28998b62c9897469bb0e5d2bcb14")


