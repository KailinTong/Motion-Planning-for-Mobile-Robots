; Auto-generated. Do not edit!


(cl:in-package quadrotor_msgs-msg)


;//! \htmlinclude Odometry.msg.html

(cl:defclass <Odometry> (roslisp-msg-protocol:ros-message)
  ((curodom
    :reader curodom
    :initarg :curodom
    :type nav_msgs-msg:Odometry
    :initform (cl:make-instance 'nav_msgs-msg:Odometry))
   (kfodom
    :reader kfodom
    :initarg :kfodom
    :type nav_msgs-msg:Odometry
    :initform (cl:make-instance 'nav_msgs-msg:Odometry))
   (kfid
    :reader kfid
    :initarg :kfid
    :type cl:integer
    :initform 0)
   (status
    :reader status
    :initarg :status
    :type cl:fixnum
    :initform 0))
)

(cl:defclass Odometry (<Odometry>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Odometry>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Odometry)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name quadrotor_msgs-msg:<Odometry> is deprecated: use quadrotor_msgs-msg:Odometry instead.")))

(cl:ensure-generic-function 'curodom-val :lambda-list '(m))
(cl:defmethod curodom-val ((m <Odometry>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader quadrotor_msgs-msg:curodom-val is deprecated.  Use quadrotor_msgs-msg:curodom instead.")
  (curodom m))

(cl:ensure-generic-function 'kfodom-val :lambda-list '(m))
(cl:defmethod kfodom-val ((m <Odometry>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader quadrotor_msgs-msg:kfodom-val is deprecated.  Use quadrotor_msgs-msg:kfodom instead.")
  (kfodom m))

(cl:ensure-generic-function 'kfid-val :lambda-list '(m))
(cl:defmethod kfid-val ((m <Odometry>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader quadrotor_msgs-msg:kfid-val is deprecated.  Use quadrotor_msgs-msg:kfid instead.")
  (kfid m))

(cl:ensure-generic-function 'status-val :lambda-list '(m))
(cl:defmethod status-val ((m <Odometry>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader quadrotor_msgs-msg:status-val is deprecated.  Use quadrotor_msgs-msg:status instead.")
  (status m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<Odometry>)))
    "Constants for message type '<Odometry>"
  '((:STATUS_ODOM_VALID . 0)
    (:STATUS_ODOM_INVALID . 1)
    (:STATUS_ODOM_LOOPCLOSURE . 2))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'Odometry)))
    "Constants for message type 'Odometry"
  '((:STATUS_ODOM_VALID . 0)
    (:STATUS_ODOM_INVALID . 1)
    (:STATUS_ODOM_LOOPCLOSURE . 2))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Odometry>) ostream)
  "Serializes a message object of type '<Odometry>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'curodom) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'kfodom) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'kfid)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'kfid)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'kfid)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'kfid)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'status)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Odometry>) istream)
  "Deserializes a message object of type '<Odometry>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'curodom) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'kfodom) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'kfid)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'kfid)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'kfid)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'kfid)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'status)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Odometry>)))
  "Returns string type for a message object of type '<Odometry>"
  "quadrotor_msgs/Odometry")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Odometry)))
  "Returns string type for a message object of type 'Odometry"
  "quadrotor_msgs/Odometry")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Odometry>)))
  "Returns md5sum for a message object of type '<Odometry>"
  "94d99f86002b25504a5d3354fa1ad709")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Odometry)))
  "Returns md5sum for a message object of type 'Odometry"
  "94d99f86002b25504a5d3354fa1ad709")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Odometry>)))
  "Returns full string definition for message of type '<Odometry>"
  (cl:format cl:nil "uint8 STATUS_ODOM_VALID=0~%uint8 STATUS_ODOM_INVALID=1~%uint8 STATUS_ODOM_LOOPCLOSURE=2~%~%nav_msgs/Odometry curodom~%nav_msgs/Odometry kfodom~%uint32 kfid~%uint8 status~%~%================================================================================~%MSG: nav_msgs/Odometry~%# This represents an estimate of a position and velocity in free space.  ~%# The pose in this message should be specified in the coordinate frame given by header.frame_id.~%# The twist in this message should be specified in the coordinate frame given by the child_frame_id~%Header header~%string child_frame_id~%geometry_msgs/PoseWithCovariance pose~%geometry_msgs/TwistWithCovariance twist~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/PoseWithCovariance~%# This represents a pose in free space with uncertainty.~%~%Pose pose~%~%# Row-major representation of the 6x6 covariance matrix~%# The orientation parameters use a fixed-axis representation.~%# In order, the parameters are:~%# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)~%float64[36] covariance~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/TwistWithCovariance~%# This expresses velocity in free space with uncertainty.~%~%Twist twist~%~%# Row-major representation of the 6x6 covariance matrix~%# The orientation parameters use a fixed-axis representation.~%# In order, the parameters are:~%# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)~%float64[36] covariance~%~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Odometry)))
  "Returns full string definition for message of type 'Odometry"
  (cl:format cl:nil "uint8 STATUS_ODOM_VALID=0~%uint8 STATUS_ODOM_INVALID=1~%uint8 STATUS_ODOM_LOOPCLOSURE=2~%~%nav_msgs/Odometry curodom~%nav_msgs/Odometry kfodom~%uint32 kfid~%uint8 status~%~%================================================================================~%MSG: nav_msgs/Odometry~%# This represents an estimate of a position and velocity in free space.  ~%# The pose in this message should be specified in the coordinate frame given by header.frame_id.~%# The twist in this message should be specified in the coordinate frame given by the child_frame_id~%Header header~%string child_frame_id~%geometry_msgs/PoseWithCovariance pose~%geometry_msgs/TwistWithCovariance twist~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/PoseWithCovariance~%# This represents a pose in free space with uncertainty.~%~%Pose pose~%~%# Row-major representation of the 6x6 covariance matrix~%# The orientation parameters use a fixed-axis representation.~%# In order, the parameters are:~%# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)~%float64[36] covariance~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/TwistWithCovariance~%# This expresses velocity in free space with uncertainty.~%~%Twist twist~%~%# Row-major representation of the 6x6 covariance matrix~%# The orientation parameters use a fixed-axis representation.~%# In order, the parameters are:~%# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)~%float64[36] covariance~%~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Odometry>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'curodom))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'kfodom))
     4
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Odometry>))
  "Converts a ROS message object to a list"
  (cl:list 'Odometry
    (cl:cons ':curodom (curodom msg))
    (cl:cons ':kfodom (kfodom msg))
    (cl:cons ':kfid (kfid msg))
    (cl:cons ':status (status msg))
))
