; Auto-generated. Do not edit!


(cl:in-package snap_vision_msgs-msg)


;//! \htmlinclude Error.msg.html

(cl:defclass <Error> (roslisp-msg-protocol:ros-message)
  ((err_code
    :reader err_code
    :initarg :err_code
    :type cl:fixnum
    :initform 0)
   (err_str
    :reader err_str
    :initarg :err_str
    :type cl:string
    :initform ""))
)

(cl:defclass Error (<Error>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Error>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Error)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name snap_vision_msgs-msg:<Error> is deprecated: use snap_vision_msgs-msg:Error instead.")))

(cl:ensure-generic-function 'err_code-val :lambda-list '(m))
(cl:defmethod err_code-val ((m <Error>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader snap_vision_msgs-msg:err_code-val is deprecated.  Use snap_vision_msgs-msg:err_code instead.")
  (err_code m))

(cl:ensure-generic-function 'err_str-val :lambda-list '(m))
(cl:defmethod err_str-val ((m <Error>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader snap_vision_msgs-msg:err_str-val is deprecated.  Use snap_vision_msgs-msg:err_str instead.")
  (err_str m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<Error>)))
    "Constants for message type '<Error>"
  '((:E_OK . 0)
    (:E_MODEL_NOT_UNLOADED . 1)
    (:E_MODEL_NOT_LOADED . 2)
    (:E_DETECTOR_NOT_FOUND . 4)
    (:E_MODEL_NOT_FOUND . 8)
    (:E_FILE_NOT_FOUND . 16)
    (:E_STUB . 65534)
    (:E_UNKNOWN_ERROR . 65535))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'Error)))
    "Constants for message type 'Error"
  '((:E_OK . 0)
    (:E_MODEL_NOT_UNLOADED . 1)
    (:E_MODEL_NOT_LOADED . 2)
    (:E_DETECTOR_NOT_FOUND . 4)
    (:E_MODEL_NOT_FOUND . 8)
    (:E_FILE_NOT_FOUND . 16)
    (:E_STUB . 65534)
    (:E_UNKNOWN_ERROR . 65535))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Error>) ostream)
  "Serializes a message object of type '<Error>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'err_code)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'err_code)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'err_str))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'err_str))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Error>) istream)
  "Deserializes a message object of type '<Error>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'err_code)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'err_code)) (cl:read-byte istream))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'err_str) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'err_str) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Error>)))
  "Returns string type for a message object of type '<Error>"
  "snap_vision_msgs/Error")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Error)))
  "Returns string type for a message object of type 'Error"
  "snap_vision_msgs/Error")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Error>)))
  "Returns md5sum for a message object of type '<Error>"
  "667beeea1e0d9ded84d28c9cfb3fe0d4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Error)))
  "Returns md5sum for a message object of type 'Error"
  "667beeea1e0d9ded84d28c9cfb3fe0d4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Error>)))
  "Returns full string definition for message of type '<Error>"
  (cl:format cl:nil "# Language independent enum constants~%uint16 E_OK                    = 0~%uint16 E_MODEL_NOT_UNLOADED    = 1~%uint16 E_MODEL_NOT_LOADED      = 2~%uint16 E_DETECTOR_NOT_FOUND    = 4~%uint16 E_MODEL_NOT_FOUND       = 8~%uint16 E_FILE_NOT_FOUND        = 16~%uint16 E_STUB                  = 65534~%uint16 E_UNKNOWN_ERROR         = 65535~%~%uint16  err_code~%string err_str~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Error)))
  "Returns full string definition for message of type 'Error"
  (cl:format cl:nil "# Language independent enum constants~%uint16 E_OK                    = 0~%uint16 E_MODEL_NOT_UNLOADED    = 1~%uint16 E_MODEL_NOT_LOADED      = 2~%uint16 E_DETECTOR_NOT_FOUND    = 4~%uint16 E_MODEL_NOT_FOUND       = 8~%uint16 E_FILE_NOT_FOUND        = 16~%uint16 E_STUB                  = 65534~%uint16 E_UNKNOWN_ERROR         = 65535~%~%uint16  err_code~%string err_str~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Error>))
  (cl:+ 0
     2
     4 (cl:length (cl:slot-value msg 'err_str))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Error>))
  "Converts a ROS message object to a list"
  (cl:list 'Error
    (cl:cons ':err_code (err_code msg))
    (cl:cons ':err_str (err_str msg))
))
