; Auto-generated. Do not edit!


(cl:in-package snap_vision_msgs-srv)


;//! \htmlinclude Detector-request.msg.html

(cl:defclass <Detector-request> (roslisp-msg-protocol:ros-message)
  ((type
    :reader type
    :initarg :type
    :type cl:string
    :initform ""))
)

(cl:defclass Detector-request (<Detector-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Detector-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Detector-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name snap_vision_msgs-srv:<Detector-request> is deprecated: use snap_vision_msgs-srv:Detector-request instead.")))

(cl:ensure-generic-function 'type-val :lambda-list '(m))
(cl:defmethod type-val ((m <Detector-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader snap_vision_msgs-srv:type-val is deprecated.  Use snap_vision_msgs-srv:type instead.")
  (type m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Detector-request>) ostream)
  "Serializes a message object of type '<Detector-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'type))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'type))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Detector-request>) istream)
  "Deserializes a message object of type '<Detector-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'type) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'type) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Detector-request>)))
  "Returns string type for a service object of type '<Detector-request>"
  "snap_vision_msgs/DetectorRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Detector-request)))
  "Returns string type for a service object of type 'Detector-request"
  "snap_vision_msgs/DetectorRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Detector-request>)))
  "Returns md5sum for a message object of type '<Detector-request>"
  "828d12a4038cc11efb50c3781f23f856")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Detector-request)))
  "Returns md5sum for a message object of type 'Detector-request"
  "828d12a4038cc11efb50c3781f23f856")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Detector-request>)))
  "Returns full string definition for message of type '<Detector-request>"
  (cl:format cl:nil "~%string type~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Detector-request)))
  "Returns full string definition for message of type 'Detector-request"
  (cl:format cl:nil "~%string type~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Detector-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'type))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Detector-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Detector-request
    (cl:cons ':type (type msg))
))
;//! \htmlinclude Detector-response.msg.html

(cl:defclass <Detector-response> (roslisp-msg-protocol:ros-message)
  ((error
    :reader error
    :initarg :error
    :type snap_vision_msgs-msg:Error
    :initform (cl:make-instance 'snap_vision_msgs-msg:Error)))
)

(cl:defclass Detector-response (<Detector-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Detector-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Detector-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name snap_vision_msgs-srv:<Detector-response> is deprecated: use snap_vision_msgs-srv:Detector-response instead.")))

(cl:ensure-generic-function 'error-val :lambda-list '(m))
(cl:defmethod error-val ((m <Detector-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader snap_vision_msgs-srv:error-val is deprecated.  Use snap_vision_msgs-srv:error instead.")
  (error m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Detector-response>) ostream)
  "Serializes a message object of type '<Detector-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'error) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Detector-response>) istream)
  "Deserializes a message object of type '<Detector-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'error) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Detector-response>)))
  "Returns string type for a service object of type '<Detector-response>"
  "snap_vision_msgs/DetectorResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Detector-response)))
  "Returns string type for a service object of type 'Detector-response"
  "snap_vision_msgs/DetectorResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Detector-response>)))
  "Returns md5sum for a message object of type '<Detector-response>"
  "828d12a4038cc11efb50c3781f23f856")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Detector-response)))
  "Returns md5sum for a message object of type 'Detector-response"
  "828d12a4038cc11efb50c3781f23f856")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Detector-response>)))
  "Returns full string definition for message of type '<Detector-response>"
  (cl:format cl:nil "Error error~%~%~%================================================================================~%MSG: snap_vision_msgs/Error~%# Language independent enum constants~%uint16 E_OK                    = 0~%uint16 E_MODEL_NOT_UNLOADED    = 1~%uint16 E_MODEL_NOT_LOADED      = 2~%uint16 E_DETECTOR_NOT_FOUND    = 4~%uint16 E_MODEL_NOT_FOUND       = 8~%uint16 E_FILE_NOT_FOUND        = 16~%uint16 E_STUB                  = 65534~%uint16 E_UNKNOWN_ERROR         = 65535~%~%uint16  err_code~%string err_str~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Detector-response)))
  "Returns full string definition for message of type 'Detector-response"
  (cl:format cl:nil "Error error~%~%~%================================================================================~%MSG: snap_vision_msgs/Error~%# Language independent enum constants~%uint16 E_OK                    = 0~%uint16 E_MODEL_NOT_UNLOADED    = 1~%uint16 E_MODEL_NOT_LOADED      = 2~%uint16 E_DETECTOR_NOT_FOUND    = 4~%uint16 E_MODEL_NOT_FOUND       = 8~%uint16 E_FILE_NOT_FOUND        = 16~%uint16 E_STUB                  = 65534~%uint16 E_UNKNOWN_ERROR         = 65535~%~%uint16  err_code~%string err_str~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Detector-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'error))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Detector-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Detector-response
    (cl:cons ':error (error msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Detector)))
  'Detector-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Detector)))
  'Detector-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Detector)))
  "Returns string type for a service object of type '<Detector>"
  "snap_vision_msgs/Detector")