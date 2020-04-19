;; Auto-generated. Do not edit!


(when (boundp 'quadrotor_msgs::AuxCommand)
  (if (not (find-package "QUADROTOR_MSGS"))
    (make-package "QUADROTOR_MSGS"))
  (shadow 'AuxCommand (find-package "QUADROTOR_MSGS")))
(unless (find-package "QUADROTOR_MSGS::AUXCOMMAND")
  (make-package "QUADROTOR_MSGS::AUXCOMMAND"))

(in-package "ROS")
;;//! \htmlinclude AuxCommand.msg.html


(defclass quadrotor_msgs::AuxCommand
  :super ros::object
  :slots (_current_yaw _kf_correction _angle_corrections _enable_motors _use_external_yaw ))

(defmethod quadrotor_msgs::AuxCommand
  (:init
   (&key
    ((:current_yaw __current_yaw) 0.0)
    ((:kf_correction __kf_correction) 0.0)
    ((:angle_corrections __angle_corrections) (make-array 2 :initial-element 0.0 :element-type :float))
    ((:enable_motors __enable_motors) nil)
    ((:use_external_yaw __use_external_yaw) nil)
    )
   (send-super :init)
   (setq _current_yaw (float __current_yaw))
   (setq _kf_correction (float __kf_correction))
   (setq _angle_corrections __angle_corrections)
   (setq _enable_motors __enable_motors)
   (setq _use_external_yaw __use_external_yaw)
   self)
  (:current_yaw
   (&optional __current_yaw)
   (if __current_yaw (setq _current_yaw __current_yaw)) _current_yaw)
  (:kf_correction
   (&optional __kf_correction)
   (if __kf_correction (setq _kf_correction __kf_correction)) _kf_correction)
  (:angle_corrections
   (&optional __angle_corrections)
   (if __angle_corrections (setq _angle_corrections __angle_corrections)) _angle_corrections)
  (:enable_motors
   (&optional __enable_motors)
   (if __enable_motors (setq _enable_motors __enable_motors)) _enable_motors)
  (:use_external_yaw
   (&optional __use_external_yaw)
   (if __use_external_yaw (setq _use_external_yaw __use_external_yaw)) _use_external_yaw)
  (:serialization-length
   ()
   (+
    ;; float64 _current_yaw
    8
    ;; float64 _kf_correction
    8
    ;; float64[2] _angle_corrections
    (* 8    2)
    ;; bool _enable_motors
    1
    ;; bool _use_external_yaw
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _current_yaw
       (sys::poke _current_yaw (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _kf_correction
       (sys::poke _kf_correction (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64[2] _angle_corrections
     (dotimes (i 2)
       (sys::poke (elt _angle_corrections i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; bool _enable_motors
       (if _enable_motors (write-byte -1 s) (write-byte 0 s))
     ;; bool _use_external_yaw
       (if _use_external_yaw (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _current_yaw
     (setq _current_yaw (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _kf_correction
     (setq _kf_correction (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64[2] _angle_corrections
   (dotimes (i (length _angle_corrections))
     (setf (elt _angle_corrections i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;; bool _enable_motors
     (setq _enable_motors (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _use_external_yaw
     (setq _use_external_yaw (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get quadrotor_msgs::AuxCommand :md5sum-) "94f75840e4b1e03675da764692f2c839")
(setf (get quadrotor_msgs::AuxCommand :datatype-) "quadrotor_msgs/AuxCommand")
(setf (get quadrotor_msgs::AuxCommand :definition-)
      "float64 current_yaw
float64 kf_correction
float64[2] angle_corrections# Trims for roll, pitch
bool enable_motors
bool use_external_yaw

")



(provide :quadrotor_msgs/AuxCommand "94f75840e4b1e03675da764692f2c839")


