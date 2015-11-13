; Auto-generated. Do not edit!


(cl:in-package snap_vision_msgs-msg)


;//! \htmlinclude LabeledImage.msg.html

(cl:defclass <LabeledImage> (roslisp-msg-protocol:ros-message)
  ((image
    :reader image
    :initarg :image
    :type sensor_msgs-msg:Image
    :initform (cl:make-instance 'sensor_msgs-msg:Image))
   (detections
    :reader detections
    :initarg :detections
    :type (cl:vector snap_vision_msgs-msg:Detection)
   :initform (cl:make-array 0 :element-type 'snap_vision_msgs-msg:Detection :initial-element (cl:make-instance 'snap_vision_msgs-msg:Detection))))
)

(cl:defclass LabeledImage (<LabeledImage>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LabeledImage>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LabeledImage)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name snap_vision_msgs-msg:<LabeledImage> is deprecated: use snap_vision_msgs-msg:LabeledImage instead.")))

(cl:ensure-generic-function 'image-val :lambda-list '(m))
(cl:defmethod image-val ((m <LabeledImage>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader snap_vision_msgs-msg:image-val is deprecated.  Use snap_vision_msgs-msg:image instead.")
  (image m))

(cl:ensure-generic-function 'detections-val :lambda-list '(m))
(cl:defmethod detections-val ((m <LabeledImage>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader snap_vision_msgs-msg:detections-val is deprecated.  Use snap_vision_msgs-msg:detections instead.")
  (detections m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LabeledImage>) ostream)
  "Serializes a message object of type '<LabeledImage>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'image) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'detections))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'detections))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LabeledImage>) istream)
  "Deserializes a message object of type '<LabeledImage>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'image) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'detections) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'detections)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'snap_vision_msgs-msg:Detection))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LabeledImage>)))
  "Returns string type for a message object of type '<LabeledImage>"
  "snap_vision_msgs/LabeledImage")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LabeledImage)))
  "Returns string type for a message object of type 'LabeledImage"
  "snap_vision_msgs/LabeledImage")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LabeledImage>)))
  "Returns md5sum for a message object of type '<LabeledImage>"
  "64cd3e5e867e8e8648a34ec6f85ed84c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LabeledImage)))
  "Returns md5sum for a message object of type 'LabeledImage"
  "64cd3e5e867e8e8648a34ec6f85ed84c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LabeledImage>)))
  "Returns full string definition for message of type '<LabeledImage>"
  (cl:format cl:nil "sensor_msgs/Image image~%Detection[] detections~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of cameara~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: snap_vision_msgs/Detection~%string label~%BoundingBox bbox~%float32 confidence~%~%================================================================================~%MSG: snap_vision_msgs/BoundingBox~%float32 x~%float32 y~%float32 width~%float32 height~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LabeledImage)))
  "Returns full string definition for message of type 'LabeledImage"
  (cl:format cl:nil "sensor_msgs/Image image~%Detection[] detections~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of cameara~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: snap_vision_msgs/Detection~%string label~%BoundingBox bbox~%float32 confidence~%~%================================================================================~%MSG: snap_vision_msgs/BoundingBox~%float32 x~%float32 y~%float32 width~%float32 height~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LabeledImage>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'image))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'detections) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LabeledImage>))
  "Converts a ROS message object to a list"
  (cl:list 'LabeledImage
    (cl:cons ':image (image msg))
    (cl:cons ':detections (detections msg))
))
