#!/usr/bin/sbcl --script

(defun cat ()
  (let* ((in (open "../data"))
	 (buffer (make-array 131072 :element-type (stream-element-type in))))
    (loop for read = (read-sequence buffer in)
	  ;; while (let ((res (> read 0))) (write-sequence buffer *standard-output*) res)
	  while (plusp read)
	  do (write-sequence buffer *standard-output* :end read))
    (close in)))

(cat)
