; Auto-generated. Do not edit!


(cl:in-package quadrotor_msgs-msg)


;//! \htmlinclude SwarmInfo.msg.html

(cl:defclass <SwarmInfo> (roslisp-msg-protocol:ros-message)
  ((path
    :reader path
    :initarg :path
    :type quadrotor_msgs-msg:TrajectoryMatrix
    :initform (cl:make-instance 'quadrotor_msgs-msg:TrajectoryMatrix))
   (start
    :reader start
    :initarg :start
    :type cl:real
    :initform 0))
)

(cl:defclass SwarmInfo (<SwarmInfo>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SwarmInfo>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SwarmInfo)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name quadrotor_msgs-msg:<SwarmInfo> is deprecated: use quadrotor_msgs-msg:SwarmInfo instead.")))

(cl:ensure-generic-function 'path-val :lambda-list '(m))
(cl:defmethod path-val ((m <SwarmInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader quadrotor_msgs-msg:path-val is deprecated.  Use quadrotor_msgs-msg:path instead.")
  (path m))

(cl:ensure-generic-function 'start-val :lambda-list '(m))
(cl:defmethod start-val ((m <SwarmInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader quadrotor_msgs-msg:start-val is deprecated.  Use quadrotor_msgs-msg:start instead.")
  (start m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SwarmInfo>) ostream)
  "Serializes a message object of type '<SwarmInfo>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'path) ostream)
  (cl:let ((__sec (cl:floor (cl:slot-value msg 'start)))
        (__nsec (cl:round (cl:* 1e9 (cl:- (cl:slot-value msg 'start) (cl:floor (cl:slot-value msg 'start)))))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 0) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __nsec) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SwarmInfo>) istream)
  "Deserializes a message object of type '<SwarmInfo>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'path) istream)
    (cl:let ((__sec 0) (__nsec 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 0) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __nsec) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'start) (cl:+ (cl:coerce __sec 'cl:double-float) (cl:/ __nsec 1e9))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SwarmInfo>)))
  "Returns string type for a message object of type '<SwarmInfo>"
  "quadrotor_msgs/SwarmInfo")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SwarmInfo)))
  "Returns string type for a message object of type 'SwarmInfo"
  "quadrotor_msgs/SwarmInfo")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SwarmInfo>)))
  "Returns md5sum for a message object of type '<SwarmInfo>"
  "908ae631e70132160c2527a9926df867")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SwarmInfo)))
  "Returns md5sum for a message object of type 'SwarmInfo"
  "908ae631e70132160c2527a9926df867")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SwarmInfo>)))
  "Returns full string definition for message of type '<SwarmInfo>"
  (cl:format cl:nil "quadrotor_msgs/TrajectoryMatrix path~%time start~%~%================================================================================~%MSG: quadrotor_msgs/TrajectoryMatrix~%#type~%uint8 TYPE_UNKNOWN = 0~%uint8 TYPE_POLY    = 1~%uint8 TYPE_TIME    = 2~%~%#data structure~%Header    header~%uint8     type~%uint32    id~%string    name~%uint32[]  format~%float64[] data~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SwarmInfo)))
  "Returns full string definition for message of type 'SwarmInfo"
  (cl:format cl:nil "quadrotor_msgs/TrajectoryMatrix path~%time start~%~%================================================================================~%MSG: quadrotor_msgs/TrajectoryMatrix~%#type~%uint8 TYPE_UNKNOWN = 0~%uint8 TYPE_POLY    = 1~%uint8 TYPE_TIME    = 2~%~%#data structure~%Header    header~%uint8     type~%uint32    id~%string    name~%uint32[]  format~%float64[] data~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SwarmInfo>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'path))
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SwarmInfo>))
  "Converts a ROS message object to a list"
  (cl:list 'SwarmInfo
    (cl:cons ':path (path msg))
    (cl:cons ':start (start msg))
))
