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

class OutputData {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.loop_rate = null;
      this.voltage = null;
      this.orientation = null;
      this.angular_velocity = null;
      this.linear_acceleration = null;
      this.pressure_dheight = null;
      this.pressure_height = null;
      this.magnetic_field = null;
      this.radio_channel = null;
      this.seq = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('loop_rate')) {
        this.loop_rate = initObj.loop_rate
      }
      else {
        this.loop_rate = 0;
      }
      if (initObj.hasOwnProperty('voltage')) {
        this.voltage = initObj.voltage
      }
      else {
        this.voltage = 0.0;
      }
      if (initObj.hasOwnProperty('orientation')) {
        this.orientation = initObj.orientation
      }
      else {
        this.orientation = new geometry_msgs.msg.Quaternion();
      }
      if (initObj.hasOwnProperty('angular_velocity')) {
        this.angular_velocity = initObj.angular_velocity
      }
      else {
        this.angular_velocity = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('linear_acceleration')) {
        this.linear_acceleration = initObj.linear_acceleration
      }
      else {
        this.linear_acceleration = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('pressure_dheight')) {
        this.pressure_dheight = initObj.pressure_dheight
      }
      else {
        this.pressure_dheight = 0.0;
      }
      if (initObj.hasOwnProperty('pressure_height')) {
        this.pressure_height = initObj.pressure_height
      }
      else {
        this.pressure_height = 0.0;
      }
      if (initObj.hasOwnProperty('magnetic_field')) {
        this.magnetic_field = initObj.magnetic_field
      }
      else {
        this.magnetic_field = new geometry_msgs.msg.Vector3();
      }
      if (initObj.hasOwnProperty('radio_channel')) {
        this.radio_channel = initObj.radio_channel
      }
      else {
        this.radio_channel = new Array(8).fill(0);
      }
      if (initObj.hasOwnProperty('seq')) {
        this.seq = initObj.seq
      }
      else {
        this.seq = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type OutputData
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [loop_rate]
    bufferOffset = _serializer.uint16(obj.loop_rate, buffer, bufferOffset);
    // Serialize message field [voltage]
    bufferOffset = _serializer.float64(obj.voltage, buffer, bufferOffset);
    // Serialize message field [orientation]
    bufferOffset = geometry_msgs.msg.Quaternion.serialize(obj.orientation, buffer, bufferOffset);
    // Serialize message field [angular_velocity]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.angular_velocity, buffer, bufferOffset);
    // Serialize message field [linear_acceleration]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.linear_acceleration, buffer, bufferOffset);
    // Serialize message field [pressure_dheight]
    bufferOffset = _serializer.float64(obj.pressure_dheight, buffer, bufferOffset);
    // Serialize message field [pressure_height]
    bufferOffset = _serializer.float64(obj.pressure_height, buffer, bufferOffset);
    // Serialize message field [magnetic_field]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.magnetic_field, buffer, bufferOffset);
    // Check that the constant length array field [radio_channel] has the right length
    if (obj.radio_channel.length !== 8) {
      throw new Error('Unable to serialize array field radio_channel - length must be 8')
    }
    // Serialize message field [radio_channel]
    bufferOffset = _arraySerializer.uint8(obj.radio_channel, buffer, bufferOffset, 8);
    // Serialize message field [seq]
    bufferOffset = _serializer.uint8(obj.seq, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type OutputData
    let len;
    let data = new OutputData(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [loop_rate]
    data.loop_rate = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [voltage]
    data.voltage = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [orientation]
    data.orientation = geometry_msgs.msg.Quaternion.deserialize(buffer, bufferOffset);
    // Deserialize message field [angular_velocity]
    data.angular_velocity = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [linear_acceleration]
    data.linear_acceleration = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [pressure_dheight]
    data.pressure_dheight = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [pressure_height]
    data.pressure_height = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [magnetic_field]
    data.magnetic_field = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    // Deserialize message field [radio_channel]
    data.radio_channel = _arrayDeserializer.uint8(buffer, bufferOffset, 8)
    // Deserialize message field [seq]
    data.seq = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 139;
  }

  static datatype() {
    // Returns string type for a message object
    return 'quadrotor_msgs/OutputData';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '5759ee97fd5c090dcdccf7fc3e50d024';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    uint16 loop_rate
    float64 voltage
    geometry_msgs/Quaternion orientation
    geometry_msgs/Vector3 angular_velocity
    geometry_msgs/Vector3 linear_acceleration
    float64 pressure_dheight
    float64 pressure_height
    geometry_msgs/Vector3 magnetic_field
    uint8[8] radio_channel
    #uint8[4] motor_rpm
    uint8 seq
    
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
    MSG: geometry_msgs/Quaternion
    # This represents an orientation in free space in quaternion form.
    
    float64 x
    float64 y
    float64 z
    float64 w
    
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
    const resolved = new OutputData(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.loop_rate !== undefined) {
      resolved.loop_rate = msg.loop_rate;
    }
    else {
      resolved.loop_rate = 0
    }

    if (msg.voltage !== undefined) {
      resolved.voltage = msg.voltage;
    }
    else {
      resolved.voltage = 0.0
    }

    if (msg.orientation !== undefined) {
      resolved.orientation = geometry_msgs.msg.Quaternion.Resolve(msg.orientation)
    }
    else {
      resolved.orientation = new geometry_msgs.msg.Quaternion()
    }

    if (msg.angular_velocity !== undefined) {
      resolved.angular_velocity = geometry_msgs.msg.Vector3.Resolve(msg.angular_velocity)
    }
    else {
      resolved.angular_velocity = new geometry_msgs.msg.Vector3()
    }

    if (msg.linear_acceleration !== undefined) {
      resolved.linear_acceleration = geometry_msgs.msg.Vector3.Resolve(msg.linear_acceleration)
    }
    else {
      resolved.linear_acceleration = new geometry_msgs.msg.Vector3()
    }

    if (msg.pressure_dheight !== undefined) {
      resolved.pressure_dheight = msg.pressure_dheight;
    }
    else {
      resolved.pressure_dheight = 0.0
    }

    if (msg.pressure_height !== undefined) {
      resolved.pressure_height = msg.pressure_height;
    }
    else {
      resolved.pressure_height = 0.0
    }

    if (msg.magnetic_field !== undefined) {
      resolved.magnetic_field = geometry_msgs.msg.Vector3.Resolve(msg.magnetic_field)
    }
    else {
      resolved.magnetic_field = new geometry_msgs.msg.Vector3()
    }

    if (msg.radio_channel !== undefined) {
      resolved.radio_channel = msg.radio_channel;
    }
    else {
      resolved.radio_channel = new Array(8).fill(0)
    }

    if (msg.seq !== undefined) {
      resolved.seq = msg.seq;
    }
    else {
      resolved.seq = 0
    }

    return resolved;
    }
};

module.exports = OutputData;
