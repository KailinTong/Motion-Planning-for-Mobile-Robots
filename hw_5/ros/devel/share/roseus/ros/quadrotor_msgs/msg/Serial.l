;; Auto-generated. Do not edit!


(when (boundp 'quadrotor_msgs::Serial)
  (if (not (find-package "QUADROTOR_MSGS"))
    (make-package "QUADROTOR_MSGS"))
  (shadow 'Serial (find-package "QUADROTOR_MSGS")))
(unless (find-package "QUADROTOR_MSGS::SERIAL")
  (make-package "QUADROTOR_MSGS::SERIAL"))

(in-package "ROS")
;;//! \htmlinclude Serial.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(intern "*SO3_CMD*" (find-package "QUADROTOR_MSGS::SERIAL"))
(shadow '*SO3_CMD* (find-package "QUADROTOR_MSGS::SERIAL"))
(defconstant quadrotor_msgs::Serial::*SO3_CMD* 115)
(intern "*TRPY_CMD*" (find-package "QUADROTOR_MSGS::SERIAL"))
(shadow '*TRPY_CMD* (find-package "QUADROTOR_MSGS::SERIAL"))
(defconstant quadrotor_msgs::Serial::*TRPY_CMD* 112)
(intern "*STATUS_DATA*" (find-package "QUADROTOR_MSGS::SERIAL"))
(shadow '*STATUS_DATA* (find-package "QUADROTOR_MSGS::SERIAL"))
(defconstant quadrotor_msgs::Serial::*STATUS_DATA* 99)
(intern "*OUTPUT_DATA*" (find-package "QUADROTOR_MSGS::SERIAL"))
(shadow '*OUTPUT_DATA* (find-package "QUADROTOR_MSGS::SERIAL"))
(defconstant quadrotor_msgs::Serial::*OUTPUT_DATA* 100)
(intern "*PPR_OUTPUT_DATA*" (find-package "QUADROTOR_MSGS::SERIAL"))
(shadow '*PPR_OUTPUT_DATA* (find-package "QUADROTOR_MSGS::SERIAL"))
(defconstant quadrotor_msgs::Serial::*PPR_OUTPUT_DATA* 116)
(intern "*PPR_GAINS*" (find-package "QUADROTOR_MSGS::SERIAL"))
(shadow '*PPR_GAINS* (find-package "QUADROTOR_MSGS::SERIAL"))
(defconstant quadrotor_msgs::Serial::*PPR_GAINS* 103)
(defclass quadrotor_msgs::Serial
  :super ros::object
  :slots (_header _channel _type _data ))

(defmethod quadrotor_msgs::Serial
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:channel __channel) 0)
    ((:type __type) 0)
    ((:data __data) (make-array 0 :initial-element 0 :element-type :char))
    )
   (send-super :init)
   (setq _header __header)
   (setq _channel (round __channel))
   (setq _type (round __type))
   (setq _data __data)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:channel
   (&optional __channel)
   (if __channel (setq _channel __channel)) _channel)
  (:type
   (&optional __type)
   (if __type (setq _type __type)) _type)
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint8 _channel
    1
    ;; uint8 _type
    1
    ;; uint8[] _data
    (* 1    (length _data)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint8 _channel
       (write-byte _channel s)
     ;; uint8 _type
       (write-byte _type s)
     ;; uint8[] _data
     (write-long (length _data) s)
     (princ _data s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint8 _channel
     (setq _channel (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _type
     (setq _type (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8[] _data
   (let ((n (sys::peek buf ptr- :integer))) (incf ptr- 4)
     (setq _data (make-array n :element-type :char))
     (replace _data buf :start2 ptr-) (incf ptr- n))
   ;;
   self)
  )

(setf (get quadrotor_msgs::Serial :md5sum-) "e448fb7595af9a8adfcab5ec241c7d4f")
(setf (get quadrotor_msgs::Serial :datatype-) "quadrotor_msgs/Serial")
(setf (get quadrotor_msgs::Serial :definition-)
      "# Note: These constants need to be kept in sync with the types
# defined in include/quadrotor_msgs/comm_types.h
uint8 SO3_CMD = 115 # 's' in base 10
uint8 TRPY_CMD = 112 # 'p' in base 10
uint8 STATUS_DATA = 99 # 'c' in base 10
uint8 OUTPUT_DATA = 100 # 'd' in base 10
uint8 PPR_OUTPUT_DATA = 116 # 't' in base 10
uint8 PPR_GAINS = 103 # 'g'

Header header
uint8 channel
uint8 type # One of the types listed above
uint8[] data

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



(provide :quadrotor_msgs/Serial "e448fb7595af9a8adfcab5ec241c7d4f")


