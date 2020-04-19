;; Auto-generated. Do not edit!


(when (boundp 'quadrotor_msgs::SpatialTemporalTrajectory)
  (if (not (find-package "QUADROTOR_MSGS"))
    (make-package "QUADROTOR_MSGS"))
  (shadow 'SpatialTemporalTrajectory (find-package "QUADROTOR_MSGS")))
(unless (find-package "QUADROTOR_MSGS::SPATIALTEMPORALTRAJECTORY")
  (make-package "QUADROTOR_MSGS::SPATIALTEMPORALTRAJECTORY"))

(in-package "ROS")
;;//! \htmlinclude SpatialTemporalTrajectory.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(intern "*ACTION_ADD*" (find-package "QUADROTOR_MSGS::SPATIALTEMPORALTRAJECTORY"))
(shadow '*ACTION_ADD* (find-package "QUADROTOR_MSGS::SPATIALTEMPORALTRAJECTORY"))
(defconstant quadrotor_msgs::SpatialTemporalTrajectory::*ACTION_ADD* 1)
(intern "*ACTION_ABORT*" (find-package "QUADROTOR_MSGS::SPATIALTEMPORALTRAJECTORY"))
(shadow '*ACTION_ABORT* (find-package "QUADROTOR_MSGS::SPATIALTEMPORALTRAJECTORY"))
(defconstant quadrotor_msgs::SpatialTemporalTrajectory::*ACTION_ABORT* 2)
(intern "*ACTION_WARN_START*" (find-package "QUADROTOR_MSGS::SPATIALTEMPORALTRAJECTORY"))
(shadow '*ACTION_WARN_START* (find-package "QUADROTOR_MSGS::SPATIALTEMPORALTRAJECTORY"))
(defconstant quadrotor_msgs::SpatialTemporalTrajectory::*ACTION_WARN_START* 3)
(intern "*ACTION_WARN_FINAL*" (find-package "QUADROTOR_MSGS::SPATIALTEMPORALTRAJECTORY"))
(shadow '*ACTION_WARN_FINAL* (find-package "QUADROTOR_MSGS::SPATIALTEMPORALTRAJECTORY"))
(defconstant quadrotor_msgs::SpatialTemporalTrajectory::*ACTION_WARN_FINAL* 4)
(intern "*ACTION_WARN_IMPOSSIBLE*" (find-package "QUADROTOR_MSGS::SPATIALTEMPORALTRAJECTORY"))
(shadow '*ACTION_WARN_IMPOSSIBLE* (find-package "QUADROTOR_MSGS::SPATIALTEMPORALTRAJECTORY"))
(defconstant quadrotor_msgs::SpatialTemporalTrajectory::*ACTION_WARN_IMPOSSIBLE* 5)
(defclass quadrotor_msgs::SpatialTemporalTrajectory
  :super ros::object
  :slots (_header _start_time _final_time _trajectory_id _action _K _K_max _a _b _s _time _time_acc _s_step _num_order _num_segment _start_yaw _final_yaw _coef_x _coef_y _coef_z _range _mag_coeff _order _debug_info ))

(defmethod quadrotor_msgs::SpatialTemporalTrajectory
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:start_time __start_time) (instance ros::time :init))
    ((:final_time __final_time) (instance ros::time :init))
    ((:trajectory_id __trajectory_id) 0)
    ((:action __action) 0)
    ((:K __K) (make-array 0 :initial-element 0 :element-type :integer))
    ((:K_max __K_max) 0)
    ((:a __a) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:b __b) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:s __s) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:time __time) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:time_acc __time_acc) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:s_step __s_step) 0.0)
    ((:num_order __num_order) 0)
    ((:num_segment __num_segment) 0)
    ((:start_yaw __start_yaw) 0.0)
    ((:final_yaw __final_yaw) 0.0)
    ((:coef_x __coef_x) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:coef_y __coef_y) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:coef_z __coef_z) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:range __range) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:mag_coeff __mag_coeff) 0.0)
    ((:order __order) (make-array 0 :initial-element 0 :element-type :integer))
    ((:debug_info __debug_info) "")
    )
   (send-super :init)
   (setq _header __header)
   (setq _start_time __start_time)
   (setq _final_time __final_time)
   (setq _trajectory_id (round __trajectory_id))
   (setq _action (round __action))
   (setq _K __K)
   (setq _K_max (round __K_max))
   (setq _a __a)
   (setq _b __b)
   (setq _s __s)
   (setq _time __time)
   (setq _time_acc __time_acc)
   (setq _s_step (float __s_step))
   (setq _num_order (round __num_order))
   (setq _num_segment (round __num_segment))
   (setq _start_yaw (float __start_yaw))
   (setq _final_yaw (float __final_yaw))
   (setq _coef_x __coef_x)
   (setq _coef_y __coef_y)
   (setq _coef_z __coef_z)
   (setq _range __range)
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
  (:start_time
   (&optional __start_time)
   (if __start_time (setq _start_time __start_time)) _start_time)
  (:final_time
   (&optional __final_time)
   (if __final_time (setq _final_time __final_time)) _final_time)
  (:trajectory_id
   (&optional __trajectory_id)
   (if __trajectory_id (setq _trajectory_id __trajectory_id)) _trajectory_id)
  (:action
   (&optional __action)
   (if __action (setq _action __action)) _action)
  (:K
   (&optional __K)
   (if __K (setq _K __K)) _K)
  (:K_max
   (&optional __K_max)
   (if __K_max (setq _K_max __K_max)) _K_max)
  (:a
   (&optional __a)
   (if __a (setq _a __a)) _a)
  (:b
   (&optional __b)
   (if __b (setq _b __b)) _b)
  (:s
   (&optional __s)
   (if __s (setq _s __s)) _s)
  (:time
   (&optional __time)
   (if __time (setq _time __time)) _time)
  (:time_acc
   (&optional __time_acc)
   (if __time_acc (setq _time_acc __time_acc)) _time_acc)
  (:s_step
   (&optional __s_step)
   (if __s_step (setq _s_step __s_step)) _s_step)
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
  (:range
   (&optional __range)
   (if __range (setq _range __range)) _range)
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
    ;; time _start_time
    8
    ;; time _final_time
    8
    ;; uint32 _trajectory_id
    4
    ;; uint32 _action
    4
    ;; int32[] _K
    (* 4    (length _K)) 4
    ;; int32 _K_max
    4
    ;; float64[] _a
    (* 8    (length _a)) 4
    ;; float64[] _b
    (* 8    (length _b)) 4
    ;; float64[] _s
    (* 8    (length _s)) 4
    ;; float64[] _time
    (* 8    (length _time)) 4
    ;; float64[] _time_acc
    (* 8    (length _time_acc)) 4
    ;; float64 _s_step
    8
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
    ;; float64[] _range
    (* 8    (length _range)) 4
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
     ;; time _start_time
       (write-long (send _start_time :sec) s) (write-long (send _start_time :nsec) s)
     ;; time _final_time
       (write-long (send _final_time :sec) s) (write-long (send _final_time :nsec) s)
     ;; uint32 _trajectory_id
       (write-long _trajectory_id s)
     ;; uint32 _action
       (write-long _action s)
     ;; int32[] _K
     (write-long (length _K) s)
     (dotimes (i (length _K))
       (write-long (elt _K i) s)
       )
     ;; int32 _K_max
       (write-long _K_max s)
     ;; float64[] _a
     (write-long (length _a) s)
     (dotimes (i (length _a))
       (sys::poke (elt _a i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _b
     (write-long (length _b) s)
     (dotimes (i (length _b))
       (sys::poke (elt _b i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _s
     (write-long (length _s) s)
     (dotimes (i (length _s))
       (sys::poke (elt _s i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _time
     (write-long (length _time) s)
     (dotimes (i (length _time))
       (sys::poke (elt _time i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _time_acc
     (write-long (length _time_acc) s)
     (dotimes (i (length _time_acc))
       (sys::poke (elt _time_acc i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64 _s_step
       (sys::poke _s_step (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
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
     ;; float64[] _range
     (write-long (length _range) s)
     (dotimes (i (length _range))
       (sys::poke (elt _range i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
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
   ;; time _start_time
     (send _start_time :sec (sys::peek buf ptr- :integer)) (incf ptr- 4)  (send _start_time :nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; time _final_time
     (send _final_time :sec (sys::peek buf ptr- :integer)) (incf ptr- 4)  (send _final_time :nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _trajectory_id
     (setq _trajectory_id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _action
     (setq _action (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32[] _K
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _K (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _K i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; int32 _K_max
     (setq _K_max (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float64[] _a
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _a (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _a i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _b
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _b (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _b i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _s
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _s (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _s i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _time
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _time (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _time i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _time_acc
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _time_acc (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _time_acc i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64 _s_step
     (setq _s_step (sys::peek buf ptr- :double)) (incf ptr- 8)
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
   ;; float64[] _range
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _range (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _range i) (sys::peek buf ptr- :double)) (incf ptr- 8)
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

(setf (get quadrotor_msgs::SpatialTemporalTrajectory :md5sum-) "83bb3014c3955b8c85e7aaebbe585ea5")
(setf (get quadrotor_msgs::SpatialTemporalTrajectory :datatype-) "quadrotor_msgs/SpatialTemporalTrajectory")
(setf (get quadrotor_msgs::SpatialTemporalTrajectory :definition-)
      "Header header

time start_time
time final_time

# the trajectory id, starts from \"1\".
uint32 trajectory_id

# the action command for trajectory server.
uint32 ACTION_ADD                  =   1
uint32 ACTION_ABORT                =   2
uint32 ACTION_WARN_START           =   3
uint32 ACTION_WARN_FINAL           =   4
uint32 ACTION_WARN_IMPOSSIBLE      =   5
uint32 action

# the vector of all 'K' number of each piece of the time profile.
int32[] K
int32   K_max

# the a, b, c, d parameters of the TOPP time profile.
float64[] a
float64[] b

# useful variables for evaluating time
float64[] s
float64[] time
float64[] time_acc

# delta_s in s domain
float64   s_step

# the order of trajectory.
uint32 num_order
uint32 num_segment

# the polynomial coecfficients of the trajectory.
float64 start_yaw
float64 final_yaw
float64[] coef_x
float64[] coef_y
float64[] coef_z
float64[] range
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



(provide :quadrotor_msgs/SpatialTemporalTrajectory "83bb3014c3955b8c85e7aaebbe585ea5")


