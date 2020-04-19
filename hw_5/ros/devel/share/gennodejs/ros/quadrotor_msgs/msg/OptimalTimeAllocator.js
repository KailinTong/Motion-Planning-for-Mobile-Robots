// Auto-generated. Do not edit!

// (in-package quadrotor_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class OptimalTimeAllocator {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.start_time = null;
      this.final_time = null;
      this.trajectory_id = null;
      this.action = null;
      this.K = null;
      this.K_max = null;
      this.a = null;
      this.b = null;
      this.s = null;
      this.time = null;
      this.time_acc = null;
      this.s_step = null;
      this.debug_info = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('start_time')) {
        this.start_time = initObj.start_time
      }
      else {
        this.start_time = {secs: 0, nsecs: 0};
      }
      if (initObj.hasOwnProperty('final_time')) {
        this.final_time = initObj.final_time
      }
      else {
        this.final_time = {secs: 0, nsecs: 0};
      }
      if (initObj.hasOwnProperty('trajectory_id')) {
        this.trajectory_id = initObj.trajectory_id
      }
      else {
        this.trajectory_id = 0;
      }
      if (initObj.hasOwnProperty('action')) {
        this.action = initObj.action
      }
      else {
        this.action = 0;
      }
      if (initObj.hasOwnProperty('K')) {
        this.K = initObj.K
      }
      else {
        this.K = [];
      }
      if (initObj.hasOwnProperty('K_max')) {
        this.K_max = initObj.K_max
      }
      else {
        this.K_max = 0;
      }
      if (initObj.hasOwnProperty('a')) {
        this.a = initObj.a
      }
      else {
        this.a = [];
      }
      if (initObj.hasOwnProperty('b')) {
        this.b = initObj.b
      }
      else {
        this.b = [];
      }
      if (initObj.hasOwnProperty('s')) {
        this.s = initObj.s
      }
      else {
        this.s = [];
      }
      if (initObj.hasOwnProperty('time')) {
        this.time = initObj.time
      }
      else {
        this.time = [];
      }
      if (initObj.hasOwnProperty('time_acc')) {
        this.time_acc = initObj.time_acc
      }
      else {
        this.time_acc = [];
      }
      if (initObj.hasOwnProperty('s_step')) {
        this.s_step = initObj.s_step
      }
      else {
        this.s_step = 0.0;
      }
      if (initObj.hasOwnProperty('debug_info')) {
        this.debug_info = initObj.debug_info
      }
      else {
        this.debug_info = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type OptimalTimeAllocator
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [start_time]
    bufferOffset = _serializer.time(obj.start_time, buffer, bufferOffset);
    // Serialize message field [final_time]
    bufferOffset = _serializer.time(obj.final_time, buffer, bufferOffset);
    // Serialize message field [trajectory_id]
    bufferOffset = _serializer.uint32(obj.trajectory_id, buffer, bufferOffset);
    // Serialize message field [action]
    bufferOffset = _serializer.uint32(obj.action, buffer, bufferOffset);
    // Serialize message field [K]
    bufferOffset = _arraySerializer.int32(obj.K, buffer, bufferOffset, null);
    // Serialize message field [K_max]
    bufferOffset = _serializer.int32(obj.K_max, buffer, bufferOffset);
    // Serialize message field [a]
    bufferOffset = _arraySerializer.float64(obj.a, buffer, bufferOffset, null);
    // Serialize message field [b]
    bufferOffset = _arraySerializer.float64(obj.b, buffer, bufferOffset, null);
    // Serialize message field [s]
    bufferOffset = _arraySerializer.float64(obj.s, buffer, bufferOffset, null);
    // Serialize message field [time]
    bufferOffset = _arraySerializer.float64(obj.time, buffer, bufferOffset, null);
    // Serialize message field [time_acc]
    bufferOffset = _arraySerializer.float64(obj.time_acc, buffer, bufferOffset, null);
    // Serialize message field [s_step]
    bufferOffset = _serializer.float64(obj.s_step, buffer, bufferOffset);
    // Serialize message field [debug_info]
    bufferOffset = _serializer.string(obj.debug_info, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type OptimalTimeAllocator
    let len;
    let data = new OptimalTimeAllocator(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [start_time]
    data.start_time = _deserializer.time(buffer, bufferOffset);
    // Deserialize message field [final_time]
    data.final_time = _deserializer.time(buffer, bufferOffset);
    // Deserialize message field [trajectory_id]
    data.trajectory_id = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [action]
    data.action = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [K]
    data.K = _arrayDeserializer.int32(buffer, bufferOffset, null)
    // Deserialize message field [K_max]
    data.K_max = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [a]
    data.a = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [b]
    data.b = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [s]
    data.s = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [time]
    data.time = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [time_acc]
    data.time_acc = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [s_step]
    data.s_step = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [debug_info]
    data.debug_info = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += 4 * object.K.length;
    length += 8 * object.a.length;
    length += 8 * object.b.length;
    length += 8 * object.s.length;
    length += 8 * object.time.length;
    length += 8 * object.time_acc.length;
    length += object.debug_info.length;
    return length + 64;
  }

  static datatype() {
    // Returns string type for a message object
    return 'quadrotor_msgs/OptimalTimeAllocator';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a6b8609f5d139106ef66e171c3643730';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    
    time start_time
    time final_time
    
    # the trajectory id, starts from "1".
    uint32 trajectory_id
    
    # the action command for trajectory server.
    uint32 ACTION_ADD                  =   1
    uint32 ACTION_ABORT                =   2
    uint32 ACTION_WARN_START           =   3
    uint32 ACTION_WARN_FINAL           =   4
    uint32 ACTION_WARN_IMPOSSIBLE      =   5
    uint32 action
    
    # the vector of all 'K' number of each piece of the time profile.
    int32[] K
    int32   K_max
    
    # the a, b, c, d parameters of the TOPP time profile.
    float64[] a
    float64[] b
    
    # useful variables for evaluating time
    float64[] s
    float64[] time
    float64[] time_acc
    
    # delta_s in s domain
    float64   s_step
    
    string debug_info
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
    const resolved = new OptimalTimeAllocator(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.start_time !== undefined) {
      resolved.start_time = msg.start_time;
    }
    else {
      resolved.start_time = {secs: 0, nsecs: 0}
    }

    if (msg.final_time !== undefined) {
      resolved.final_time = msg.final_time;
    }
    else {
      resolved.final_time = {secs: 0, nsecs: 0}
    }

    if (msg.trajectory_id !== undefined) {
      resolved.trajectory_id = msg.trajectory_id;
    }
    else {
      resolved.trajectory_id = 0
    }

    if (msg.action !== undefined) {
      resolved.action = msg.action;
    }
    else {
      resolved.action = 0
    }

    if (msg.K !== undefined) {
      resolved.K = msg.K;
    }
    else {
      resolved.K = []
    }

    if (msg.K_max !== undefined) {
      resolved.K_max = msg.K_max;
    }
    else {
      resolved.K_max = 0
    }

    if (msg.a !== undefined) {
      resolved.a = msg.a;
    }
    else {
      resolved.a = []
    }

    if (msg.b !== undefined) {
      resolved.b = msg.b;
    }
    else {
      resolved.b = []
    }

    if (msg.s !== undefined) {
      resolved.s = msg.s;
    }
    else {
      resolved.s = []
    }

    if (msg.time !== undefined) {
      resolved.time = msg.time;
    }
    else {
      resolved.time = []
    }

    if (msg.time_acc !== undefined) {
      resolved.time_acc = msg.time_acc;
    }
    else {
      resolved.time_acc = []
    }

    if (msg.s_step !== undefined) {
      resolved.s_step = msg.s_step;
    }
    else {
      resolved.s_step = 0.0
    }

    if (msg.debug_info !== undefined) {
      resolved.debug_info = msg.debug_info;
    }
    else {
      resolved.debug_info = ''
    }

    return resolved;
    }
};

// Constants for message
OptimalTimeAllocator.Constants = {
  ACTION_ADD: 1,
  ACTION_ABORT: 2,
  ACTION_WARN_START: 3,
  ACTION_WARN_FINAL: 4,
  ACTION_WARN_IMPOSSIBLE: 5,
}

module.exports = OptimalTimeAllocator;
