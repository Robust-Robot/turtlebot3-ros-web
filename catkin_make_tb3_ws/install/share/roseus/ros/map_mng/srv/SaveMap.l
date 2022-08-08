;; Auto-generated. Do not edit!


(when (boundp 'map_mng::SaveMap)
  (if (not (find-package "MAP_MNG"))
    (make-package "MAP_MNG"))
  (shadow 'SaveMap (find-package "MAP_MNG")))
(unless (find-package "MAP_MNG::SAVEMAP")
  (make-package "MAP_MNG::SAVEMAP"))
(unless (find-package "MAP_MNG::SAVEMAPREQUEST")
  (make-package "MAP_MNG::SAVEMAPREQUEST"))
(unless (find-package "MAP_MNG::SAVEMAPRESPONSE")
  (make-package "MAP_MNG::SAVEMAPRESPONSE"))

(in-package "ROS")





(defclass map_mng::SaveMapRequest
  :super ros::object
  :slots (_file_name ))

(defmethod map_mng::SaveMapRequest
  (:init
   (&key
    ((:file_name __file_name) "")
    )
   (send-super :init)
   (setq _file_name (string __file_name))
   self)
  (:file_name
   (&optional __file_name)
   (if __file_name (setq _file_name __file_name)) _file_name)
  (:serialization-length
   ()
   (+
    ;; string _file_name
    4 (length _file_name)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _file_name
       (write-long (length _file_name) s) (princ _file_name s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _file_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _file_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass map_mng::SaveMapResponse
  :super ros::object
  :slots (_result ))

(defmethod map_mng::SaveMapResponse
  (:init
   (&key
    ((:result __result) 0)
    )
   (send-super :init)
   (setq _result (round __result))
   self)
  (:result
   (&optional __result)
   (if __result (setq _result __result)) _result)
  (:serialization-length
   ()
   (+
    ;; int32 _result
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _result
       (write-long _result s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _result
     (setq _result (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass map_mng::SaveMap
  :super ros::object
  :slots ())

(setf (get map_mng::SaveMap :md5sum-) "e2f5b05fbc81352bcfb3bfeac378abe2")
(setf (get map_mng::SaveMap :datatype-) "map_mng/SaveMap")
(setf (get map_mng::SaveMap :request) map_mng::SaveMapRequest)
(setf (get map_mng::SaveMap :response) map_mng::SaveMapResponse)

(defmethod map_mng::SaveMapRequest
  (:response () (instance map_mng::SaveMapResponse :init)))

(setf (get map_mng::SaveMapRequest :md5sum-) "e2f5b05fbc81352bcfb3bfeac378abe2")
(setf (get map_mng::SaveMapRequest :datatype-) "map_mng/SaveMapRequest")
(setf (get map_mng::SaveMapRequest :definition-)
      "string file_name
---
int32 result
")

(setf (get map_mng::SaveMapResponse :md5sum-) "e2f5b05fbc81352bcfb3bfeac378abe2")
(setf (get map_mng::SaveMapResponse :datatype-) "map_mng/SaveMapResponse")
(setf (get map_mng::SaveMapResponse :definition-)
      "string file_name
---
int32 result
")



(provide :map_mng/SaveMap "e2f5b05fbc81352bcfb3bfeac378abe2")


