;; Auto-generated. Do not edit!


(when (boundp 'map_mng::MapGather)
  (if (not (find-package "MAP_MNG"))
    (make-package "MAP_MNG"))
  (shadow 'MapGather (find-package "MAP_MNG")))
(unless (find-package "MAP_MNG::MAPGATHER")
  (make-package "MAP_MNG::MAPGATHER"))
(unless (find-package "MAP_MNG::MAPGATHERREQUEST")
  (make-package "MAP_MNG::MAPGATHERREQUEST"))
(unless (find-package "MAP_MNG::MAPGATHERRESPONSE")
  (make-package "MAP_MNG::MAPGATHERRESPONSE"))

(in-package "ROS")





(defclass map_mng::MapGatherRequest
  :super ros::object
  :slots (_action _params ))

(defmethod map_mng::MapGatherRequest
  (:init
   (&key
    ((:action __action) "")
    ((:params __params) (let (r) (dotimes (i 0) (push "" r)) r))
    )
   (send-super :init)
   (setq _action (string __action))
   (setq _params __params)
   self)
  (:action
   (&optional __action)
   (if __action (setq _action __action)) _action)
  (:params
   (&optional __params)
   (if __params (setq _params __params)) _params)
  (:serialization-length
   ()
   (+
    ;; string _action
    4 (length _action)
    ;; string[] _params
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _params)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _action
       (write-long (length _action) s) (princ _action s)
     ;; string[] _params
     (write-long (length _params) s)
     (dolist (elem _params)
       (write-long (length elem) s) (princ elem s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _action
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _action (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string[] _params
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _params (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _params i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;;
   self)
  )

(defclass map_mng::MapGatherResponse
  :super ros::object
  :slots (_result ))

(defmethod map_mng::MapGatherResponse
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

(defclass map_mng::MapGather
  :super ros::object
  :slots ())

(setf (get map_mng::MapGather :md5sum-) "64a91b5e5c6d91090d88bd8d7fda9226")
(setf (get map_mng::MapGather :datatype-) "map_mng/MapGather")
(setf (get map_mng::MapGather :request) map_mng::MapGatherRequest)
(setf (get map_mng::MapGather :response) map_mng::MapGatherResponse)

(defmethod map_mng::MapGatherRequest
  (:response () (instance map_mng::MapGatherResponse :init)))

(setf (get map_mng::MapGatherRequest :md5sum-) "64a91b5e5c6d91090d88bd8d7fda9226")
(setf (get map_mng::MapGatherRequest :datatype-) "map_mng/MapGatherRequest")
(setf (get map_mng::MapGatherRequest :definition-)
      "string action
string[] params
---
int32 result
")

(setf (get map_mng::MapGatherResponse :md5sum-) "64a91b5e5c6d91090d88bd8d7fda9226")
(setf (get map_mng::MapGatherResponse :datatype-) "map_mng/MapGatherResponse")
(setf (get map_mng::MapGatherResponse :definition-)
      "string action
string[] params
---
int32 result
")



(provide :map_mng/MapGather "64a91b5e5c6d91090d88bd8d7fda9226")


