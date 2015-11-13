; Auto-generated. Do not edit!


(cl:in-package snap_vision_msgs-srv)


;//! \htmlinclude Models-request.msg.html

(cl:defclass <Models-request> (roslisp-msg-protocol:ros-message)
  ((model_names
    :reader model_names
    :initarg :model_names
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element "")))
)

(cl:defclass Models-request (<Models-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Models-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Models-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name snap_vision_msgs-srv:<Models-request> is deprecated: use snap_vision_msgs-srv:Models-request instead.")))

(cl:ensure-generic-function 'model_names-val :lambda-list '(m))
(cl:defmethod model_names-val ((m <Models-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader snap_vision_msgs-srv:model_names-val is deprecated.  Use snap_vision_msgs-srv:model_names instead.")
  (model_names m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<Models-request>)))
    "Constants for message type '<Models-request>"
  '((:ALL . __ALL_MODELS__))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'Models-request)))
    "Constants for message type 'Models-request"
  '((:ALL . __ALL_MODELS__))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Models-request>) ostream)
  "Serializes a message object of type '<Models-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'model_names))))
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
   (cl:slot-value msg 'model_names))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Models-request>) istream)
  "Deserializes a message object of type '<Models-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'model_names) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'model_names)))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Models-request>)))
  "Returns string type for a service object of type '<Models-request>"
  "snap_vision_msgs/ModelsRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Models-request)))
  "Returns string type for a service object of type 'Models-request"
  "snap_vision_msgs/ModelsRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Models-request>)))
  "Returns md5sum for a message object of type '<Models-request>"
  "c85b5652a42141c2735c32a4f6235d0b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Models-request)))
  "Returns md5sum for a message object of type 'Models-request"
  "c85b5652a42141c2735c32a4f6235d0b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Models-request>)))
  "Returns full string definition for message of type '<Models-request>"
  (cl:format cl:nil "~%string ALL = __ALL_MODELS__~%~%string[] model_names~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Models-request)))
  "Returns full string definition for message of type 'Models-request"
  (cl:format cl:nil "~%string ALL = __ALL_MODELS__~%~%string[] model_names~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Models-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'model_names) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Models-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Models-request
    (cl:cons ':model_names (model_names msg))
))
;//! \htmlinclude Models-response.msg.html

(cl:defclass <Models-response> (roslisp-msg-protocol:ros-message)
  ((error
    :reader error
    :initarg :error
    :type snap_vision_msgs-msg:Error
    :initform (cl:make-instance 'snap_vision_msgs-msg:Error)))
)

(cl:defclass Models-response (<Models-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Models-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Models-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name snap_vision_msgs-srv:<Models-response> is deprecated: use snap_vision_msgs-srv:Models-response instead.")))

(cl:ensure-generic-function 'error-val :lambda-list '(m))
(cl:defmethod error-val ((m <Models-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader snap_vision_msgs-srv:error-val is deprecated.  Use snap_vision_msgs-srv:error instead.")
  (error m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Models-response>) ostream)
  "Serializes a message object of type '<Models-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'error) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Models-response>) istream)
  "Deserializes a message object of type '<Models-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'error) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Models-response>)))
  "Returns string type for a service object of type '<Models-response>"
  "snap_vision_msgs/ModelsResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Models-response)))
  "Returns string type for a service object of type 'Models-response"
  "snap_vision_msgs/ModelsResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Models-response>)))
  "Returns md5sum for a message object of type '<Models-response>"
  "c85b5652a42141c2735c32a4f6235d0b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Models-response)))
  "Returns md5sum for a message object of type 'Models-response"
  "c85b5652a42141c2735c32a4f6235d0b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Models-response>)))
  "Returns full string definition for message of type '<Models-response>"
  (cl:format cl:nil "Error error~%~%~%================================================================================~%MSG: snap_vision_msgs/Error~%# Language independent enum constants~%uint16 E_OK                    = 0~%uint16 E_MODEL_NOT_UNLOADED    = 1~%uint16 E_MODEL_NOT_LOADED      = 2~%uint16 E_DETECTOR_NOT_FOUND    = 4~%uint16 E_MODEL_NOT_FOUND       = 8~%uint16 E_FILE_NOT_FOUND        = 16~%uint16 E_STUB                  = 65534~%uint16 E_UNKNOWN_ERROR         = 65535~%~%uint16  err_code~%string err_str~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Models-response)))
  "Returns full string definition for message of type 'Models-response"
  (cl:format cl:nil "Error error~%~%~%================================================================================~%MSG: snap_vision_msgs/Error~%# Language independent enum constants~%uint16 E_OK                    = 0~%uint16 E_MODEL_NOT_UNLOADED    = 1~%uint16 E_MODEL_NOT_LOADED      = 2~%uint16 E_DETECTOR_NOT_FOUND    = 4~%uint16 E_MODEL_NOT_FOUND       = 8~%uint16 E_FILE_NOT_FOUND        = 16~%uint16 E_STUB                  = 65534~%uint16 E_UNKNOWN_ERROR         = 65535~%~%uint16  err_code~%string err_str~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Models-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'error))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Models-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Models-response
    (cl:cons ':error (error msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Models)))
  'Models-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Models)))
  'Models-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Models)))
  "Returns string type for a service object of type '<Models>"
  "snap_vision_msgs/Models")