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

//-----------------------------------------------------------

class Bspline {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.action = null;
      this.order = null;
      this.traj_id = null;
      this.knots = null;
      this.pts = null;
      this.start_time = null;
      this.time_extra = null;
      this.replan_to_global_time = null;
    }
    else {
      if (initObj.hasOwnProperty('action')) {
        this.action = initObj.action
      }
      else {
        this.action = 0;
      }
      if (initObj.hasOwnProperty('order')) {
        this.order = initObj.order
      }
      else {
        this.order = 0;
      }
      if (initObj.hasOwnProperty('traj_id')) {
        this.traj_id = initObj.traj_id
      }
      else {
        this.traj_id = 0;
      }
      if (initObj.hasOwnProperty('knots')) {
        this.knots = initObj.knots
      }
      else {
        this.knots = [];
      }
      if (initObj.hasOwnProperty('pts')) {
        this.pts = initObj.pts
      }
      else {
        this.pts = [];
      }
      if (initObj.hasOwnProperty('start_time')) {
        this.start_time = initObj.start_time
      }
      else {
        this.start_time = {secs: 0, nsecs: 0};
      }
      if (initObj.hasOwnProperty('time_extra')) {
        this.time_extra = initObj.time_extra
      }
      else {
        this.time_extra = 0.0;
      }
      if (initObj.hasOwnProperty('replan_to_global_time')) {
        this.replan_to_global_time = initObj.replan_to_global_time
      }
      else {
        this.replan_to_global_time = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Bspline
    // Serialize message field [action]
    bufferOffset = _serializer.uint32(obj.action, buffer, bufferOffset);
    // Serialize message field [order]
    bufferOffset = _serializer.int32(obj.order, buffer, bufferOffset);
    // Serialize message field [traj_id]
    bufferOffset = _serializer.int64(obj.traj_id, buffer, bufferOffset);
    // Serialize message field [knots]
    bufferOffset = _arraySerializer.float64(obj.knots, buffer, bufferOffset, null);
    // Serialize message field [pts]
    // Serialize the length for message field [pts]
    bufferOffset = _serializer.uint32(obj.pts.length, buffer, bufferOffset);
    obj.pts.forEach((val) => {
      bufferOffset = geometry_msgs.msg.Point.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [start_time]
    bufferOffset = _serializer.time(obj.start_time, buffer, bufferOffset);
    // Serialize message field [time_extra]
    bufferOffset = _serializer.float64(obj.time_extra, buffer, bufferOffset);
    // Serialize message field [replan_to_global_time]
    bufferOffset = _serializer.float64(obj.replan_to_global_time, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Bspline
    let len;
    let data = new Bspline(null);
    // Deserialize message field [action]
    data.action = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [order]
    data.order = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [traj_id]
    data.traj_id = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [knots]
    data.knots = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [pts]
    // Deserialize array length for message field [pts]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.pts = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.pts[i] = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [start_time]
    data.start_time = _deserializer.time(buffer, bufferOffset);
    // Deserialize message field [time_extra]
    data.time_extra = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [replan_to_global_time]
    data.replan_to_global_time = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 8 * object.knots.length;
    length += 24 * object.pts.length;
    return length + 48;
  }

  static datatype() {
    // Returns string type for a message object
    return 'quadrotor_msgs/Bspline';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b8380218fb47e65620f86497dd7aa15f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # the action command for trajectory server.
    uint32 ACTION_ADD                  =   1
    uint32 ACTION_ABORT                =   2
    uint32 ACTION_WARN_START           =   3
    uint32 ACTION_WARN_FINAL           =   4
    uint32 ACTION_WARN_IMPOSSIBLE      =   5
    uint32 action
    
    int32 order
    int64 traj_id
    float64[] knots
    geometry_msgs/Point[] pts
    time start_time
    float64 time_extra
    float64 replan_to_global_time
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
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
    const resolved = new Bspline(null);
    if (msg.action !== undefined) {
      resolved.action = msg.action;
    }
    else {
      resolved.action = 0
    }

    if (msg.order !== undefined) {
      resolved.order = msg.order;
    }
    else {
      resolved.order = 0
    }

    if (msg.traj_id !== undefined) {
      resolved.traj_id = msg.traj_id;
    }
    else {
      resolved.traj_id = 0
    }

    if (msg.knots !== undefined) {
      resolved.knots = msg.knots;
    }
    else {
      resolved.knots = []
    }

    if (msg.pts !== undefined) {
      resolved.pts = new Array(msg.pts.length);
      for (let i = 0; i < resolved.pts.length; ++i) {
        resolved.pts[i] = geometry_msgs.msg.Point.Resolve(msg.pts[i]);
      }
    }
    else {
      resolved.pts = []
    }

    if (msg.start_time !== undefined) {
      resolved.start_time = msg.start_time;
    }
    else {
      resolved.start_time = {secs: 0, nsecs: 0}
    }

    if (msg.time_extra !== undefined) {
      resolved.time_extra = msg.time_extra;
    }
    else {
      resolved.time_extra = 0.0
    }

    if (msg.replan_to_global_time !== undefined) {
      resolved.replan_to_global_time = msg.replan_to_global_time;
    }
    else {
      resolved.replan_to_global_time = 0.0
    }

    return resolved;
    }
};

// Constants for message
Bspline.Constants = {
  ACTION_ADD: 1,
  ACTION_ABORT: 2,
  ACTION_WARN_START: 3,
  ACTION_WARN_FINAL: 4,
  ACTION_WARN_IMPOSSIBLE: 5,
}

module.exports = Bspline;
