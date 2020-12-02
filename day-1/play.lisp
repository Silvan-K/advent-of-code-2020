#!/usr/bin/env sbcl --script

  

(let ((infile (open "input" :if-does-not-exist nil)))
  (when infile
    (defvar inlist (loop :for line := (read-line infile nil)
			 :while line
			 :collect line))
    (write inlist)
    ;; (while list
    ;;   (print (car list))
    ;;   (setq list (cdr list)))
    (close infile)))

