// Auto-generated. Do not edit!

// (in-package quadrotor_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let TrajectoryMatrix = require('./TrajectoryMatrix.js');

//-----------------------------------------------------------

class SwarmInfo {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.path = null;
      this.start = null;
    }
    else {
      if (initObj.hasOwnProperty('path')) {
        this.path = initObj.path
      }
      else {
        this.path = new TrajectoryMatrix();
      }
      if (initObj.hasOwnProperty('start')) {
        this.start = initObj.start
      }
      else {
        this.start = {secs: 0, nsecs: 0};
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SwarmInfo
    // Serialize message field [path]
    bufferOffset = TrajectoryMatrix.serialize(obj.path, buffer, bufferOffset);
    // Serialize message field [start]
    bufferOffset = _serializer.time(obj.start, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SwarmInfo
    let len;
    let data = new SwarmInfo(null);
    // Deserialize message field [path]
    data.path = TrajectoryMatrix.deserialize(buffer, bufferOffset);
    // Deserialize message field [start]
    data.start = _deserializer.time(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += TrajectoryMatrix.getMessageSize(object.path);
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'quadrotor_msgs/SwarmInfo';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '908ae631e70132160c2527a9926df867';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    quadrotor_msgs/TrajectoryMatrix path
    time start
    
    ================================================================================
    MSG: quadrotor_msgs/TrajectoryMatrix
    #type
    uint8 TYPE_UNKNOWN = 0
    uint8 TYPE_POLY    = 1
    uint8 TYPE_TIME    = 2
    
    #data structure
    Header    header
    uint8     type
    uint32    id
    string    name
    uint32[]  format
    float64[] data
    
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SwarmInfo(null);
    if (msg.path !== undefined) {
      resolved.path = TrajectoryMatrix.Resolve(msg.path)
    }
    else {
      resolved.path = new TrajectoryMatrix()
    }

    if (msg.start !== undefined) {
      resolved.start = msg.start;
    }
    else {
      resolved.start = {secs: 0, nsecs: 0}
    }

    return resolved;
    }
};

module.exports = SwarmInfo;
