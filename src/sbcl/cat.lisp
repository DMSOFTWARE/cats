#!/usr/bin/sbcl --script

(defun cat0 ()
  (let* ((in (open "../data"))
	 (buffer (make-array 131072 :element-type (stream-element-type in))))
    (loop for read = (read-sequence buffer in)
	  while (let ((res (> read 0))) (write-sequence buffer *standard-output*) res))
    (close in)))

(defun cat1 ()
  (let* ((in (open "../data"))
	 (buffer (make-array 131072 :element-type (stream-element-type in))))
    (loop for read = (read-sequence buffer in)
	  while (plusp read)
	  do (write-sequence buffer *standard-output* :end read))
    (close in)))

(defun cat2 ()
  (let ((buffer (make-array 131072 :element-type '(unsigned-byte 8))))
    (with-open-file
     (in #p"../data" :element-type '(unsigned-byte 8))
     (loop for read = (read-sequence buffer in)
	   while (plusp read)
	   do (write-sequence buffer *standard-output* :end read)))))

(cat2)
