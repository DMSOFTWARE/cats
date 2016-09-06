#lang racket/base
(require racket/port)

(define buffer-size 131072)

(define (main)
  (display "Running...\n")
  (call-with-input-file "../data"
    (lambda (input-port)
      (copy-port input-port (current-output-port)))))

(main)
