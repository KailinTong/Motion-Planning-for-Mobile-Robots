// Auto-generated. Do not edit!

// (in-package quadrotor_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class PositionCommand {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.position = null;
      this.velocity = null;
      this.acceleration = null;
      this.yaw = null;
      this.yaw_dot = null;
      this.kx = null;
      this.kv = null;
      this.trajectory_id = null;
      this.trajectory_flag = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('position')) {
        this.position = initObj.position
      }
      else {
        this.position = new geometry_msgs.msg.Point();
      }
      if (initObj.hasOwnProperty('velocity')) {
        this.velocity = initObj.velocity
      }
      else {
        this.velocity = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('acceleration')) {
        this.acceleration = initObj.acceleration
      }
      else {
        this.acceleration = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('yaw')) {
        this.yaw = initObj.yaw
      }
      else {
        this.yaw = 0.0;
      }
      if (initObj.hasOwnProperty('yaw_dot')) {
        this.yaw_dot = initObj.yaw_dot
      }
      else {
        this.yaw_dot = 0.0;
      }
      if (initObj.hasOwnProperty('kx')) {
        this.kx = initObj.kx
      }
      else {
        this.kx = new Array(3).fill(0);
      }
      if (initObj.hasOwnProperty('kv')) {
        this.kv = initObj.kv
      }
      else {
        this.kv = new Array(3).fill(0);
      }
      if (initObj.hasOwnProperty('trajectory_id')) {
        this.trajectory_id = initObj.trajectory_id
      }
      else {
        this.trajectory_id = 0;
      }
      if (initObj.hasOwnProperty('trajectory_flag')) {
        this.trajectory_flag = initObj.trajectory_flag
      }
      else {
        this.trajectory_flag = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PositionCommand
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [position]
    bufferOffset = geometry_msgs.msg.Point.serialize(obj.position, buffer, bufferOffset);
    // Serialize message field [velocity]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.velocity, buffer, bufferOffset);
    // Serialize message field [acceleration]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.acceleration, buffer, bufferOffset);
    // Serialize message field [yaw]
    bufferOffset = _serializer.float64(obj.yaw, buffer, bufferOffset);
    // Serialize message field [yaw_dot]
    bufferOffset = _serializer.float64(obj.yaw_dot, buffer, bufferOffset);
    // Check that the constant length array field [kx] has the right length
    if (obj.kx.length !== 3) {
      throw new Error('Unable to serialize array field kx - length must be 3')
    }
    // Serialize message field [kx]
    bufferOffset = _arraySerializer.float64(obj.kx, buffer, bufferOffset, 3);
    // Check that the constant length array field [kv] has the right length
    if (obj.kv.length !== 3) {
      throw new Error('Unable to serialize array field kv - length must be 3')
    }
    // Serialize message field [kv]
    bufferOffset = _arraySerializer.float64(obj.kv, buffer, bufferOffset, 3);
    // Serialize message field [trajectory_id]
    bufferOffset = _serializer.uint32(obj.trajectory_id, buffer, bufferOffset);
    // Serialize message field [trajectory_flag]
    bufferOffset = _serializer.uint8(obj.trajectory_flag, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PositionCommand
    let len;
    let data = new PositionCommand(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [position]
    data.position = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset);
    // Deserialize message field [velocity]
    data.velocity = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [acceleration]
    data.acceleration = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [yaw]
    data.yaw = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [yaw_dot]
    data.yaw_dot = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [kx]
    data.kx = _arrayDeserializer.float64(buffer, bufferOffset, 3)
    // Deserialize message field [kv]
    data.kv = _arrayDeserializer.float64(buffer, bufferOffset, 3)
    // Deserialize message field [trajectory_id]
    data.trajectory_id = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [trajectory_flag]
    data.trajectory_flag = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 141;
  }

  static datatype() {
    // Returns string type for a message object
    return 'quadrotor_msgs/PositionCommand';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '4712f0609ca29a79af79a35ca3e3967a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    geometry_msgs/Point position
    geometry_msgs/Vector3 velocity
    geometry_msgs/Vector3 acceleration
    float64 yaw
    float64 yaw_dot
    float64[3] kx
    float64[3] kv 
    
    uint32 trajectory_id
    
    uint8 TRAJECTORY_STATUS_EMPTY = 0
    uint8 TRAJECTORY_STATUS_READY = 1
    uint8 TRAJECTORY_STATUS_COMPLETED = 3
    uint8 TRAJECTROY_STATUS_ABORT = 4
    uint8 TRAJECTORY_STATUS_ILLEGAL_START = 5
    uint8 TRAJECTORY_STATUS_ILLEGAL_FINAL = 6
    uint8 TRAJECTORY_STATUS_IMPOSSIBLE = 7
    
    # Its ID number will start from 1, allowing you comparing it with 0.
    uint8 trajectory_flag
    
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
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
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
    const resolved = new PositionCommand(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.position !== undefined) {
      resolved.position = geometry_msgs.msg.Point.Resolve(msg.position)
    }
    else {
      resolved.position = new geometry_msgs.msg.Point()
    }

    if (msg.velocity !== undefined) {
      resolved.velocity = geometry_msgs.msg.Vector3.Resolve(msg.velocity)
    }
    else {
      resolved.velocity = new geometry_msgs.msg.Vector3()
    }

    if (msg.acceleration !== undefined) {
      resolved.acceleration = geometry_msgs.msg.Vector3.Resolve(msg.acceleration)
    }
    else {
      resolved.acceleration = new geometry_msgs.msg.Vector3()
    }

    if (msg.yaw !== undefined) {
      resolved.yaw = msg.yaw;
    }
    else {
      resolved.yaw = 0.0
    }

    if (msg.yaw_dot !== undefined) {
      resolved.yaw_dot = msg.yaw_dot;
    }
    else {
      resolved.yaw_dot = 0.0
    }

    if (msg.kx !== undefined) {
      resolved.kx = msg.kx;
    }
    else {
      resolved.kx = new Array(3).fill(0)
    }

    if (msg.kv !== undefined) {
      resolved.kv = msg.kv;
    }
    else {
      resolved.kv = new Array(3).fill(0)
    }

    if (msg.trajectory_id !== undefined) {
      resolved.trajectory_id = msg.trajectory_id;
    }
    else {
      resolved.trajectory_id = 0
    }

    if (msg.trajectory_flag !== undefined) {
      resolved.trajectory_flag = msg.trajectory_flag;
    }
    else {
      resolved.trajectory_flag = 0
    }

    return resolved;
    }
};

// Constants for message
PositionCommand.Constants = {
  TRAJECTORY_STATUS_EMPTY: 0,
  TRAJECTORY_STATUS_READY: 1,
  TRAJECTORY_STATUS_COMPLETED: 3,
  TRAJECTROY_STATUS_ABORT: 4,
  TRAJECTORY_STATUS_ILLEGAL_START: 5,
  TRAJECTORY_STATUS_ILLEGAL_FINAL: 6,
  TRAJECTORY_STATUS_IMPOSSIBLE: 7,
}

module.exports = PositionCommand;
