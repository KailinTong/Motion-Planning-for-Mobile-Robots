; Auto-generated. Do not edit!


(cl:in-package quadrotor_msgs-msg)


;//! \htmlinclude ReplanCheck.msg.html

(cl:defclass <ReplanCheck> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (start_velocity
    :reader start_velocity
    :initarg :start_velocity
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (start_acceleration
    :reader start_acceleration
    :initarg :start_acceleration
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (plan_points
    :reader plan_points
    :initarg :plan_points
    :type (cl:vector geometry_msgs-msg:Point)
   :initform (cl:make-array 0 :element-type 'geometry_msgs-msg:Point :initial-element (cl:make-instance 'geometry_msgs-msg:Point)))
   (check_points
    :reader check_points
    :initarg :check_points
    :type (cl:vector geometry_msgs-msg:Point)
   :initform (cl:make-array 0 :element-type 'geometry_msgs-msg:Point :initial-element (cl:make-instance 'geometry_msgs-msg:Point)))
   (stop_velocity
    :reader stop_velocity
    :initarg :stop_velocity
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (stop_acceleration
    :reader stop_acceleration
    :initarg :stop_acceleration
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (replan_time_length
    :reader replan_time_length
    :initarg :replan_time_length
    :type cl:float
    :initform 0.0)
   (check_points_time_interval
    :reader check_points_time_interval
    :initarg :check_points_time_interval
    :type cl:float
    :initform 0.0)
   (plan_points_time_interval
    :reader plan_points_time_interval
    :initarg :plan_points_time_interval
    :type cl:float
    :initform 0.0)
   (trajectory_id
    :reader trajectory_id
    :initarg :trajectory_id
    :type cl:integer
    :initform 0)
   (replan_to_global_time
    :reader replan_to_global_time
    :initarg :replan_to_global_time
    :type cl:float
    :initform 0.0))
)

(cl:defclass ReplanCheck (<ReplanCheck>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ReplanCheck>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ReplanCheck)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name quadrotor_msgs-msg:<ReplanCheck> is deprecated: use quadrotor_msgs-msg:ReplanCheck instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <ReplanCheck>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader quadrotor_msgs-msg:header-val is deprecated.  Use quadrotor_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'start_velocity-val :lambda-list '(m))
(cl:defmethod start_velocity-val ((m <ReplanCheck>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader quadrotor_msgs-msg:start_velocity-val is deprecated.  Use quadrotor_msgs-msg:start_velocity instead.")
  (start_velocity m))

(cl:ensure-generic-function 'start_acceleration-val :lambda-list '(m))
(cl:defmethod start_acceleration-val ((m <ReplanCheck>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader quadrotor_msgs-msg:start_acceleration-val is deprecated.  Use quadrotor_msgs-msg:start_acceleration instead.")
  (start_acceleration m))

(cl:ensure-generic-function 'plan_points-val :lambda-list '(m))
(cl:defmethod plan_points-val ((m <ReplanCheck>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader quadrotor_msgs-msg:plan_points-val is deprecated.  Use quadrotor_msgs-msg:plan_points instead.")
  (plan_points m))

(cl:ensure-generic-function 'check_points-val :lambda-list '(m))
(cl:defmethod check_points-val ((m <ReplanCheck>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader quadrotor_msgs-msg:check_points-val is deprecated.  Use quadrotor_msgs-msg:check_points instead.")
  (check_points m))

(cl:ensure-generic-function 'stop_velocity-val :lambda-list '(m))
(cl:defmethod stop_velocity-val ((m <ReplanCheck>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader quadrotor_msgs-msg:stop_velocity-val is deprecated.  Use quadrotor_msgs-msg:stop_velocity instead.")
  (stop_velocity m))

(cl:ensure-generic-function 'stop_acceleration-val :lambda-list '(m))
(cl:defmethod stop_acceleration-val ((m <ReplanCheck>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader quadrotor_msgs-msg:stop_acceleration-val is deprecated.  Use quadrotor_msgs-msg:stop_acceleration instead.")
  (stop_acceleration m))

(cl:ensure-generic-function 'replan_time_length-val :lambda-list '(m))
(cl:defmethod replan_time_length-val ((m <ReplanCheck>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader quadrotor_msgs-msg:replan_time_length-val is deprecated.  Use quadrotor_msgs-msg:replan_time_length instead.")
  (replan_time_length m))

(cl:ensure-generic-function 'check_points_time_interval-val :lambda-list '(m))
(cl:defmethod check_points_time_interval-val ((m <ReplanCheck>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader quadrotor_msgs-msg:check_points_time_interval-val is deprecated.  Use quadrotor_msgs-msg:check_points_time_interval instead.")
  (check_points_time_interval m))

(cl:ensure-generic-function 'plan_points_time_interval-val :lambda-list '(m))
(cl:defmethod plan_points_time_interval-val ((m <ReplanCheck>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader quadrotor_msgs-msg:plan_points_time_interval-val is deprecated.  Use quadrotor_msgs-msg:plan_points_time_interval instead.")
  (plan_points_time_interval m))

(cl:ensure-generic-function 'trajectory_id-val :lambda-list '(m))
(cl:defmethod trajectory_id-val ((m <ReplanCheck>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader quadrotor_msgs-msg:trajectory_id-val is deprecated.  Use quadrotor_msgs-msg:trajectory_id instead.")
  (trajectory_id m))

(cl:ensure-generic-function 'replan_to_global_time-val :lambda-list '(m))
(cl:defmethod replan_to_global_time-val ((m <ReplanCheck>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader quadrotor_msgs-msg:replan_to_global_time-val is deprecated.  Use quadrotor_msgs-msg:replan_to_global_time instead.")
  (replan_to_global_time m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ReplanCheck>) ostream)
  "Serializes a message object of type '<ReplanCheck>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'start_velocity) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'start_acceleration) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'plan_points))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'plan_points))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'check_points))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'check_points))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'stop_velocity) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'stop_acceleration) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'replan_time_length))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'check_points_time_interval))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'plan_points_time_interval))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'trajectory_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'trajectory_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'trajectory_id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'trajectory_id)) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'replan_to_global_time))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ReplanCheck>) istream)
  "Deserializes a message object of type '<ReplanCheck>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'start_velocity) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'start_acceleration) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'plan_points) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'plan_points)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'geometry_msgs-msg:Point))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'check_points) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'check_points)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'geometry_msgs-msg:Point))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'stop_velocity) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'stop_acceleration) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'replan_time_length) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'check_points_time_interval) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'plan_points_time_interval) (roslisp-utils:decode-double-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'trajectory_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'trajectory_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'trajectory_id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'trajectory_id)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'replan_to_global_time) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ReplanCheck>)))
  "Returns string type for a message object of type '<ReplanCheck>"
  "quadrotor_msgs/ReplanCheck")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ReplanCheck)))
  "Returns string type for a message object of type 'ReplanCheck"
  "quadrotor_msgs/ReplanCheck")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ReplanCheck>)))
  "Returns md5sum for a message object of type '<ReplanCheck>"
  "6a31f08865d3c08f64743e11538e9c4b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ReplanCheck)))
  "Returns md5sum for a message object of type 'ReplanCheck"
  "6a31f08865d3c08f64743e11538e9c4b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ReplanCheck>)))
  "Returns full string definition for message of type '<ReplanCheck>"
  (cl:format cl:nil "Header header~%geometry_msgs/Vector3 start_velocity~%geometry_msgs/Vector3 start_acceleration~%geometry_msgs/Point[] plan_points~%geometry_msgs/Point[] check_points~%geometry_msgs/Vector3 stop_velocity~%geometry_msgs/Vector3 stop_acceleration~%float64               replan_time_length~%float64               check_points_time_interval~%float64               plan_points_time_interval~%uint32                trajectory_id~%float64               replan_to_global_time~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ReplanCheck)))
  "Returns full string definition for message of type 'ReplanCheck"
  (cl:format cl:nil "Header header~%geometry_msgs/Vector3 start_velocity~%geometry_msgs/Vector3 start_acceleration~%geometry_msgs/Point[] plan_points~%geometry_msgs/Point[] check_points~%geometry_msgs/Vector3 stop_velocity~%geometry_msgs/Vector3 stop_acceleration~%float64               replan_time_length~%float64               check_points_time_interval~%float64               plan_points_time_interval~%uint32                trajectory_id~%float64               replan_to_global_time~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ReplanCheck>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'start_velocity))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'start_acceleration))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'plan_points) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'check_points) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'stop_velocity))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'stop_acceleration))
     8
     8
     8
     4
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ReplanCheck>))
  "Converts a ROS message object to a list"
  (cl:list 'ReplanCheck
    (cl:cons ':header (header msg))
    (cl:cons ':start_velocity (start_velocity msg))
    (cl:cons ':start_acceleration (start_acceleration msg))
    (cl:cons ':plan_points (plan_points msg))
    (cl:cons ':check_points (check_points msg))
    (cl:cons ':stop_velocity (stop_velocity msg))
    (cl:cons ':stop_acceleration (stop_acceleration msg))
    (cl:cons ':replan_time_length (replan_time_length msg))
    (cl:cons ':check_points_time_interval (check_points_time_interval msg))
    (cl:cons ':plan_points_time_interval (plan_points_time_interval msg))
    (cl:cons ':trajectory_id (trajectory_id msg))
    (cl:cons ':replan_to_global_time (replan_to_global_time msg))
))
