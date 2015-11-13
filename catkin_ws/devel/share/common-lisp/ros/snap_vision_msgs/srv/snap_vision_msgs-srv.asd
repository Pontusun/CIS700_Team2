
(cl:in-package :asdf)

(defsystem "snap_vision_msgs-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :snap_vision_msgs-msg
)
  :components ((:file "_package")
    (:file "Params" :depends-on ("_package_Params"))
    (:file "_package_Params" :depends-on ("_package"))
    (:file "Detector" :depends-on ("_package_Detector"))
    (:file "_package_Detector" :depends-on ("_package"))
    (:file "Models" :depends-on ("_package_Models"))
    (:file "_package_Models" :depends-on ("_package"))
    (:file "Stream" :depends-on ("_package_Stream"))
    (:file "_package_Stream" :depends-on ("_package"))
  ))