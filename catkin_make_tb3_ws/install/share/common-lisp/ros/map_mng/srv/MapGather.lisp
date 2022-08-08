; Auto-generated. Do not edit!


(cl:in-package map_mng-srv)


;//! \htmlinclude MapGather-request.msg.html

(cl:defclass <MapGather-request> (roslisp-msg-protocol:ros-message)
  ((action
    :reader action
    :initarg :action
    :type cl:string
    :initform "")
   (params
    :reader params
    :initarg :params
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element "")))
)

(cl:defclass MapGather-request (<MapGather-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MapGather-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MapGather-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name map_mng-srv:<MapGather-request> is deprecated: use map_mng-srv:MapGather-request instead.")))

(cl:ensure-generic-function 'action-val :lambda-list '(m))
(cl:defmethod action-val ((m <MapGather-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader map_mng-srv:action-val is deprecated.  Use map_mng-srv:action instead.")
  (action m))

(cl:ensure-generic-function 'params-val :lambda-list '(m))
(cl:defmethod params-val ((m <MapGather-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader map_mng-srv:params-val is deprecated.  Use map_mng-srv:params instead.")
  (params m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MapGather-request>) ostream)
  "Serializes a message object of type '<MapGather-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'action))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'action))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'params))))
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
   (cl:slot-value msg 'params))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MapGather-request>) istream)
  "Deserializes a message object of type '<MapGather-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'action) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'action) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'params) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'params)))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MapGather-request>)))
  "Returns string type for a service object of type '<MapGather-request>"
  "map_mng/MapGatherRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MapGather-request)))
  "Returns string type for a service object of type 'MapGather-request"
  "map_mng/MapGatherRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MapGather-request>)))
  "Returns md5sum for a message object of type '<MapGather-request>"
  "64a91b5e5c6d91090d88bd8d7fda9226")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MapGather-request)))
  "Returns md5sum for a message object of type 'MapGather-request"
  "64a91b5e5c6d91090d88bd8d7fda9226")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MapGather-request>)))
  "Returns full string definition for message of type '<MapGather-request>"
  (cl:format cl:nil "string action~%string[] params~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MapGather-request)))
  "Returns full string definition for message of type 'MapGather-request"
  (cl:format cl:nil "string action~%string[] params~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MapGather-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'action))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'params) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MapGather-request>))
  "Converts a ROS message object to a list"
  (cl:list 'MapGather-request
    (cl:cons ':action (action msg))
    (cl:cons ':params (params msg))
))
;//! \htmlinclude MapGather-response.msg.html

(cl:defclass <MapGather-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:integer
    :initform 0))
)

(cl:defclass MapGather-response (<MapGather-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MapGather-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MapGather-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name map_mng-srv:<MapGather-response> is deprecated: use map_mng-srv:MapGather-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <MapGather-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader map_mng-srv:result-val is deprecated.  Use map_mng-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MapGather-response>) ostream)
  "Serializes a message object of type '<MapGather-response>"
  (cl:let* ((signed (cl:slot-value msg 'result)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MapGather-response>) istream)
  "Deserializes a message object of type '<MapGather-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'result) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MapGather-response>)))
  "Returns string type for a service object of type '<MapGather-response>"
  "map_mng/MapGatherResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MapGather-response)))
  "Returns string type for a service object of type 'MapGather-response"
  "map_mng/MapGatherResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MapGather-response>)))
  "Returns md5sum for a message object of type '<MapGather-response>"
  "64a91b5e5c6d91090d88bd8d7fda9226")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MapGather-response)))
  "Returns md5sum for a message object of type 'MapGather-response"
  "64a91b5e5c6d91090d88bd8d7fda9226")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MapGather-response>)))
  "Returns full string definition for message of type '<MapGather-response>"
  (cl:format cl:nil "int32 result~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MapGather-response)))
  "Returns full string definition for message of type 'MapGather-response"
  (cl:format cl:nil "int32 result~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MapGather-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MapGather-response>))
  "Converts a ROS message object to a list"
  (cl:list 'MapGather-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'MapGather)))
  'MapGather-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'MapGather)))
  'MapGather-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MapGather)))
  "Returns string type for a service object of type '<MapGather>"
  "map_mng/MapGather")