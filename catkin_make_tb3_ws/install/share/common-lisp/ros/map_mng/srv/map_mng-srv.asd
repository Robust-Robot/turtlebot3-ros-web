
(cl:in-package :asdf)

(defsystem "map_mng-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "GetMaps" :depends-on ("_package_GetMaps"))
    (:file "_package_GetMaps" :depends-on ("_package"))
    (:file "MapGather" :depends-on ("_package_MapGather"))
    (:file "_package_MapGather" :depends-on ("_package"))
    (:file "SaveMap" :depends-on ("_package_SaveMap"))
    (:file "_package_SaveMap" :depends-on ("_package"))
  ))