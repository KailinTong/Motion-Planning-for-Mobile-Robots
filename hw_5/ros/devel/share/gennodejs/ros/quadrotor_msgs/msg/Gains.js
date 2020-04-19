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

class Gains {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.Kp = null;
      this.Kd = null;
      this.Kp_yaw = null;
      this.Kd_yaw = null;
    }
    else {
      if (initObj.hasOwnProperty('Kp')) {
        this.Kp = initObj.Kp
      }
      else {
        this.Kp = 0.0;
      }
      if (initObj.hasOwnProperty('Kd')) {
        this.Kd = initObj.Kd
      }
      else {
        this.Kd = 0.0;
      }
      if (initObj.hasOwnProperty('Kp_yaw')) {
        this.Kp_yaw = initObj.Kp_yaw
      }
      else {
        this.Kp_yaw = 0.0;
      }
      if (initObj.hasOwnProperty('Kd_yaw')) {
        this.Kd_yaw = initObj.Kd_yaw
      }
      else {
        this.Kd_yaw = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Gains
    // Serialize message field [Kp]
    bufferOffset = _serializer.float64(obj.Kp, buffer, bufferOffset);
    // Serialize message field [Kd]
    bufferOffset = _serializer.float64(obj.Kd, buffer, bufferOffset);
    // Serialize message field [Kp_yaw]
    bufferOffset = _serializer.float64(obj.Kp_yaw, buffer, bufferOffset);
    // Serialize message field [Kd_yaw]
    bufferOffset = _serializer.float64(obj.Kd_yaw, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Gains
    let len;
    let data = new Gains(null);
    // Deserialize message field [Kp]
    data.Kp = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [Kd]
    data.Kd = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [Kp_yaw]
    data.Kp_yaw = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [Kd_yaw]
    data.Kd_yaw = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 32;
  }

  static datatype() {
    // Returns string type for a message object
    return 'quadrotor_msgs/Gains';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b82763b9f24e5595e2a816aa779c9461';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 Kp
    float64 Kd
    float64 Kp_yaw
    float64 Kd_yaw
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Gains(null);
    if (msg.Kp !== undefined) {
      resolved.Kp = msg.Kp;
    }
    else {
      resolved.Kp = 0.0
    }

    if (msg.Kd !== undefined) {
      resolved.Kd = msg.Kd;
    }
    else {
      resolved.Kd = 0.0
    }

    if (msg.Kp_yaw !== undefined) {
      resolved.Kp_yaw = msg.Kp_yaw;
    }
    else {
      resolved.Kp_yaw = 0.0
    }

    if (msg.Kd_yaw !== undefined) {
      resolved.Kd_yaw = msg.Kd_yaw;
    }
    else {
      resolved.Kd_yaw = 0.0
    }

    return resolved;
    }
};

module.exports = Gains;
