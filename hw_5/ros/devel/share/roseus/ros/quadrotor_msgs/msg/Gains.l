;; Auto-generated. Do not edit!


(when (boundp 'quadrotor_msgs::Gains)
  (if (not (find-package "QUADROTOR_MSGS"))
    (make-package "QUADROTOR_MSGS"))
  (shadow 'Gains (find-package "QUADROTOR_MSGS")))
(unless (find-package "QUADROTOR_MSGS::GAINS")
  (make-package "QUADROTOR_MSGS::GAINS"))

(in-package "ROS")
;;//! \htmlinclude Gains.msg.html


(defclass quadrotor_msgs::Gains
  :super ros::object
  :slots (_Kp _Kd _Kp_yaw _Kd_yaw ))

(defmethod quadrotor_msgs::Gains
  (:init
   (&key
    ((:Kp __Kp) 0.0)
    ((:Kd __Kd) 0.0)
    ((:Kp_yaw __Kp_yaw) 0.0)
    ((:Kd_yaw __Kd_yaw) 0.0)
    )
   (send-super :init)
   (setq _Kp (float __Kp))
   (setq _Kd (float __Kd))
   (setq _Kp_yaw (float __Kp_yaw))
   (setq _Kd_yaw (float __Kd_yaw))
   self)
  (:Kp
   (&optional __Kp)
   (if __Kp (setq _Kp __Kp)) _Kp)
  (:Kd
   (&optional __Kd)
   (if __Kd (setq _Kd __Kd)) _Kd)
  (:Kp_yaw
   (&optional __Kp_yaw)
   (if __Kp_yaw (setq _Kp_yaw __Kp_yaw)) _Kp_yaw)
  (:Kd_yaw
   (&optional __Kd_yaw)
   (if __Kd_yaw (setq _Kd_yaw __Kd_yaw)) _Kd_yaw)
  (:serialization-length
   ()
   (+
    ;; float64 _Kp
    8
    ;; float64 _Kd
    8
    ;; float64 _Kp_yaw
    8
    ;; float64 _Kd_yaw
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _Kp
       (sys::poke _Kp (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _Kd
       (sys::poke _Kd (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _Kp_yaw
       (sys::poke _Kp_yaw (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _Kd_yaw
       (sys::poke _Kd_yaw (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _Kp
     (setq _Kp (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _Kd
     (setq _Kd (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _Kp_yaw
     (setq _Kp_yaw (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _Kd_yaw
     (setq _Kd_yaw (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get quadrotor_msgs::Gains :md5sum-) "b82763b9f24e5595e2a816aa779c9461")
(setf (get quadrotor_msgs::Gains :datatype-) "quadrotor_msgs/Gains")
(setf (get quadrotor_msgs::Gains :definition-)
      "float64 Kp
float64 Kd
float64 Kp_yaw
float64 Kd_yaw

")



(provide :quadrotor_msgs/Gains "b82763b9f24e5595e2a816aa779c9461")


