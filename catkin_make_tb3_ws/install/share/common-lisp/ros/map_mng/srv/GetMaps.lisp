; Auto-generated. Do not edit!


(cl:in-package map_mng-srv)


;//! \htmlinclude GetMaps-request.msg.html

(cl:defclass <GetMaps-request> (roslisp-msg-protocol:ros-message)
  ((key
    :reader key
    :initarg :key
    :type cl:integer
    :initform 0))
)

(cl:defclass GetMaps-request (<GetMaps-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetMaps-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetMaps-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name map_mng-srv:<GetMaps-request> is deprecated: use map_mng-srv:GetMaps-request instead.")))

(cl:ensure-generic-function 'key-val :lambda-list '(m))
(cl:defmethod key-val ((m <GetMaps-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader map_mng-srv:key-val is deprecated.  Use map_mng-srv:key instead.")
  (key m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetMaps-request>) ostream)
  "Serializes a message object of type '<GetMaps-request>"
  (cl:let* ((signed (cl:slot-value msg 'key)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetMaps-request>) istream)
  "Deserializes a message object of type '<GetMaps-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'key) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetMaps-request>)))
  "Returns string type for a service object of type '<GetMaps-request>"
  "map_mng/GetMapsRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetMaps-request)))
  "Returns string type for a service object of type 'GetMaps-request"
  "map_mng/GetMapsRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetMaps-request>)))
  "Returns md5sum for a message object of type '<GetMaps-request>"
  "7e5e87a0d74c663ed90922f6efddb3e3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetMaps-request)))
  "Returns md5sum for a message object of type 'GetMaps-request"
  "7e5e87a0d74c663ed90922f6efddb3e3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetMaps-request>)))
  "Returns full string definition for message of type '<GetMaps-request>"
  (cl:format cl:nil "int32 key~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetMaps-request)))
  "Returns full string definition for message of type 'GetMaps-request"
  (cl:format cl:nil "int32 key~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetMaps-request>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetMaps-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GetMaps-request
    (cl:cons ':key (key msg))
))
;//! \htmlinclude GetMaps-response.msg.html

(cl:defclass <GetMaps-response> (roslisp-msg-protocol:ros-message)
  ((maps
    :reader maps
    :initarg :maps
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element "")))
)

(cl:defclass GetMaps-response (<GetMaps-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetMaps-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetMaps-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name map_mng-srv:<GetMaps-response> is deprecated: use map_mng-srv:GetMaps-response instead.")))

(cl:ensure-generic-function 'maps-val :lambda-list '(m))
(cl:defmethod maps-val ((m <GetMaps-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader map_mng-srv:maps-val is deprecated.  Use map_mng-srv:maps instead.")
  (maps m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetMaps-response>) ostream)
  "Serializes a message object of type '<GetMaps-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'maps))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((__ros_str_len (cl:length ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) ele))
   (cl:slot-value msg 'maps))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetMaps-response>) istream)
  "Deserializes a message object of type '<GetMaps-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'maps) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'maps)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetMaps-response>)))
  "Returns string type for a service object of type '<GetMaps-response>"
  "map_mng/GetMapsResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetMaps-response)))
  "Returns string type for a service object of type 'GetMaps-response"
  "map_mng/GetMapsResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetMaps-response>)))
  "Returns md5sum for a message object of type '<GetMaps-response>"
  "7e5e87a0d74c663ed90922f6efddb3e3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetMaps-response)))
  "Returns md5sum for a message object of type 'GetMaps-response"
  "7e5e87a0d74c663ed90922f6efddb3e3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetMaps-response>)))
  "Returns full string definition for message of type '<GetMaps-response>"
  (cl:format cl:nil "string[] maps~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetMaps-response)))
  "Returns full string definition for message of type 'GetMaps-response"
  (cl:format cl:nil "string[] maps~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetMaps-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'maps) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetMaps-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetMaps-response
    (cl:cons ':maps (maps msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetMaps)))
  'GetMaps-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetMaps)))
  'GetMaps-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetMaps)))
  "Returns string type for a service object of type '<GetMaps>"
  "map_mng/GetMaps")