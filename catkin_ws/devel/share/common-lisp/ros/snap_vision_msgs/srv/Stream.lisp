; Auto-generated. Do not edit!


(cl:in-package snap_vision_msgs-srv)


;//! \htmlinclude Stream-request.msg.html

(cl:defclass <Stream-request> (roslisp-msg-protocol:ros-message)
  ((topic_name
    :reader topic_name
    :initarg :topic_name
    :type cl:string
    :initform "")
   (queue_size
    :reader queue_size
    :initarg :queue_size
    :type cl:integer
    :initform 0))
)

(cl:defclass Stream-request (<Stream-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Stream-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Stream-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name snap_vision_msgs-srv:<Stream-request> is deprecated: use snap_vision_msgs-srv:Stream-request instead.")))

(cl:ensure-generic-function 'topic_name-val :lambda-list '(m))
(cl:defmethod topic_name-val ((m <Stream-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader snap_vision_msgs-srv:topic_name-val is deprecated.  Use snap_vision_msgs-srv:topic_name instead.")
  (topic_name m))

(cl:ensure-generic-function 'queue_size-val :lambda-list '(m))
(cl:defmethod queue_size-val ((m <Stream-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader snap_vision_msgs-srv:queue_size-val is deprecated.  Use snap_vision_msgs-srv:queue_size instead.")
  (queue_size m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Stream-request>) ostream)
  "Serializes a message object of type '<Stream-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'topic_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'topic_name))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'queue_size)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'queue_size)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'queue_size)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'queue_size)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Stream-request>) istream)
  "Deserializes a message object of type '<Stream-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'topic_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'topic_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'queue_size)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'queue_size)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'queue_size)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'queue_size)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Stream-request>)))
  "Returns string type for a service object of type '<Stream-request>"
  "snap_vision_msgs/StreamRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Stream-request)))
  "Returns string type for a service object of type 'Stream-request"
  "snap_vision_msgs/StreamRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Stream-request>)))
  "Returns md5sum for a message object of type '<Stream-request>"
  "0f745686c18f31265b0311f085eb5f84")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Stream-request)))
  "Returns md5sum for a message object of type 'Stream-request"
  "0f745686c18f31265b0311f085eb5f84")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Stream-request>)))
  "Returns full string definition for message of type '<Stream-request>"
  (cl:format cl:nil "~%string topic_name~%uint32 queue_size~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Stream-request)))
  "Returns full string definition for message of type 'Stream-request"
  (cl:format cl:nil "~%string topic_name~%uint32 queue_size~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Stream-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'topic_name))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Stream-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Stream-request
    (cl:cons ':topic_name (topic_name msg))
    (cl:cons ':queue_size (queue_size msg))
))
;//! \htmlinclude Stream-response.msg.html

(cl:defclass <Stream-response> (roslisp-msg-protocol:ros-message)
  ((error
    :reader error
    :initarg :error
    :type snap_vision_msgs-msg:Error
    :initform (cl:make-instance 'snap_vision_msgs-msg:Error)))
)

(cl:defclass Stream-response (<Stream-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Stream-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Stream-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name snap_vision_msgs-srv:<Stream-response> is deprecated: use snap_vision_msgs-srv:Stream-response instead.")))

(cl:ensure-generic-function 'error-val :lambda-list '(m))
(cl:defmethod error-val ((m <Stream-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader snap_vision_msgs-srv:error-val is deprecated.  Use snap_vision_msgs-srv:error instead.")
  (error m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Stream-response>) ostream)
  "Serializes a message object of type '<Stream-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'error) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Stream-response>) istream)
  "Deserializes a message object of type '<Stream-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'error) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Stream-response>)))
  "Returns string type for a service object of type '<Stream-response>"
  "snap_vision_msgs/StreamResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Stream-response)))
  "Returns string type for a service object of type 'Stream-response"
  "snap_vision_msgs/StreamResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Stream-response>)))
  "Returns md5sum for a message object of type '<Stream-response>"
  "0f745686c18f31265b0311f085eb5f84")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Stream-response)))
  "Returns md5sum for a message object of type 'Stream-response"
  "0f745686c18f31265b0311f085eb5f84")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Stream-response>)))
  "Returns full string definition for message of type '<Stream-response>"
  (cl:format cl:nil "Error error~%~%~%================================================================================~%MSG: snap_vision_msgs/Error~%# Language independent enum constants~%uint16 E_OK                    = 0~%uint16 E_MODEL_NOT_UNLOADED    = 1~%uint16 E_MODEL_NOT_LOADED      = 2~%uint16 E_DETECTOR_NOT_FOUND    = 4~%uint16 E_MODEL_NOT_FOUND       = 8~%uint16 E_FILE_NOT_FOUND        = 16~%uint16 E_STUB                  = 65534~%uint16 E_UNKNOWN_ERROR         = 65535~%~%uint16  err_code~%string err_str~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Stream-response)))
  "Returns full string definition for message of type 'Stream-response"
  (cl:format cl:nil "Error error~%~%~%================================================================================~%MSG: snap_vision_msgs/Error~%# Language independent enum constants~%uint16 E_OK                    = 0~%uint16 E_MODEL_NOT_UNLOADED    = 1~%uint16 E_MODEL_NOT_LOADED      = 2~%uint16 E_DETECTOR_NOT_FOUND    = 4~%uint16 E_MODEL_NOT_FOUND       = 8~%uint16 E_FILE_NOT_FOUND        = 16~%uint16 E_STUB                  = 65534~%uint16 E_UNKNOWN_ERROR         = 65535~%~%uint16  err_code~%string err_str~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Stream-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'error))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Stream-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Stream-response
    (cl:cons ':error (error msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Stream)))
  'Stream-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Stream)))
  'Stream-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Stream)))
  "Returns string type for a service object of type '<Stream>"
  "snap_vision_msgs/Stream")