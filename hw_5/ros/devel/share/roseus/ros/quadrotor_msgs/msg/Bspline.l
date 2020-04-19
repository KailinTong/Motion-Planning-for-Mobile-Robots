;; Auto-generated. Do not edit!


(when (boundp 'quadrotor_msgs::Bspline)
  (if (not (find-package "QUADROTOR_MSGS"))
    (make-package "QUADROTOR_MSGS"))
  (shadow 'Bspline (find-package "QUADROTOR_MSGS")))
(unless (find-package "QUADROTOR_MSGS::BSPLINE")
  (make-package "QUADROTOR_MSGS::BSPLINE"))

(in-package "ROS")
;;//! \htmlinclude Bspline.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(intern "*ACTION_ADD*" (find-package "QUADROTOR_MSGS::BSPLINE"))
(shadow '*ACTION_ADD* (find-package "QUADROTOR_MSGS::BSPLINE"))
(defconstant quadrotor_msgs::Bspline::*ACTION_ADD* 1)
(intern "*ACTION_ABORT*" (find-package "QUADROTOR_MSGS::BSPLINE"))
(shadow '*ACTION_ABORT* (find-package "QUADROTOR_MSGS::BSPLINE"))
(defconstant quadrotor_msgs::Bspline::*ACTION_ABORT* 2)
(intern "*ACTION_WARN_START*" (find-package "QUADROTOR_MSGS::BSPLINE"))
(shadow '*ACTION_WARN_START* (find-package "QUADROTOR_MSGS::BSPLINE"))
(defconstant quadrotor_msgs::Bspline::*ACTION_WARN_START* 3)
(intern "*ACTION_WARN_FINAL*" (find-package "QUADROTOR_MSGS::BSPLINE"))
(shadow '*ACTION_WARN_FINAL* (find-package "QUADROTOR_MSGS::BSPLINE"))
(defconstant quadrotor_msgs::Bspline::*ACTION_WARN_FINAL* 4)
(intern "*ACTION_WARN_IMPOSSIBLE*" (find-package "QUADROTOR_MSGS::BSPLINE"))
(shadow '*ACTION_WARN_IMPOSSIBLE* (find-package "QUADROTOR_MSGS::BSPLINE"))
(defconstant quadrotor_msgs::Bspline::*ACTION_WARN_IMPOSSIBLE* 5)
(defclass quadrotor_msgs::Bspline
  :super ros::object
  :slots (_action _order _traj_id _knots _pts _start_time _time_extra _replan_to_global_time ))

(defmethod quadrotor_msgs::Bspline
  (:init
   (&key
    ((:action __action) 0)
    ((:order __order) 0)
    ((:traj_id __traj_id) 0)
    ((:knots __knots) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:pts __pts) (let (r) (dotimes (i 0) (push (instance geometry_msgs::Point :init) r)) r))
    ((:start_time __start_time) (instance ros::time :init))
    ((:time_extra __time_extra) 0.0)
    ((:replan_to_global_time __replan_to_global_time) 0.0)
    )
   (send-super :init)
   (setq _action (round __action))
   (setq _order (round __order))
   (setq _traj_id (round __traj_id))
   (setq _knots __knots)
   (setq _pts __pts)
   (setq _start_time __start_time)
   (setq _time_extra (float __time_extra))
   (setq _replan_to_global_time (float __replan_to_global_time))
   self)
  (:action
   (&optional __action)
   (if __action (setq _action __action)) _action)
  (:order
   (&optional __order)
   (if __order (setq _order __order)) _order)
  (:traj_id
   (&optional __traj_id)
   (if __traj_id (setq _traj_id __traj_id)) _traj_id)
  (:knots
   (&optional __knots)
   (if __knots (setq _knots __knots)) _knots)
  (:pts
   (&rest __pts)
   (if (keywordp (car __pts))
       (send* _pts __pts)
     (progn
       (if __pts (setq _pts (car __pts)))
       _pts)))
  (:start_time
   (&optional __start_time)
   (if __start_time (setq _start_time __start_time)) _start_time)
  (:time_extra
   (&optional __time_extra)
   (if __time_extra (setq _time_extra __time_extra)) _time_extra)
  (:replan_to_global_time
   (&optional __replan_to_global_time)
   (if __replan_to_global_time (setq _replan_to_global_time __replan_to_global_time)) _replan_to_global_time)
  (:serialization-length
   ()
   (+
    ;; uint32 _action
    4
    ;; int32 _order
    4
    ;; int64 _traj_id
    8
    ;; float64[] _knots
    (* 8    (length _knots)) 4
    ;; geometry_msgs/Point[] _pts
    (apply #'+ (send-all _pts :serialization-length)) 4
    ;; time _start_time
    8
    ;; float64 _time_extra
    8
    ;; float64 _replan_to_global_time
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint32 _action
       (write-long _action s)
     ;; int32 _order
       (write-long _order s)
     ;; int64 _traj_id
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _traj_id (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _traj_id) (= (length (_traj_id . bv)) 2)) ;; bignum
              (write-long (ash (elt (_traj_id . bv) 0) 0) s)
              (write-long (ash (elt (_traj_id . bv) 1) -1) s))
             ((and (class _traj_id) (= (length (_traj_id . bv)) 1)) ;; big1
              (write-long (elt (_traj_id . bv) 0) s)
              (write-long (if (>= _traj_id 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _traj_id s)(write-long (if (>= _traj_id 0) 0 #xffffffff) s)))
     ;; float64[] _knots
     (write-long (length _knots) s)
     (dotimes (i (length _knots))
       (sys::poke (elt _knots i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; geometry_msgs/Point[] _pts
     (write-long (length _pts) s)
     (dolist (elem _pts)
       (send elem :serialize s)
       )
     ;; time _start_time
       (write-long (send _start_time :sec) s) (write-long (send _start_time :nsec) s)
     ;; float64 _time_extra
       (sys::poke _time_extra (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _replan_to_global_time
       (sys::poke _replan_to_global_time (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint32 _action
     (setq _action (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _order
     (setq _order (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int64 _traj_id
#+(or :alpha :irix6 :x86_64)
      (setf _traj_id (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _traj_id (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; float64[] _knots
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _knots (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _knots i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; geometry_msgs/Point[] _pts
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _pts (let (r) (dotimes (i n) (push (instance geometry_msgs::Point :init) r)) r))
     (dolist (elem- _pts)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; time _start_time
     (send _start_time :sec (sys::peek buf ptr- :integer)) (incf ptr- 4)  (send _start_time :nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float64 _time_extra
     (setq _time_extra (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _replan_to_global_time
     (setq _replan_to_global_time (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get quadrotor_msgs::Bspline :md5sum-) "b8380218fb47e65620f86497dd7aa15f")
(setf (get quadrotor_msgs::Bspline :datatype-) "quadrotor_msgs/Bspline")
(setf (get quadrotor_msgs::Bspline :definition-)
      "# the action command for trajectory server.
uint32 ACTION_ADD                  =   1
uint32 ACTION_ABORT                =   2
uint32 ACTION_WARN_START           =   3
uint32 ACTION_WARN_FINAL           =   4
uint32 ACTION_WARN_IMPOSSIBLE      =   5
uint32 action

int32 order
int64 traj_id
float64[] knots
geometry_msgs/Point[] pts
time start_time
float64 time_extra
float64 replan_to_global_time
================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

")



(provide :quadrotor_msgs/Bspline "b8380218fb47e65620f86497dd7aa15f")


