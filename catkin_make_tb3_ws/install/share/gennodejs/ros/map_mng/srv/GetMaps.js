// Auto-generated. Do not edit!

// (in-package map_mng.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class GetMapsRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.key = null;
    }
    else {
      if (initObj.hasOwnProperty('key')) {
        this.key = initObj.key
      }
      else {
        this.key = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GetMapsRequest
    // Serialize message field [key]
    bufferOffset = _serializer.int32(obj.key, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetMapsRequest
    let len;
    let data = new GetMapsRequest(null);
    // Deserialize message field [key]
    data.key = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'map_mng/GetMapsRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd5f7d6b16cb4e9d7a81b607f04247968';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 key
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GetMapsRequest(null);
    if (msg.key !== undefined) {
      resolved.key = msg.key;
    }
    else {
      resolved.key = 0
    }

    return resolved;
    }
};

class GetMapsResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.maps = null;
    }
    else {
      if (initObj.hasOwnProperty('maps')) {
        this.maps = initObj.maps
      }
      else {
        this.maps = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GetMapsResponse
    // Serialize message field [maps]
    bufferOffset = _arraySerializer.string(obj.maps, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetMapsResponse
    let len;
    let data = new GetMapsResponse(null);
    // Deserialize message field [maps]
    data.maps = _arrayDeserializer.string(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.maps.forEach((val) => {
      length += 4 + val.length;
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'map_mng/GetMapsResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '58ee13666704003b145a48bfa86142f1';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string[] maps
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GetMapsResponse(null);
    if (msg.maps !== undefined) {
      resolved.maps = msg.maps;
    }
    else {
      resolved.maps = []
    }

    return resolved;
    }
};

module.exports = {
  Request: GetMapsRequest,
  Response: GetMapsResponse,
  md5sum() { return '7e5e87a0d74c663ed90922f6efddb3e3'; },
  datatype() { return 'map_mng/GetMaps'; }
};
