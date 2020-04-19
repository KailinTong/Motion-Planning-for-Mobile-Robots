;; Auto-generated. Do not edit!


(when (boundp 'quadrotor_msgs::StatusData)
  (if (not (find-package "QUADROTOR_MSGS"))
    (make-package "QUADROTOR_MSGS"))
  (shadow 'StatusData (find-package "QUADROTOR_MSGS")))
(unless (find-package "QUADROTOR_MSGS::STATUSDATA")
  (make-package "QUADROTOR_MSGS::STATUSDATA"))

(in-package "ROS")
;;//! \htmlinclude StatusData.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass quadrotor_msgs::StatusData
  :super ros::object
  :slots (_header _loop_rate _voltage _seq ))

(defmethod quadrotor_msgs::StatusData
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:loop_rate __loop_rate) 0)
    ((:voltage __voltage) 0.0)
    ((:seq __seq) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _loop_rate (round __loop_rate))
   (setq _voltage (float __voltage))
   (setq _seq (round __seq))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:loop_rate
   (&optional __loop_rate)
   (if __loop_rate (setq _loop_rate __loop_rate)) _loop_rate)
  (:voltage
   (&optional __voltage)
   (if __voltage (setq _voltage __voltage)) _voltage)
  (:seq
   (&optional __seq)
   (if __seq (setq _seq __seq)) _seq)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint16 _loop_rate
    2
    ;; float64 _voltage
    8
    ;; uint8 _seq
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint16 _loop_rate
       (write-word _loop_rate s)
     ;; float64 _voltage
       (sys::poke _voltage (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; uint8 _seq
       (write-byte _seq s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint16 _loop_rate
     (setq _loop_rate (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; float64 _voltage
     (setq _voltage (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; uint8 _seq
     (setq _seq (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get quadrotor_msgs::StatusData :md5sum-) "c70a4ec4725273263ae176ad30f89553")
(setf (get quadrotor_msgs::StatusData :datatype-) "quadrotor_msgs/StatusData")
(setf (get quadrotor_msgs::StatusData :definition-)
      "Header header
uint16 loop_rate
float64 voltage
uint8 seq

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



(provide :quadrotor_msgs/StatusData "c70a4ec4725273263ae176ad30f89553")


