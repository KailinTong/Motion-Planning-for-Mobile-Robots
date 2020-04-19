;; Auto-generated. Do not edit!


(when (boundp 'quadrotor_msgs::PolynomialTrajectory)
  (if (not (find-package "QUADROTOR_MSGS"))
    (make-package "QUADROTOR_MSGS"))
  (shadow 'PolynomialTrajectory (find-package "QUADROTOR_MSGS")))
(unless (find-package "QUADROTOR_MSGS::POLYNOMIALTRAJECTORY")
  (make-package "QUADROTOR_MSGS::POLYNOMIALTRAJECTORY"))

(in-package "ROS")
;;//! \htmlinclude PolynomialTrajectory.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(intern "*ACTION_ADD*" (find-package "QUADROTOR_MSGS::POLYNOMIALTRAJECTORY"))
(shadow '*ACTION_ADD* (find-package "QUADROTOR_MSGS::POLYNOMIALTRAJECTORY"))
(defconstant quadrotor_msgs::PolynomialTrajectory::*ACTION_ADD* 1)
(intern "*ACTION_ABORT*" (find-package "QUADROTOR_MSGS::POLYNOMIALTRAJECTORY"))
(shadow '*ACTION_ABORT* (find-package "QUADROTOR_MSGS::POLYNOMIALTRAJECTORY"))
(defconstant quadrotor_msgs::PolynomialTrajectory::*ACTION_ABORT* 2)
(intern "*ACTION_WARN_START*" (find-package "QUADROTOR_MSGS::POLYNOMIALTRAJECTORY"))
(shadow '*ACTION_WARN_START* (find-package "QUADROTOR_MSGS::POLYNOMIALTRAJECTORY"))
(defconstant quadrotor_msgs::PolynomialTrajectory::*ACTION_WARN_START* 3)
(intern "*ACTION_WARN_FINAL*" (find-package "QUADROTOR_MSGS::POLYNOMIALTRAJECTORY"))
(shadow '*ACTION_WARN_FINAL* (find-package "QUADROTOR_MSGS::POLYNOMIALTRAJECTORY"))
(defconstant quadrotor_msgs::PolynomialTrajectory::*ACTION_WARN_FINAL* 4)
(intern "*ACTION_WARN_IMPOSSIBLE*" (find-package "QUADROTOR_MSGS::POLYNOMIALTRAJECTORY"))
(shadow '*ACTION_WARN_IMPOSSIBLE* (find-package "QUADROTOR_MSGS::POLYNOMIALTRAJECTORY"))
(defconstant quadrotor_msgs::PolynomialTrajectory::*ACTION_WARN_IMPOSSIBLE* 5)
(defclass quadrotor_msgs::PolynomialTrajectory
  :super ros::object
  :slots (_header _trajectory_id _action _num_order _num_segment _start_yaw _final_yaw _coef_x _coef_y _coef_z _time _mag_coeff _order _debug_info ))

(defmethod quadrotor_msgs::PolynomialTrajectory
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:trajectory_id __trajectory_id) 0)
    ((:action __action) 0)
    ((:num_order __num_order) 0)
    ((:num_segment __num_segment) 0)
    ((:start_yaw __start_yaw) 0.0)
    ((:final_yaw __final_yaw) 0.0)
    ((:coef_x __coef_x) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:coef_y __coef_y) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:coef_z __coef_z) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:time __time) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:mag_coeff __mag_coeff) 0.0)
    ((:order __order) (make-array 0 :initial-element 0 :element-type :integer))
    ((:debug_info __debug_info) "")
    )
   (send-super :init)
   (setq _header __header)
   (setq _trajectory_id (round __trajectory_id))
   (setq _action (round __action))
   (setq _num_order (round __num_order))
   (setq _num_segment (round __num_segment))
   (setq _start_yaw (float __start_yaw))
   (setq _final_yaw (float __final_yaw))
   (setq _coef_x __coef_x)
   (setq _coef_y __coef_y)
   (setq _coef_z __coef_z)
   (setq _time __time)
   (setq _mag_coeff (float __mag_coeff))
   (setq _order __order)
   (setq _debug_info (string __debug_info))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:trajectory_id
   (&optional __trajectory_id)
   (if __trajectory_id (setq _trajectory_id __trajectory_id)) _trajectory_id)
  (:action
   (&optional __action)
   (if __action (setq _action __action)) _action)
  (:num_order
   (&optional __num_order)
   (if __num_order (setq _num_order __num_order)) _num_order)
  (:num_segment
   (&optional __num_segment)
   (if __num_segment (setq _num_segment __num_segment)) _num_segment)
  (:start_yaw
   (&optional __start_yaw)
   (if __start_yaw (setq _start_yaw __start_yaw)) _start_yaw)
  (:final_yaw
   (&optional __final_yaw)
   (if __final_yaw (setq _final_yaw __final_yaw)) _final_yaw)
  (:coef_x
   (&optional __coef_x)
   (if __coef_x (setq _coef_x __coef_x)) _coef_x)
  (:coef_y
   (&optional __coef_y)
   (if __coef_y (setq _coef_y __coef_y)) _coef_y)
  (:coef_z
   (&optional __coef_z)
   (if __coef_z (setq _coef_z __coef_z)) _coef_z)
  (:time
   (&optional __time)
   (if __time (setq _time __time)) _time)
  (:mag_coeff
   (&optional __mag_coeff)
   (if __mag_coeff (setq _mag_coeff __mag_coeff)) _mag_coeff)
  (:order
   (&optional __order)
   (if __order (setq _order __order)) _order)
  (:debug_info
   (&optional __debug_info)
   (if __debug_info (setq _debug_info __debug_info)) _debug_info)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint32 _trajectory_id
    4
    ;; uint32 _action
    4
    ;; uint32 _num_order
    4
    ;; uint32 _num_segment
    4
    ;; float64 _start_yaw
    8
    ;; float64 _final_yaw
    8
    ;; float64[] _coef_x
    (* 8    (length _coef_x)) 4
    ;; float64[] _coef_y
    (* 8    (length _coef_y)) 4
    ;; float64[] _coef_z
    (* 8    (length _coef_z)) 4
    ;; float64[] _time
    (* 8    (length _time)) 4
    ;; float64 _mag_coeff
    8
    ;; uint32[] _order
    (* 4    (length _order)) 4
    ;; string _debug_info
    4 (length _debug_info)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint32 _trajectory_id
       (write-long _trajectory_id s)
     ;; uint32 _action
       (write-long _action s)
     ;; uint32 _num_order
       (write-long _num_order s)
     ;; uint32 _num_segment
       (write-long _num_segment s)
     ;; float64 _start_yaw
       (sys::poke _start_yaw (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _final_yaw
       (sys::poke _final_yaw (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64[] _coef_x
     (write-long (length _coef_x) s)
     (dotimes (i (length _coef_x))
       (sys::poke (elt _coef_x i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _coef_y
     (write-long (length _coef_y) s)
     (dotimes (i (length _coef_y))
       (sys::poke (elt _coef_y i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _coef_z
     (write-long (length _coef_z) s)
     (dotimes (i (length _coef_z))
       (sys::poke (elt _coef_z i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _time
     (write-long (length _time) s)
     (dotimes (i (length _time))
       (sys::poke (elt _time i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64 _mag_coeff
       (sys::poke _mag_coeff (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; uint32[] _order
     (write-long (length _order) s)
     (dotimes (i (length _order))
       (write-long (elt _order i) s)
       )
     ;; string _debug_info
       (write-long (length _debug_info) s) (princ _debug_info s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint32 _trajectory_id
     (setq _trajectory_id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _action
     (setq _action (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _num_order
     (setq _num_order (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _num_segment
     (setq _num_segment (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float64 _start_yaw
     (setq _start_yaw (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _final_yaw
     (setq _final_yaw (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64[] _coef_x
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _coef_x (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _coef_x i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _coef_y
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _coef_y (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _coef_y i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _coef_z
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _coef_z (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _coef_z i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _time
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _time (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _time i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64 _mag_coeff
     (setq _mag_coeff (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; uint32[] _order
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _order (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _order i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; string _debug_info
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _debug_info (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get quadrotor_msgs::PolynomialTrajectory :md5sum-) "3abb6e1147f95babc52b64612c5ba5ed")
(setf (get quadrotor_msgs::PolynomialTrajectory :datatype-) "quadrotor_msgs/PolynomialTrajectory")
(setf (get quadrotor_msgs::PolynomialTrajectory :definition-)
      "Header header

# the trajectory id, starts from \"1\".
uint32 trajectory_id

# the action command for trajectory server.
uint32 ACTION_ADD                  =   1
uint32 ACTION_ABORT                =   2
uint32 ACTION_WARN_START           =   3
uint32 ACTION_WARN_FINAL           =   4
uint32 ACTION_WARN_IMPOSSIBLE      =   5
uint32 action

# the order of trajectory.
uint32 num_order
uint32 num_segment

# the polynomial coecfficients of the trajectory.
float64 start_yaw
float64 final_yaw
float64[] coef_x
float64[] coef_y
float64[] coef_z
float64[] time
float64   mag_coeff
uint32[]  order

string debug_info
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



(provide :quadrotor_msgs/PolynomialTrajectory "3abb6e1147f95babc52b64612c5ba5ed")


