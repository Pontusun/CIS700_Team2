
(cl:in-package :asdf)

(defsystem "snap_vision_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :sensor_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "BoundingBox" :depends-on ("_package_BoundingBox"))
    (:file "_package_BoundingBox" :depends-on ("_package"))
    (:file "Detection" :depends-on ("_package_Detection"))
    (:file "_package_Detection" :depends-on ("_package"))
    (:file "Error" :depends-on ("_package_Error"))
    (:file "_package_Error" :depends-on ("_package"))
    (:file "DescriptorStamped" :depends-on ("_package_DescriptorStamped"))
    (:file "_package_DescriptorStamped" :depends-on ("_package"))
    (:file "DetectionsStamped" :depends-on ("_package_DetectionsStamped"))
    (:file "_package_DetectionsStamped" :depends-on ("_package"))
    (:file "LabeledImage" :depends-on ("_package_LabeledImage"))
    (:file "_package_LabeledImage" :depends-on ("_package"))
  ))