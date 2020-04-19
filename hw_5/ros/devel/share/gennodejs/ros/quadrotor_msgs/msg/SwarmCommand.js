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
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class SwarmCommand {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.selection = null;
      this.plan = null;
      this.formation = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('selection')) {
        this.selection = initObj.selection
      }
      else {
        this.selection = [];
      }
      if (initObj.hasOwnProperty('plan')) {
        this.plan = initObj.plan
      }
      else {
        this.plan = new nav_msgs.msg.Path();
      }
      if (initObj.hasOwnProperty('formation')) {
        this.formation = initObj.formation
      }
      else {
        this.formation = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SwarmCommand
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [selection]
    bufferOffset = _arraySerializer.int32(obj.selection, buffer, bufferOffset, null);
    // Serialize message field [plan]
    bufferOffset = nav_msgs.msg.Path.serialize(obj.plan, buffer, bufferOffset);
    // Serialize message field [formation]
    bufferOffset = _arraySerializer.float32(obj.formation, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SwarmCommand
    let len;
    let data = new SwarmCommand(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [selection]
    data.selection = _arrayDeserializer.int32(buffer, bufferOffset, null)
    // Deserialize message field [plan]
    data.plan = nav_msgs.msg.Path.deserialize(buffer, bufferOffset);
    // Deserialize message field [formation]
    data.formation = _arrayDeserializer.float32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += 4 * object.selection.length;
    length += nav_msgs.msg.Path.getMessageSize(object.plan);
    length += 4 * object.formation.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'quadrotor_msgs/SwarmCommand';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'fb2553d3cc9aea3fc90865317210e00c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    #data structure
    Header        header
    int32[]       selection
    nav_msgs/Path plan
    float32[]     formation #todo implement related code
    
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
    MSG: nav_msgs/Path
    #An array of poses that represents a Path for a robot to follow
    Header header
    geometry_msgs/PoseStamped[] poses
    
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
    const resolved = new SwarmCommand(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.selection !== undefined) {
      resolved.selection = msg.selection;
    }
    else {
      resolved.selection = []
    }

    if (msg.plan !== undefined) {
      resolved.plan = nav_msgs.msg.Path.Resolve(msg.plan)
    }
    else {
      resolved.plan = new nav_msgs.msg.Path()
    }

    if (msg.formation !== undefined) {
      resolved.formation = msg.formation;
    }
    else {
      resolved.formation = []
    }

    return resolved;
    }
};

module.exports = SwarmCommand;
