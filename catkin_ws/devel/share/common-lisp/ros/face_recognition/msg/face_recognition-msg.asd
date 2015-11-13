
(cl:in-package :asdf)

(defsystem "face_recognition-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Loc" :depends-on ("_package_Loc"))
    (:file "_package_Loc" :depends-on ("_package"))
  ))