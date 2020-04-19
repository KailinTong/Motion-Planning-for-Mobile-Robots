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

class ReplanCheck {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.start_velocity = null;
      this.start_acceleration = null;
      this.plan_points = null;
      this.check_points = null;
      this.stop_velocity = null;
      this.stop_acceleration = null;
      this.replan_time_length = null;
      this.check_points_time_interval = null;
      this.plan_points_time_interval = null;
      this.trajectory_id = null;
      this.replan_to_global_time = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('start_velocity')) {
        this.start_velocity = initObj.start_velocity
      }
      else {
        this.start_velocity = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('start_acceleration')) {
        this.start_acceleration = initObj.start_acceleration
      }
      else {
        this.start_acceleration = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('plan_points')) {
        this.plan_points = initObj.plan_points
      }
      else {
        this.plan_points = [];
      }
      if (initObj.hasOwnProperty('check_points')) {
        this.check_points = initObj.check_points
      }
      else {
        this.check_points = [];
      }
      if (initObj.hasOwnProperty('stop_velocity')) {
        this.stop_velocity = initObj.stop_velocity
      }
      else {
        this.stop_velocity = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('stop_acceleration')) {
        this.stop_acceleration = initObj.stop_acceleration
      }
      else {
        this.stop_acceleration = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('replan_time_length')) {
        this.replan_time_length = initObj.replan_time_length
      }
      else {
        this.replan_time_length = 0.0;
      }
      if (initObj.hasOwnProperty('check_points_time_interval')) {
        this.check_points_time_interval = initObj.check_points_time_interval
      }
      else {
        this.check_points_time_interval = 0.0;
      }
      if (initObj.hasOwnProperty('plan_points_time_interval')) {
        this.plan_points_time_interval = initObj.plan_points_time_interval
      }
      else {
        this.plan_points_time_interval = 0.0;
      }
      if (initObj.hasOwnProperty('trajectory_id')) {
        this.trajectory_id = initObj.trajectory_id
      }
      else {
        this.trajectory_id = 0;
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
    // Serializes a message object of type ReplanCheck
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [start_velocity]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.start_velocity, buffer, bufferOffset);
    // Serialize message field [start_acceleration]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.start_acceleration, buffer, bufferOffset);
    // Serialize message field [plan_points]
    // Serialize the length for message field [plan_points]
    bufferOffset = _serializer.uint32(obj.plan_points.length, buffer, bufferOffset);
    obj.plan_points.forEach((val) => {
      bufferOffset = geometry_msgs.msg.Point.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [check_points]
    // Serialize the length for message field [check_points]
    bufferOffset = _serializer.uint32(obj.check_points.length, buffer, bufferOffset);
    obj.check_points.forEach((val) => {
      bufferOffset = geometry_msgs.msg.Point.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [stop_velocity]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.stop_velocity, buffer, bufferOffset);
    // Serialize message field [stop_acceleration]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.stop_acceleration, buffer, bufferOffset);
    // Serialize message field [replan_time_length]
    bufferOffset = _serializer.float64(obj.replan_time_length, buffer, bufferOffset);
    // Serialize message field [check_points_time_interval]
    bufferOffset = _serializer.float64(obj.check_points_time_interval, buffer, bufferOffset);
    // Serialize message field [plan_points_time_interval]
    bufferOffset = _serializer.float64(obj.plan_points_time_interval, buffer, bufferOffset);
    // Serialize message field [trajectory_id]
    bufferOffset = _serializer.uint32(obj.trajectory_id, buffer, bufferOffset);
    // Serialize message field [replan_to_global_time]
    bufferOffset = _serializer.float64(obj.replan_to_global_time, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ReplanCheck
    let len;
    let data = new ReplanCheck(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [start_velocity]
    data.start_velocity = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [start_acceleration]
    data.start_acceleration = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [plan_points]
    // Deserialize array length for message field [plan_points]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.plan_points = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.plan_points[i] = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [check_points]
    // Deserialize array length for message field [check_points]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.check_points = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.check_points[i] = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [stop_velocity]
    data.stop_velocity = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [stop_acceleration]
    data.stop_acceleration = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [replan_time_length]
    data.replan_time_length = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [check_points_time_interval]
    data.check_points_time_interval = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [plan_points_time_interval]
    data.plan_points_time_interval = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [trajectory_id]
    data.trajectory_id = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [replan_to_global_time]
    data.replan_to_global_time = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += 24 * object.plan_points.length;
    length += 24 * object.check_points.length;
    return length + 140;
  }

  static datatype() {
    // Returns string type for a message object
    return 'quadrotor_msgs/ReplanCheck';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '6a31f08865d3c08f64743e11538e9c4b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    geometry_msgs/Vector3 start_velocity
    geometry_msgs/Vector3 start_acceleration
    geometry_msgs/Point[] plan_points
    geometry_msgs/Point[] check_points
    geometry_msgs/Vector3 stop_velocity
    geometry_msgs/Vector3 stop_acceleration
    float64               replan_time_length
    float64               check_points_time_interval
    float64               plan_points_time_interval
    uint32                trajectory_id
    float64               replan_to_global_time
    
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
    const resolved = new ReplanCheck(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.start_velocity !== undefined) {
      resolved.start_velocity = geometry_msgs.msg.Vector3.Resolve(msg.start_velocity)
    }
    else {
      resolved.start_velocity = new geometry_msgs.msg.Vector3()
    }

    if (msg.start_acceleration !== undefined) {
      resolved.start_acceleration = geometry_msgs.msg.Vector3.Resolve(msg.start_acceleration)
    }
    else {
      resolved.start_acceleration = new geometry_msgs.msg.Vector3()
    }

    if (msg.plan_points !== undefined) {
      resolved.plan_points = new Array(msg.plan_points.length);
      for (let i = 0; i < resolved.plan_points.length; ++i) {
        resolved.plan_points[i] = geometry_msgs.msg.Point.Resolve(msg.plan_points[i]);
      }
    }
    else {
      resolved.plan_points = []
    }

    if (msg.check_points !== undefined) {
      resolved.check_points = new Array(msg.check_points.length);
      for (let i = 0; i < resolved.check_points.length; ++i) {
        resolved.check_points[i] = geometry_msgs.msg.Point.Resolve(msg.check_points[i]);
      }
    }
    else {
      resolved.check_points = []
    }

    if (msg.stop_velocity !== undefined) {
      resolved.stop_velocity = geometry_msgs.msg.Vector3.Resolve(msg.stop_velocity)
    }
    else {
      resolved.stop_velocity = new geometry_msgs.msg.Vector3()
    }

    if (msg.stop_acceleration !== undefined) {
      resolved.stop_acceleration = geometry_msgs.msg.Vector3.Resolve(msg.stop_acceleration)
    }
    else {
      resolved.stop_acceleration = new geometry_msgs.msg.Vector3()
    }

    if (msg.replan_time_length !== undefined) {
      resolved.replan_time_length = msg.replan_time_length;
    }
    else {
      resolved.replan_time_length = 0.0
    }

    if (msg.check_points_time_interval !== undefined) {
      resolved.check_points_time_interval = msg.check_points_time_interval;
    }
    else {
      resolved.check_points_time_interval = 0.0
    }

    if (msg.plan_points_time_interval !== undefined) {
      resolved.plan_points_time_interval = msg.plan_points_time_interval;
    }
    else {
      resolved.plan_points_time_interval = 0.0
    }

    if (msg.trajectory_id !== undefined) {
      resolved.trajectory_id = msg.trajectory_id;
    }
    else {
      resolved.trajectory_id = 0
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

module.exports = ReplanCheck;
