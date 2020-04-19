; Auto-generated. Do not edit!


(cl:in-package quadrotor_msgs-msg)


;//! \htmlinclude Replan.msg.html

(cl:defclass <Replan> (roslisp-msg-protocol:ros-message)
  ((start_velocity
    :reader start_velocity
    :initarg :start_velocity
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (start_acceleration
    :reader start_acceleration
    :initarg :start_acceleration
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (plan
    :reader plan
    :initarg :plan
    :type nav_msgs-msg:Path
    :initform (cl:make-instance 'nav_msgs-msg:Path))
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
   (replan_time
    :reader replan_time
    :initarg :replan_time
    :type cl:float
    :initform 0.0))
)

(cl:defclass Replan (<Replan>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Replan>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Replan)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name quadrotor_msgs-msg:<Replan> is deprecated: use quadrotor_msgs-msg:Replan instead.")))

(cl:ensure-generic-function 'start_velocity-val :lambda-list '(m))
(cl:defmethod start_velocity-val ((m <Replan>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader quadrotor_msgs-msg:start_velocity-val is deprecated.  Use quadrotor_msgs-msg:start_velocity instead.")
  (start_velocity m))

(cl:ensure-generic-function 'start_acceleration-val :lambda-list '(m))
(cl:defmethod start_acceleration-val ((m <Replan>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader quadrotor_msgs-msg:start_acceleration-val is deprecated.  Use quadrotor_msgs-msg:start_acceleration instead.")
  (start_acceleration m))

(cl:ensure-generic-function 'plan-val :lambda-list '(m))
(cl:defmethod plan-val ((m <Replan>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader quadrotor_msgs-msg:plan-val is deprecated.  Use quadrotor_msgs-msg:plan instead.")
  (plan m))

(cl:ensure-generic-function 'stop_velocity-val :lambda-list '(m))
(cl:defmethod stop_velocity-val ((m <Replan>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader quadrotor_msgs-msg:stop_velocity-val is deprecated.  Use quadrotor_msgs-msg:stop_velocity instead.")
  (stop_velocity m))

(cl:ensure-generic-function 'stop_acceleration-val :lambda-list '(m))
(cl:defmethod stop_acceleration-val ((m <Replan>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader quadrotor_msgs-msg:stop_acceleration-val is deprecated.  Use quadrotor_msgs-msg:stop_acceleration instead.")
  (stop_acceleration m))

(cl:ensure-generic-function 'replan_time-val :lambda-list '(m))
(cl:defmethod replan_time-val ((m <Replan>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader quadrotor_msgs-msg:replan_time-val is deprecated.  Use quadrotor_msgs-msg:replan_time instead.")
  (replan_time m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Replan>) ostream)
  "Serializes a message object of type '<Replan>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'start_velocity) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'start_acceleration) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'plan) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'stop_velocity) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'stop_acceleration) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'replan_time))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Replan>) istream)
  "Deserializes a message object of type '<Replan>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'start_velocity) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'start_acceleration) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'plan) istream)
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
    (cl:setf (cl:slot-value msg 'replan_time) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Replan>)))
  "Returns string type for a message object of type '<Replan>"
  "quadrotor_msgs/Replan")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Replan)))
  "Returns string type for a message object of type 'Replan"
  "quadrotor_msgs/Replan")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Replan>)))
  "Returns md5sum for a message object of type '<Replan>"
  "73a17ace4b8b54cf9b4974fbea003b7f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Replan)))
  "Returns md5sum for a message object of type 'Replan"
  "73a17ace4b8b54cf9b4974fbea003b7f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Replan>)))
  "Returns full string definition for message of type '<Replan>"
  (cl:format cl:nil "#data structure~%geometry_msgs/Vector3 start_velocity~%geometry_msgs/Vector3 start_acceleration~%nav_msgs/Path         plan~%geometry_msgs/Vector3 stop_velocity~%geometry_msgs/Vector3 stop_acceleration~%float64               replan_time~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: nav_msgs/Path~%#An array of poses that represents a Path for a robot to follow~%Header header~%geometry_msgs/PoseStamped[] poses~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Replan)))
  "Returns full string definition for message of type 'Replan"
  (cl:format cl:nil "#data structure~%geometry_msgs/Vector3 start_velocity~%geometry_msgs/Vector3 start_acceleration~%nav_msgs/Path         plan~%geometry_msgs/Vector3 stop_velocity~%geometry_msgs/Vector3 stop_acceleration~%float64               replan_time~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: nav_msgs/Path~%#An array of poses that represents a Path for a robot to follow~%Header header~%geometry_msgs/PoseStamped[] poses~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Replan>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'start_velocity))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'start_acceleration))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'plan))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'stop_velocity))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'stop_acceleration))
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Replan>))
  "Converts a ROS message object to a list"
  (cl:list 'Replan
    (cl:cons ':start_velocity (start_velocity msg))
    (cl:cons ':start_acceleration (start_acceleration msg))
    (cl:cons ':plan (plan msg))
    (cl:cons ':stop_velocity (stop_velocity msg))
    (cl:cons ':stop_acceleration (stop_acceleration msg))
    (cl:cons ':replan_time (replan_time msg))
))
