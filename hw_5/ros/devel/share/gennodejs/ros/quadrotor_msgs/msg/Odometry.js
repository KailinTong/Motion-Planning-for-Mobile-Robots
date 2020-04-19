// Auto-generated. Do not edit!

// (in-package quadrotor_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let nav_msgs = _finder('nav_msgs');

//-----------------------------------------------------------

class Odometry {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.curodom = null;
      this.kfodom = null;
      this.kfid = null;
      this.status = null;
    }
    else {
      if (initObj.hasOwnProperty('curodom')) {
        this.curodom = initObj.curodom
      }
      else {
        this.curodom = new nav_msgs.msg.Odometry();
      }
      if (initObj.hasOwnProperty('kfodom')) {
        this.kfodom = initObj.kfodom
      }
      else {
        this.kfodom = new nav_msgs.msg.Odometry();
      }
      if (initObj.hasOwnProperty('kfid')) {
        this.kfid = initObj.kfid
      }
      else {
        this.kfid = 0;
      }
      if (initObj.hasOwnProperty('status')) {
        this.status = initObj.status
      }
      else {
        this.status = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Odometry
    // Serialize message field [curodom]
    bufferOffset = nav_msgs.msg.Odometry.serialize(obj.curodom, buffer, bufferOffset);
    // Serialize message field [kfodom]
    bufferOffset = nav_msgs.msg.Odometry.serialize(obj.kfodom, buffer, bufferOffset);
    // Serialize message field [kfid]
    bufferOffset = _serializer.uint32(obj.kfid, buffer, bufferOffset);
    // Serialize message field [status]
    bufferOffset = _serializer.uint8(obj.status, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Odometry
    let len;
    let data = new Odometry(null);
    // Deserialize message field [curodom]
    data.curodom = nav_msgs.msg.Odometry.deserialize(buffer, bufferOffset);
    // Deserialize message field [kfodom]
    data.kfodom = nav_msgs.msg.Odometry.deserialize(buffer, bufferOffset);
    // Deserialize message field [kfid]
    data.kfid = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [status]
    data.status = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += nav_msgs.msg.Odometry.getMessageSize(object.curodom);
    length += nav_msgs.msg.Odometry.getMessageSize(object.kfodom);
    return length + 5;
  }

  static datatype() {
    // Returns string type for a message object
    return 'quadrotor_msgs/Odometry';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '94d99f86002b25504a5d3354fa1ad709';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 STATUS_ODOM_VALID=0
    uint8 STATUS_ODOM_INVALID=1
    uint8 STATUS_ODOM_LOOPCLOSURE=2
    
    nav_msgs/Odometry curodom
    nav_msgs/Odometry kfodom
    uint32 kfid
    uint8 status
    
    ================================================================================
    MSG: nav_msgs/Odometry
    # This represents an estimate of a position and velocity in free space.  
    # The pose in this message should be specified in the coordinate frame given by header.frame_id.
    # The twist in this message should be specified in the coordinate frame given by the child_frame_id
    Header header
    string child_frame_id
    geometry_msgs/PoseWithCovariance pose
    geometry_msgs/TwistWithCovariance twist
    
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
    MSG: geometry_msgs/PoseWithCovariance
    # This represents a pose in free space with uncertainty.
    
    Pose pose
    
    # Row-major representation of the 6x6 covariance matrix
    # The orientation parameters use a fixed-axis representation.
    # In order, the parameters are:
    # (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)
    float64[36] covariance
    
    ================================================================================
    MSG: geometry_msgs/Pose
    # A representation of pose in free space, composed of position and orientation. 
    Point position
    Quaternion orientation
    
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
    ================================================================================
    MSG: geometry_msgs/Quaternion
    # This represents an orientation in free space in quaternion form.
    
    float64 x
    float64 y
    float64 z
    float64 w
    
    ================================================================================
    MSG: geometry_msgs/TwistWithCovariance
    # This expresses velocity in free space with uncertainty.
    
    Twist twist
    
    # Row-major representation of the 6x6 covariance matrix
    # The orientation parameters use a fixed-axis representation.
    # In order, the parameters are:
    # (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)
    float64[36] covariance
    
    ================================================================================
    MSG: geometry_msgs/Twist
    # This expresses velocity in free space broken into its linear and angular parts.
    Vector3  linear
    Vector3  angular
    
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
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Odometry(null);
    if (msg.curodom !== undefined) {
      resolved.curodom = nav_msgs.msg.Odometry.Resolve(msg.curodom)
    }
    else {
      resolved.curodom = new nav_msgs.msg.Odometry()
    }

    if (msg.kfodom !== undefined) {
      resolved.kfodom = nav_msgs.msg.Odometry.Resolve(msg.kfodom)
    }
    else {
      resolved.kfodom = new nav_msgs.msg.Odometry()
    }

    if (msg.kfid !== undefined) {
      resolved.kfid = msg.kfid;
    }
    else {
      resolved.kfid = 0
    }

    if (msg.status !== undefined) {
      resolved.status = msg.status;
    }
    else {
      resolved.status = 0
    }

    return resolved;
    }
};

// Constants for message
Odometry.Constants = {
  STATUS_ODOM_VALID: 0,
  STATUS_ODOM_INVALID: 1,
  STATUS_ODOM_LOOPCLOSURE: 2,
}

module.exports = Odometry;
