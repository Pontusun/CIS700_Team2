; Auto-generated. Do not edit!


(cl:in-package snap_vision_msgs-srv)


;//! \htmlinclude Params-request.msg.html

(cl:defclass <Params-request> (roslisp-msg-protocol:ros-message)
  ((filename
    :reader filename
    :initarg :filename
    :type cl:string
    :initform ""))
)

(cl:defclass Params-request (<Params-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Params-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Params-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name snap_vision_msgs-srv:<Params-request> is deprecated: use snap_vision_msgs-srv:Params-request instead.")))

(cl:ensure-generic-function 'filename-val :lambda-list '(m))
(cl:defmethod filename-val ((m <Params-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader snap_vision_msgs-srv:filename-val is deprecated.  Use snap_vision_msgs-srv:filename instead.")
  (filename m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Params-request>) ostream)
  "Serializes a message object of type '<Params-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'filename))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'filename))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Params-request>) istream)
  "Deserializes a message object of type '<Params-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'filename) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'filename) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Params-request>)))
  "Returns string type for a service object of type '<Params-request>"
  "snap_vision_msgs/ParamsRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Params-request)))
  "Returns string type for a service object of type 'Params-request"
  "snap_vision_msgs/ParamsRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Params-request>)))
  "Returns md5sum for a message object of type '<Params-request>"
  "d31226ac986ba51011848f391809440f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Params-request)))
  "Returns md5sum for a message object of type 'Params-request"
  "d31226ac986ba51011848f391809440f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Params-request>)))
  "Returns full string definition for message of type '<Params-request>"
  (cl:format cl:nil "string filename~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Params-request)))
  "Returns full string definition for message of type 'Params-request"
  (cl:format cl:nil "string filename~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Params-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'filename))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Params-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Params-request
    (cl:cons ':filename (filename msg))
))
;//! \htmlinclude Params-response.msg.html

(cl:defclass <Params-response> (roslisp-msg-protocol:ros-message)
  ((error
    :reader error
    :initarg :error
    :type snap_vision_msgs-msg:Error
    :initform (cl:make-instance 'snap_vision_msgs-msg:Error)))
)

(cl:defclass Params-response (<Params-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Params-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Params-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name snap_vision_msgs-srv:<Params-response> is deprecated: use snap_vision_msgs-srv:Params-response instead.")))

(cl:ensure-generic-function 'error-val :lambda-list '(m))
(cl:defmethod error-val ((m <Params-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader snap_vision_msgs-srv:error-val is deprecated.  Use snap_vision_msgs-srv:error instead.")
  (error m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Params-response>) ostream)
  "Serializes a message object of type '<Params-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'error) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Params-response>) istream)
  "Deserializes a message object of type '<Params-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'error) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Params-response>)))
  "Returns string type for a service object of type '<Params-response>"
  "snap_vision_msgs/ParamsResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Params-response)))
  "Returns string type for a service object of type 'Params-response"
  "snap_vision_msgs/ParamsResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Params-response>)))
  "Returns md5sum for a message object of type '<Params-response>"
  "d31226ac986ba51011848f391809440f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Params-response)))
  "Returns md5sum for a message object of type 'Params-response"
  "d31226ac986ba51011848f391809440f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Params-response>)))
  "Returns full string definition for message of type '<Params-response>"
  (cl:format cl:nil "Error error~%~%~%================================================================================~%MSG: snap_vision_msgs/Error~%# Language independent enum constants~%uint16 E_OK                    = 0~%uint16 E_MODEL_NOT_UNLOADED    = 1~%uint16 E_MODEL_NOT_LOADED      = 2~%uint16 E_DETECTOR_NOT_FOUND    = 4~%uint16 E_MODEL_NOT_FOUND       = 8~%uint16 E_FILE_NOT_FOUND        = 16~%uint16 E_STUB                  = 65534~%uint16 E_UNKNOWN_ERROR         = 65535~%~%uint16  err_code~%string err_str~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Params-response)))
  "Returns full string definition for message of type 'Params-response"
  (cl:format cl:nil "Error error~%~%~%================================================================================~%MSG: snap_vision_msgs/Error~%# Language independent enum constants~%uint16 E_OK                    = 0~%uint16 E_MODEL_NOT_UNLOADED    = 1~%uint16 E_MODEL_NOT_LOADED      = 2~%uint16 E_DETECTOR_NOT_FOUND    = 4~%uint16 E_MODEL_NOT_FOUND       = 8~%uint16 E_FILE_NOT_FOUND        = 16~%uint16 E_STUB                  = 65534~%uint16 E_UNKNOWN_ERROR         = 65535~%~%uint16  err_code~%string err_str~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Params-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'error))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Params-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Params-response
    (cl:cons ':error (error msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Params)))
  'Params-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Params)))
  'Params-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Params)))
  "Returns string type for a service object of type '<Params>"
  "snap_vision_msgs/Params")