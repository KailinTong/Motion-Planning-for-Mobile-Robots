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

class Corrections {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.kf_correction = null;
      this.angle_corrections = null;
    }
    else {
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
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Corrections
    // Serialize message field [kf_correction]
    bufferOffset = _serializer.float64(obj.kf_correction, buffer, bufferOffset);
    // Check that the constant length array field [angle_corrections] has the right length
    if (obj.angle_corrections.length !== 2) {
      throw new Error('Unable to serialize array field angle_corrections - length must be 2')
    }
    // Serialize message field [angle_corrections]
    bufferOffset = _arraySerializer.float64(obj.angle_corrections, buffer, bufferOffset, 2);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Corrections
    let len;
    let data = new Corrections(null);
    // Deserialize message field [kf_correction]
    data.kf_correction = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [angle_corrections]
    data.angle_corrections = _arrayDeserializer.float64(buffer, bufferOffset, 2)
    return data;
  }

  static getMessageSize(object) {
    return 24;
  }

  static datatype() {
    // Returns string type for a message object
    return 'quadrotor_msgs/Corrections';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '61e86887a75fe520847d3256306360f5';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 kf_correction
    float64[2] angle_corrections
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Corrections(null);
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

    return resolved;
    }
};

module.exports = Corrections;
