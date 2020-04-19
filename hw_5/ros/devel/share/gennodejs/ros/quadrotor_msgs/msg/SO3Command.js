// Auto-generated. Do not edit!

// (in-package quadrotor_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let AuxCommand = require('./AuxCommand.js');
let geometry_msgs = _finder('geometry_msgs');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class SO3Command {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.force = null;
      this.orientation = null;
      this.kR = null;
      this.kOm = null;
      this.aux = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('force')) {
        this.force = initObj.force
      }
      else {
        this.force = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('orientation')) {
        this.orientation = initObj.orientation
      }
      else {
        this.orientation = new geometry_msgs.msg.Quaternion();
      }
      if (initObj.hasOwnProperty('kR')) {
        this.kR = initObj.kR
      }
      else {
        this.kR = new Array(3).fill(0);
      }
      if (initObj.hasOwnProperty('kOm')) {
        this.kOm = initObj.kOm
      }
      else {
        this.kOm = new Array(3).fill(0);
      }
      if (initObj.hasOwnProperty('aux')) {
        this.aux = initObj.aux
      }
      else {
        this.aux = new AuxCommand();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SO3Command
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [force]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.force, buffer, bufferOffset);
    // Serialize message field [orientation]
    bufferOffset = geometry_msgs.msg.Quaternion.serialize(obj.orientation, buffer, bufferOffset);
    // Check that the constant length array field [kR] has the right length
    if (obj.kR.length !== 3) {
      throw new Error('Unable to serialize array field kR - length must be 3')
    }
    // Serialize message field [kR]
    bufferOffset = _arraySerializer.float64(obj.kR, buffer, bufferOffset, 3);
    // Check that the constant length array field [kOm] has the right length
    if (obj.kOm.length !== 3) {
      throw new Error('Unable to serialize array field kOm - length must be 3')
    }
    // Serialize message field [kOm]
    bufferOffset = _arraySerializer.float64(obj.kOm, buffer, bufferOffset, 3);
    // Serialize message field [aux]
    bufferOffset = AuxCommand.serialize(obj.aux, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SO3Command
    let len;
    let data = new SO3Command(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [force]
    data.force = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [orientation]
    data.orientation = geometry_msgs.msg.Quaternion.deserialize(buffer, bufferOffset);
    // Deserialize message field [kR]
    data.kR = _arrayDeserializer.float64(buffer, bufferOffset, 3)
    // Deserialize message field [kOm]
    data.kOm = _arrayDeserializer.float64(buffer, bufferOffset, 3)
    // Deserialize message field [aux]
    data.aux = AuxCommand.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 138;
  }

  static datatype() {
    // Returns string type for a message object
    return 'quadrotor_msgs/SO3Command';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a466650b2633e768513aa3bf62383c86';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    geometry_msgs/Vector3 force
    geometry_msgs/Quaternion orientation
    float64[3] kR
    float64[3] kOm
    quadrotor_msgs/AuxCommand aux
    
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
    ================================================================================
    MSG: geometry_msgs/Quaternion
    # This represents an orientation in free space in quaternion form.
    
    float64 x
    float64 y
    float64 z
    float64 w
    
    ================================================================================
    MSG: quadrotor_msgs/AuxCommand
    float64 current_yaw
    float64 kf_correction
    float64[2] angle_corrections# Trims for roll, pitch
    bool enable_motors
    bool use_external_yaw
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SO3Command(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.force !== undefined) {
      resolved.force = geometry_msgs.msg.Vector3.Resolve(msg.force)
    }
    else {
      resolved.force = new geometry_msgs.msg.Vector3()
    }

    if (msg.orientation !== undefined) {
      resolved.orientation = geometry_msgs.msg.Quaternion.Resolve(msg.orientation)
    }
    else {
      resolved.orientation = new geometry_msgs.msg.Quaternion()
    }

    if (msg.kR !== undefined) {
      resolved.kR = msg.kR;
    }
    else {
      resolved.kR = new Array(3).fill(0)
    }

    if (msg.kOm !== undefined) {
      resolved.kOm = msg.kOm;
    }
    else {
      resolved.kOm = new Array(3).fill(0)
    }

    if (msg.aux !== undefined) {
      resolved.aux = AuxCommand.Resolve(msg.aux)
    }
    else {
      resolved.aux = new AuxCommand()
    }

    return resolved;
    }
};

module.exports = SO3Command;
