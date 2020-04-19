;; Auto-generated. Do not edit!


(when (boundp 'quadrotor_msgs::OutputData)
  (if (not (find-package "QUADROTOR_MSGS"))
    (make-package "QUADROTOR_MSGS"))
  (shadow 'OutputData (find-package "QUADROTOR_MSGS")))
(unless (find-package "QUADROTOR_MSGS::OUTPUTDATA")
  (make-package "QUADROTOR_MSGS::OUTPUTDATA"))

(in-package "ROS")
;;//! \htmlinclude OutputData.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass quadrotor_msgs::OutputData
  :super ros::object
  :slots (_header _loop_rate _voltage _orientation _angular_velocity _linear_acceleration _pressure_dheight _pressure_height _magnetic_field _radio_channel _seq ))

(defmethod quadrotor_msgs::OutputData
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:loop_rate __loop_rate) 0)
    ((:voltage __voltage) 0.0)
    ((:orientation __orientation) (instance geometry_msgs::Quaternion :init))
    ((:angular_velocity __angular_velocity) (instance geometry_msgs::Vector3 :init))
    ((:linear_acceleration __linear_acceleration) (instance geometry_msgs::Vector3 :init))
    ((:pressure_dheight __pressure_dheight) 0.0)
    ((:pressure_height __pressure_height) 0.0)
    ((:magnetic_field __magnetic_field) (instance geometry_msgs::Vector3 :init))
    ((:radio_channel __radio_channel) (make-array 8 :initial-element 0 :element-type :char))
    ((:seq __seq) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _loop_rate (round __loop_rate))
   (setq _voltage (float __voltage))
   (setq _orientation __orientation)
   (setq _angular_velocity __angular_velocity)
   (setq _linear_acceleration __linear_acceleration)
   (setq _pressure_dheight (float __pressure_dheight))
   (setq _pressure_height (float __pressure_height))
   (setq _magnetic_field __magnetic_field)
   (setq _radio_channel __radio_channel)
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
  (:orientation
   (&rest __orientation)
   (if (keywordp (car __orientation))
       (send* _orientation __orientation)
     (progn
       (if __orientation (setq _orientation (car __orientation)))
       _orientation)))
  (:angular_velocity
   (&rest __angular_velocity)
   (if (keywordp (car __angular_velocity))
       (send* _angular_velocity __angular_velocity)
     (progn
       (if __angular_velocity (setq _angular_velocity (car __angular_velocity)))
       _angular_velocity)))
  (:linear_acceleration
   (&rest __linear_acceleration)
   (if (keywordp (car __linear_acceleration))
       (send* _linear_acceleration __linear_acceleration)
     (progn
       (if __linear_acceleration (setq _linear_acceleration (car __linear_acceleration)))
       _linear_acceleration)))
  (:pressure_dheight
   (&optional __pressure_dheight)
   (if __pressure_dheight (setq _pressure_dheight __pressure_dheight)) _pressure_dheight)
  (:pressure_height
   (&optional __pressure_height)
   (if __pressure_height (setq _pressure_height __pressure_height)) _pressure_height)
  (:magnetic_field
   (&rest __magnetic_field)
   (if (keywordp (car __magnetic_field))
       (send* _magnetic_field __magnetic_field)
     (progn
       (if __magnetic_field (setq _magnetic_field (car __magnetic_field)))
       _magnetic_field)))
  (:radio_channel
   (&optional __radio_channel)
   (if __radio_channel (setq _radio_channel __radio_channel)) _radio_channel)
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
    ;; geometry_msgs/Quaternion _orientation
    (send _orientation :serialization-length)
    ;; geometry_msgs/Vector3 _angular_velocity
    (send _angular_velocity :serialization-length)
    ;; geometry_msgs/Vector3 _linear_acceleration
    (send _linear_acceleration :serialization-length)
    ;; float64 _pressure_dheight
    8
    ;; float64 _pressure_height
    8
    ;; geometry_msgs/Vector3 _magnetic_field
    (send _magnetic_field :serialization-length)
    ;; uint8[8] _radio_channel
    (* 1    8)
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
     ;; geometry_msgs/Quaternion _orientation
       (send _orientation :serialize s)
     ;; geometry_msgs/Vector3 _angular_velocity
       (send _angular_velocity :serialize s)
     ;; geometry_msgs/Vector3 _linear_acceleration
       (send _linear_acceleration :serialize s)
     ;; float64 _pressure_dheight
       (sys::poke _pressure_dheight (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _pressure_height
       (sys::poke _pressure_height (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; geometry_msgs/Vector3 _magnetic_field
       (send _magnetic_field :serialize s)
     ;; uint8[8] _radio_channel
     (princ _radio_channel s)
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
   ;; geometry_msgs/Quaternion _orientation
     (send _orientation :deserialize buf ptr-) (incf ptr- (send _orientation :serialization-length))
   ;; geometry_msgs/Vector3 _angular_velocity
     (send _angular_velocity :deserialize buf ptr-) (incf ptr- (send _angular_velocity :serialization-length))
   ;; geometry_msgs/Vector3 _linear_acceleration
     (send _linear_acceleration :deserialize buf ptr-) (incf ptr- (send _linear_acceleration :serialization-length))
   ;; float64 _pressure_dheight
     (setq _pressure_dheight (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _pressure_height
     (setq _pressure_height (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; geometry_msgs/Vector3 _magnetic_field
     (send _magnetic_field :deserialize buf ptr-) (incf ptr- (send _magnetic_field :serialization-length))
   ;; uint8[8] _radio_channel
   (setq _radio_channel (make-array 8 :element-type :char))
   (replace _radio_channel buf :start2 ptr-) (incf ptr- 8)
   ;; uint8 _seq
     (setq _seq (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get quadrotor_msgs::OutputData :md5sum-) "5759ee97fd5c090dcdccf7fc3e50d024")
(setf (get quadrotor_msgs::OutputData :datatype-) "quadrotor_msgs/OutputData")
(setf (get quadrotor_msgs::OutputData :definition-)
      "Header header
uint16 loop_rate
float64 voltage
geometry_msgs/Quaternion orientation
geometry_msgs/Vector3 angular_velocity
geometry_msgs/Vector3 linear_acceleration
float64 pressure_dheight
float64 pressure_height
geometry_msgs/Vector3 magnetic_field
uint8[8] radio_channel
#uint8[4] motor_rpm
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

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

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



(provide :quadrotor_msgs/OutputData "5759ee97fd5c090dcdccf7fc3e50d024")


