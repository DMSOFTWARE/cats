#lang racket/base

(define buffer-size 131072)

(define (main)
  (call-with-input-file "../data"
    (lambda (input-port)
      (let loop ((x (read-bytes buffer-size input-port)))
	(when (not (eof-object? x))
	      (begin
		(display x)
		(loop (read-bytes buffer-size input-port))))))))

(main)
