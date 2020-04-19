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

class PPROutputData {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.quad_time = null;
      this.des_thrust = null;
      this.des_roll = null;
      this.des_pitch = null;
      this.des_yaw = null;
      this.est_roll = null;
      this.est_pitch = null;
      this.est_yaw = null;
      this.est_angvel_x = null;
      this.est_angvel_y = null;
      this.est_angvel_z = null;
      this.est_acc_x = null;
      this.est_acc_y = null;
      this.est_acc_z = null;
      this.pwm = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('quad_time')) {
        this.quad_time = initObj.quad_time
      }
      else {
        this.quad_time = 0;
      }
      if (initObj.hasOwnProperty('des_thrust')) {
        this.des_thrust = initObj.des_thrust
      }
      else {
        this.des_thrust = 0.0;
      }
      if (initObj.hasOwnProperty('des_roll')) {
        this.des_roll = initObj.des_roll
      }
      else {
        this.des_roll = 0.0;
      }
      if (initObj.hasOwnProperty('des_pitch')) {
        this.des_pitch = initObj.des_pitch
      }
      else {
        this.des_pitch = 0.0;
      }
      if (initObj.hasOwnProperty('des_yaw')) {
        this.des_yaw = initObj.des_yaw
      }
      else {
        this.des_yaw = 0.0;
      }
      if (initObj.hasOwnProperty('est_roll')) {
        this.est_roll = initObj.est_roll
      }
      else {
        this.est_roll = 0.0;
      }
      if (initObj.hasOwnProperty('est_pitch')) {
        this.est_pitch = initObj.est_pitch
      }
      else {
        this.est_pitch = 0.0;
      }
      if (initObj.hasOwnProperty('est_yaw')) {
        this.est_yaw = initObj.est_yaw
      }
      else {
        this.est_yaw = 0.0;
      }
      if (initObj.hasOwnProperty('est_angvel_x')) {
        this.est_angvel_x = initObj.est_angvel_x
      }
      else {
        this.est_angvel_x = 0.0;
      }
      if (initObj.hasOwnProperty('est_angvel_y')) {
        this.est_angvel_y = initObj.est_angvel_y
      }
      else {
        this.est_angvel_y = 0.0;
      }
      if (initObj.hasOwnProperty('est_angvel_z')) {
        this.est_angvel_z = initObj.est_angvel_z
      }
      else {
        this.est_angvel_z = 0.0;
      }
      if (initObj.hasOwnProperty('est_acc_x')) {
        this.est_acc_x = initObj.est_acc_x
      }
      else {
        this.est_acc_x = 0.0;
      }
      if (initObj.hasOwnProperty('est_acc_y')) {
        this.est_acc_y = initObj.est_acc_y
      }
      else {
        this.est_acc_y = 0.0;
      }
      if (initObj.hasOwnProperty('est_acc_z')) {
        this.est_acc_z = initObj.est_acc_z
      }
      else {
        this.est_acc_z = 0.0;
      }
      if (initObj.hasOwnProperty('pwm')) {
        this.pwm = initObj.pwm
      }
      else {
        this.pwm = new Array(4).fill(0);
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PPROutputData
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [quad_time]
    bufferOffset = _serializer.uint16(obj.quad_time, buffer, bufferOffset);
    // Serialize message field [des_thrust]
    bufferOffset = _serializer.float64(obj.des_thrust, buffer, bufferOffset);
    // Serialize message field [des_roll]
    bufferOffset = _serializer.float64(obj.des_roll, buffer, bufferOffset);
    // Serialize message field [des_pitch]
    bufferOffset = _serializer.float64(obj.des_pitch, buffer, bufferOffset);
    // Serialize message field [des_yaw]
    bufferOffset = _serializer.float64(obj.des_yaw, buffer, bufferOffset);
    // Serialize message field [est_roll]
    bufferOffset = _serializer.float64(obj.est_roll, buffer, bufferOffset);
    // Serialize message field [est_pitch]
    bufferOffset = _serializer.float64(obj.est_pitch, buffer, bufferOffset);
    // Serialize message field [est_yaw]
    bufferOffset = _serializer.float64(obj.est_yaw, buffer, bufferOffset);
    // Serialize message field [est_angvel_x]
    bufferOffset = _serializer.float64(obj.est_angvel_x, buffer, bufferOffset);
    // Serialize message field [est_angvel_y]
    bufferOffset = _serializer.float64(obj.est_angvel_y, buffer, bufferOffset);
    // Serialize message field [est_angvel_z]
    bufferOffset = _serializer.float64(obj.est_angvel_z, buffer, bufferOffset);
    // Serialize message field [est_acc_x]
    bufferOffset = _serializer.float64(obj.est_acc_x, buffer, bufferOffset);
    // Serialize message field [est_acc_y]
    bufferOffset = _serializer.float64(obj.est_acc_y, buffer, bufferOffset);
    // Serialize message field [est_acc_z]
    bufferOffset = _serializer.float64(obj.est_acc_z, buffer, bufferOffset);
    // Check that the constant length array field [pwm] has the right length
    if (obj.pwm.length !== 4) {
      throw new Error('Unable to serialize array field pwm - length must be 4')
    }
    // Serialize message field [pwm]
    bufferOffset = _arraySerializer.uint16(obj.pwm, buffer, bufferOffset, 4);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PPROutputData
    let len;
    let data = new PPROutputData(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [quad_time]
    data.quad_time = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [des_thrust]
    data.des_thrust = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [des_roll]
    data.des_roll = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [des_pitch]
    data.des_pitch = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [des_yaw]
    data.des_yaw = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [est_roll]
    data.est_roll = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [est_pitch]
    data.est_pitch = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [est_yaw]
    data.est_yaw = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [est_angvel_x]
    data.est_angvel_x = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [est_angvel_y]
    data.est_angvel_y = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [est_angvel_z]
    data.est_angvel_z = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [est_acc_x]
    data.est_acc_x = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [est_acc_y]
    data.est_acc_y = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [est_acc_z]
    data.est_acc_z = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [pwm]
    data.pwm = _arrayDeserializer.uint16(buffer, bufferOffset, 4)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 114;
  }

  static datatype() {
    // Returns string type for a message object
    return 'quadrotor_msgs/PPROutputData';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '732c0e3ca36f241464f8c445e78a0d0a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    uint16 quad_time
    float64 des_thrust
    float64 des_roll
    float64 des_pitch
    float64 des_yaw
    float64 est_roll
    float64 est_pitch
    float64 est_yaw
    float64 est_angvel_x
    float64 est_angvel_y
    float64 est_angvel_z
    float64 est_acc_x
    float64 est_acc_y
    float64 est_acc_z
    uint16[4] pwm
    
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
    const resolved = new PPROutputData(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.quad_time !== undefined) {
      resolved.quad_time = msg.quad_time;
    }
    else {
      resolved.quad_time = 0
    }

    if (msg.des_thrust !== undefined) {
      resolved.des_thrust = msg.des_thrust;
    }
    else {
      resolved.des_thrust = 0.0
    }

    if (msg.des_roll !== undefined) {
      resolved.des_roll = msg.des_roll;
    }
    else {
      resolved.des_roll = 0.0
    }

    if (msg.des_pitch !== undefined) {
      resolved.des_pitch = msg.des_pitch;
    }
    else {
      resolved.des_pitch = 0.0
    }

    if (msg.des_yaw !== undefined) {
      resolved.des_yaw = msg.des_yaw;
    }
    else {
      resolved.des_yaw = 0.0
    }

    if (msg.est_roll !== undefined) {
      resolved.est_roll = msg.est_roll;
    }
    else {
      resolved.est_roll = 0.0
    }

    if (msg.est_pitch !== undefined) {
      resolved.est_pitch = msg.est_pitch;
    }
    else {
      resolved.est_pitch = 0.0
    }

    if (msg.est_yaw !== undefined) {
      resolved.est_yaw = msg.est_yaw;
    }
    else {
      resolved.est_yaw = 0.0
    }

    if (msg.est_angvel_x !== undefined) {
      resolved.est_angvel_x = msg.est_angvel_x;
    }
    else {
      resolved.est_angvel_x = 0.0
    }

    if (msg.est_angvel_y !== undefined) {
      resolved.est_angvel_y = msg.est_angvel_y;
    }
    else {
      resolved.est_angvel_y = 0.0
    }

    if (msg.est_angvel_z !== undefined) {
      resolved.est_angvel_z = msg.est_angvel_z;
    }
    else {
      resolved.est_angvel_z = 0.0
    }

    if (msg.est_acc_x !== undefined) {
      resolved.est_acc_x = msg.est_acc_x;
    }
    else {
      resolved.est_acc_x = 0.0
    }

    if (msg.est_acc_y !== undefined) {
      resolved.est_acc_y = msg.est_acc_y;
    }
    else {
      resolved.est_acc_y = 0.0
    }

    if (msg.est_acc_z !== undefined) {
      resolved.est_acc_z = msg.est_acc_z;
    }
    else {
      resolved.est_acc_z = 0.0
    }

    if (msg.pwm !== undefined) {
      resolved.pwm = msg.pwm;
    }
    else {
      resolved.pwm = new Array(4).fill(0)
    }

    return resolved;
    }
};

module.exports = PPROutputData;
