// Auto-generated. Do not edit!

// (in-package quadrotor_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class AuxCommand {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.current_yaw = null;
      this.kf_correction = null;
      this.angle_corrections = null;
      this.enable_motors = null;
      this.use_external_yaw = null;
    }
    else {
      if (initObj.hasOwnProperty('current_yaw')) {
        this.current_yaw = initObj.current_yaw
      }
      else {
        this.current_yaw = 0.0;
      }
      if (initObj.hasOwnProperty('kf_correction')) {
        this.kf_correction = initObj.kf_correction
      }
      else {
        this.kf_correction = 0.0;
      }
      if (initObj.hasOwnProperty('angle_corrections')) {
        this.angle_corrections = initObj.angle_corrections
      }
      else {
        this.angle_corrections = new Array(2).fill(0);
      }
      if (initObj.hasOwnProperty('enable_motors')) {
        this.enable_motors = initObj.enable_motors
      }
      else {
        this.enable_motors = false;
      }
      if (initObj.hasOwnProperty('use_external_yaw')) {
        this.use_external_yaw = initObj.use_external_yaw
      }
      else {
        this.use_external_yaw = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type AuxCommand
    // Serialize message field [current_yaw]
    bufferOffset = _serializer.float64(obj.current_yaw, buffer, bufferOffset);
    // Serialize message field [kf_correction]
    bufferOffset = _serializer.float64(obj.kf_correction, buffer, bufferOffset);
    // Check that the constant length array field [angle_corrections] has the right length
    if (obj.angle_corrections.length !== 2) {
      throw new Error('Unable to serialize array field angle_corrections - length must be 2')
    }
    // Serialize message field [angle_corrections]
    bufferOffset = _arraySerializer.float64(obj.angle_corrections, buffer, bufferOffset, 2);
    // Serialize message field [enable_motors]
    bufferOffset = _serializer.bool(obj.enable_motors, buffer, bufferOffset);
    // Serialize message field [use_external_yaw]
    bufferOffset = _serializer.bool(obj.use_external_yaw, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type AuxCommand
    let len;
    let data = new AuxCommand(null);
    // Deserialize message field [current_yaw]
    data.current_yaw = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [kf_correction]
    data.kf_correction = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [angle_corrections]
    data.angle_corrections = _arrayDeserializer.float64(buffer, bufferOffset, 2)
    // Deserialize message field [enable_motors]
    data.enable_motors = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [use_external_yaw]
    data.use_external_yaw = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 34;
  }

  static datatype() {
    // Returns string type for a message object
    return 'quadrotor_msgs/AuxCommand';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '94f75840e4b1e03675da764692f2c839';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    const resolved = new AuxCommand(null);
    if (msg.current_yaw !== undefined) {
      resolved.current_yaw = msg.current_yaw;
    }
    else {
      resolved.current_yaw = 0.0
    }

    if (msg.kf_correction !== undefined) {
      resolved.kf_correction = msg.kf_correction;
    }
    else {
      resolved.kf_correction = 0.0
    }

    if (msg.angle_corrections !== undefined) {
      resolved.angle_corrections = msg.angle_corrections;
    }
    else {
      resolved.angle_corrections = new Array(2).fill(0)
    }

    if (msg.enable_motors !== undefined) {
      resolved.enable_motors = msg.enable_motors;
    }
    else {
      resolved.enable_motors = false
    }

    if (msg.use_external_yaw !== undefined) {
      resolved.use_external_yaw = msg.use_external_yaw;
    }
    else {
      resolved.use_external_yaw = false
    }

    return resolved;
    }
};

module.exports = AuxCommand;
