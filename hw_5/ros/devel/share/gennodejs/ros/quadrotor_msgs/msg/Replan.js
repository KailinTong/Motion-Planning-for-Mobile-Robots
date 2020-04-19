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
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class Replan {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.start_velocity = null;
      this.start_acceleration = null;
      this.plan = null;
      this.stop_velocity = null;
      this.stop_acceleration = null;
      this.replan_time = null;
    }
    else {
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
      if (initObj.hasOwnProperty('plan')) {
        this.plan = initObj.plan
      }
      else {
        this.plan = new nav_msgs.msg.Path();
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
      if (initObj.hasOwnProperty('replan_time')) {
        this.replan_time = initObj.replan_time
      }
      else {
        this.replan_time = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Replan
    // Serialize message field [start_velocity]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.start_velocity, buffer, bufferOffset);
    // Serialize message field [start_acceleration]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.start_acceleration, buffer, bufferOffset);
    // Serialize message field [plan]
    bufferOffset = nav_msgs.msg.Path.serialize(obj.plan, buffer, bufferOffset);
    // Serialize message field [stop_velocity]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.stop_velocity, buffer, bufferOffset);
    // Serialize message field [stop_acceleration]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.stop_acceleration, buffer, bufferOffset);
    // Serialize message field [replan_time]
    bufferOffset = _serializer.float64(obj.replan_time, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Replan
    let len;
    let data = new Replan(null);
    // Deserialize message field [start_velocity]
    data.start_velocity = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [start_acceleration]
    data.start_acceleration = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [plan]
    data.plan = nav_msgs.msg.Path.deserialize(buffer, bufferOffset);
    // Deserialize message field [stop_velocity]
    data.stop_velocity = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [stop_acceleration]
    data.stop_acceleration = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [replan_time]
    data.replan_time = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += nav_msgs.msg.Path.getMessageSize(object.plan);
    return length + 104;
  }

  static datatype() {
    // Returns string type for a message object
    return 'quadrotor_msgs/Replan';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '73a17ace4b8b54cf9b4974fbea003b7f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    #data structure
    geometry_msgs/Vector3 start_velocity
    geometry_msgs/Vector3 start_acceleration
    nav_msgs/Path         plan
    geometry_msgs/Vector3 stop_velocity
    geometry_msgs/Vector3 stop_acceleration
    float64               replan_time
    
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
    MSG: nav_msgs/Path
    #An array of poses that represents a Path for a robot to follow
    Header header
    geometry_msgs/PoseStamped[] poses
    
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
    MSG: geometry_msgs/PoseStamped
    # A Pose with reference coordinate frame and timestamp
    Header header
    Pose pose
    
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Replan(null);
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

    if (msg.plan !== undefined) {
      resolved.plan = nav_msgs.msg.Path.Resolve(msg.plan)
    }
    else {
      resolved.plan = new nav_msgs.msg.Path()
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

    if (msg.replan_time !== undefined) {
      resolved.replan_time = msg.replan_time;
    }
    else {
      resolved.replan_time = 0.0
    }

    return resolved;
    }
};

module.exports = Replan;
