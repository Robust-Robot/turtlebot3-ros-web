;; Auto-generated. Do not edit!


(when (boundp 'map_mng::GetMaps)
  (if (not (find-package "MAP_MNG"))
    (make-package "MAP_MNG"))
  (shadow 'GetMaps (find-package "MAP_MNG")))
(unless (find-package "MAP_MNG::GETMAPS")
  (make-package "MAP_MNG::GETMAPS"))
(unless (find-package "MAP_MNG::GETMAPSREQUEST")
  (make-package "MAP_MNG::GETMAPSREQUEST"))
(unless (find-package "MAP_MNG::GETMAPSRESPONSE")
  (make-package "MAP_MNG::GETMAPSRESPONSE"))

(in-package "ROS")





(defclass map_mng::GetMapsRequest
  :super ros::object
  :slots (_key ))

(defmethod map_mng::GetMapsRequest
  (:init
   (&key
    ((:key __key) 0)
    )
   (send-super :init)
   (setq _key (round __key))
   self)
  (:key
   (&optional __key)
   (if __key (setq _key __key)) _key)
  (:serialization-length
   ()
   (+
    ;; int32 _key
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _key
       (write-long _key s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _key
     (setq _key (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass map_mng::GetMapsResponse
  :super ros::object
  :slots (_maps ))

(defmethod map_mng::GetMapsResponse
  (:init
   (&key
    ((:maps __maps) (let (r) (dotimes (i 0) (push "" r)) r))
    )
   (send-super :init)
   (setq _maps __maps)
   self)
  (:maps
   (&optional __maps)
   (if __maps (setq _maps __maps)) _maps)
  (:serialization-length
   ()
   (+
    ;; string[] _maps
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _maps)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string[] _maps
     (write-long (length _maps) s)
     (dolist (elem _maps)
       (write-long (length elem) s) (princ elem s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string[] _maps
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _maps (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _maps i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;;
   self)
  )

(defclass map_mng::GetMaps
  :super ros::object
  :slots ())

(setf (get map_mng::GetMaps :md5sum-) "7e5e87a0d74c663ed90922f6efddb3e3")
(setf (get map_mng::GetMaps :datatype-) "map_mng/GetMaps")
(setf (get map_mng::GetMaps :request) map_mng::GetMapsRequest)
(setf (get map_mng::GetMaps :response) map_mng::GetMapsResponse)

(defmethod map_mng::GetMapsRequest
  (:response () (instance map_mng::GetMapsResponse :init)))

(setf (get map_mng::GetMapsRequest :md5sum-) "7e5e87a0d74c663ed90922f6efddb3e3")
(setf (get map_mng::GetMapsRequest :datatype-) "map_mng/GetMapsRequest")
(setf (get map_mng::GetMapsRequest :definition-)
      "int32 key
---
string[] maps
")

(setf (get map_mng::GetMapsResponse :md5sum-) "7e5e87a0d74c663ed90922f6efddb3e3")
(setf (get map_mng::GetMapsResponse :datatype-) "map_mng/GetMapsResponse")
(setf (get map_mng::GetMapsResponse :definition-)
      "int32 key
---
string[] maps
")



(provide :map_mng/GetMaps "7e5e87a0d74c663ed90922f6efddb3e3")


