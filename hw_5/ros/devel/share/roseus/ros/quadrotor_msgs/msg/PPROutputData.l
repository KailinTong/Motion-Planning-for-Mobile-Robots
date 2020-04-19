;; Auto-generated. Do not edit!


(when (boundp 'quadrotor_msgs::PPROutputData)
  (if (not (find-package "QUADROTOR_MSGS"))
    (make-package "QUADROTOR_MSGS"))
  (shadow 'PPROutputData (find-package "QUADROTOR_MSGS")))
(unless (find-package "QUADROTOR_MSGS::PPROUTPUTDATA")
  (make-package "QUADROTOR_MSGS::PPROUTPUTDATA"))

(in-package "ROS")
;;//! \htmlinclude PPROutputData.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass quadrotor_msgs::PPROutputData
  :super ros::object
  :slots (_header _quad_time _des_thrust _des_roll _des_pitch _des_yaw _est_roll _est_pitch _est_yaw _est_angvel_x _est_angvel_y _est_angvel_z _est_acc_x _est_acc_y _est_acc_z _pwm ))

(defmethod quadrotor_msgs::PPROutputData
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:quad_time __quad_time) 0)
    ((:des_thrust __des_thrust) 0.0)
    ((:des_roll __des_roll) 0.0)
    ((:des_pitch __des_pitch) 0.0)
    ((:des_yaw __des_yaw) 0.0)
    ((:est_roll __est_roll) 0.0)
    ((:est_pitch __est_pitch) 0.0)
    ((:est_yaw __est_yaw) 0.0)
    ((:est_angvel_x __est_angvel_x) 0.0)
    ((:est_angvel_y __est_angvel_y) 0.0)
    ((:est_angvel_z __est_angvel_z) 0.0)
    ((:est_acc_x __est_acc_x) 0.0)
    ((:est_acc_y __est_acc_y) 0.0)
    ((:est_acc_z __est_acc_z) 0.0)
    ((:pwm __pwm) (make-array 4 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _header __header)
   (setq _quad_time (round __quad_time))
   (setq _des_thrust (float __des_thrust))
   (setq _des_roll (float __des_roll))
   (setq _des_pitch (float __des_pitch))
   (setq _des_yaw (float __des_yaw))
   (setq _est_roll (float __est_roll))
   (setq _est_pitch (float __est_pitch))
   (setq _est_yaw (float __est_yaw))
   (setq _est_angvel_x (float __est_angvel_x))
   (setq _est_angvel_y (float __est_angvel_y))
   (setq _est_angvel_z (float __est_angvel_z))
   (setq _est_acc_x (float __est_acc_x))
   (setq _est_acc_y (float __est_acc_y))
   (setq _est_acc_z (float __est_acc_z))
   (setq _pwm __pwm)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:quad_time
   (&optional __quad_time)
   (if __quad_time (setq _quad_time __quad_time)) _quad_time)
  (:des_thrust
   (&optional __des_thrust)
   (if __des_thrust (setq _des_thrust __des_thrust)) _des_thrust)
  (:des_roll
   (&optional __des_roll)
   (if __des_roll (setq _des_roll __des_roll)) _des_roll)
  (:des_pitch
   (&optional __des_pitch)
   (if __des_pitch (setq _des_pitch __des_pitch)) _des_pitch)
  (:des_yaw
   (&optional __des_yaw)
   (if __des_yaw (setq _des_yaw __des_yaw)) _des_yaw)
  (:est_roll
   (&optional __est_roll)
   (if __est_roll (setq _est_roll __est_roll)) _est_roll)
  (:est_pitch
   (&optional __est_pitch)
   (if __est_pitch (setq _est_pitch __est_pitch)) _est_pitch)
  (:est_yaw
   (&optional __est_yaw)
   (if __est_yaw (setq _est_yaw __est_yaw)) _est_yaw)
  (:est_angvel_x
   (&optional __est_angvel_x)
   (if __est_angvel_x (setq _est_angvel_x __est_angvel_x)) _est_angvel_x)
  (:est_angvel_y
   (&optional __est_angvel_y)
   (if __est_angvel_y (setq _est_angvel_y __est_angvel_y)) _est_angvel_y)
  (:est_angvel_z
   (&optional __est_angvel_z)
   (if __est_angvel_z (setq _est_angvel_z __est_angvel_z)) _est_angvel_z)
  (:est_acc_x
   (&optional __est_acc_x)
   (if __est_acc_x (setq _est_acc_x __est_acc_x)) _est_acc_x)
  (:est_acc_y
   (&optional __est_acc_y)
   (if __est_acc_y (setq _est_acc_y __est_acc_y)) _est_acc_y)
  (:est_acc_z
   (&optional __est_acc_z)
   (if __est_acc_z (setq _est_acc_z __est_acc_z)) _est_acc_z)
  (:pwm
   (&optional __pwm)
   (if __pwm (setq _pwm __pwm)) _pwm)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint16 _quad_time
    2
    ;; float64 _des_thrust
    8
    ;; float64 _des_roll
    8
    ;; float64 _des_pitch
    8
    ;; float64 _des_yaw
    8
    ;; float64 _est_roll
    8
    ;; float64 _est_pitch
    8
    ;; float64 _est_yaw
    8
    ;; float64 _est_angvel_x
    8
    ;; float64 _est_angvel_y
    8
    ;; float64 _est_angvel_z
    8
    ;; float64 _est_acc_x
    8
    ;; float64 _est_acc_y
    8
    ;; float64 _est_acc_z
    8
    ;; uint16[4] _pwm
    (* 2    4)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint16 _quad_time
       (write-word _quad_time s)
     ;; float64 _des_thrust
       (sys::poke _des_thrust (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _des_roll
       (sys::poke _des_roll (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _des_pitch
       (sys::poke _des_pitch (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _des_yaw
       (sys::poke _des_yaw (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _est_roll
       (sys::poke _est_roll (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _est_pitch
       (sys::poke _est_pitch (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _est_yaw
       (sys::poke _est_yaw (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _est_angvel_x
       (sys::poke _est_angvel_x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _est_angvel_y
       (sys::poke _est_angvel_y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _est_angvel_z
       (sys::poke _est_angvel_z (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _est_acc_x
       (sys::poke _est_acc_x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _est_acc_y
       (sys::poke _est_acc_y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _est_acc_z
       (sys::poke _est_acc_z (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; uint16[4] _pwm
     (dotimes (i 4)
       (write-word (elt _pwm i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint16 _quad_time
     (setq _quad_time (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; float64 _des_thrust
     (setq _des_thrust (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _des_roll
     (setq _des_roll (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _des_pitch
     (setq _des_pitch (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _des_yaw
     (setq _des_yaw (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _est_roll
     (setq _est_roll (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _est_pitch
     (setq _est_pitch (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _est_yaw
     (setq _est_yaw (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _est_angvel_x
     (setq _est_angvel_x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _est_angvel_y
     (setq _est_angvel_y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _est_angvel_z
     (setq _est_angvel_z (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _est_acc_x
     (setq _est_acc_x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _est_acc_y
     (setq _est_acc_y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _est_acc_z
     (setq _est_acc_z (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; uint16[4] _pwm
   (dotimes (i (length _pwm))
     (setf (elt _pwm i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     )
   ;;
   self)
  )

(setf (get quadrotor_msgs::PPROutputData :md5sum-) "732c0e3ca36f241464f8c445e78a0d0a")
(setf (get quadrotor_msgs::PPROutputData :datatype-) "quadrotor_msgs/PPROutputData")
(setf (get quadrotor_msgs::PPROutputData :definition-)
      "Header header
uint16 quad_time
float64 des_thrust
float64 des_roll
float64 des_pitch
float64 des_yaw
float64 est_roll
float64 est_pitch
float64 est_yaw
float64 est_angvel_x
float64 est_angvel_y
float64 est_angvel_z
float64 est_acc_x
float64 est_acc_y
float64 est_acc_z
uint16[4] pwm

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



(provide :quadrotor_msgs/PPROutputData "732c0e3ca36f241464f8c445e78a0d0a")


